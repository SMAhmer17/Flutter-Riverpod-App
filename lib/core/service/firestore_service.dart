
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod_template/core/utils/app_logger.dart';


class FirestoreService {

  final FirebaseFirestore _db;
  FirestoreService({required FirebaseFirestore firestore}) : _db = firestore;

  // ————————————————— Document — Read —————————————————

  /// Returns the document at [collection]/[docId] as a map, or `null` if it doesn't exist.
  Future<Map<String, dynamic>?> getDocument(
    String collection,
    String docId,
  ) async {
    try {
      AppLogger.info('Firestore GET $collection/$docId');
      final snap = await _docRef(collection, docId).get();
      if (!snap.exists) return null;
      AppLogger.success('Firestore GET $collection/$docId — found');
      return snap.data();
    } on FirebaseException catch (e, st) {
      _logError('GET', '$collection/$docId', e, st);
      rethrow;
    }
  }

  /// Returns a real-time stream of [collection]/[docId].
  Stream<Map<String, dynamic>?> documentStream(
    String collection,
    String docId,
  ) {
    AppLogger.info('Firestore STREAM $collection/$docId');
    return _docRef(collection, docId).snapshots().map((snap) {
      return snap.exists ? snap.data() : null;
    });
  }

  // ————————————————— Document — Write —————————————————

  /// Adds a new document with an auto-generated ID and returns it.
  Future<String> addDocument(
    String collection,
    Map<String, dynamic> data,
  ) async {
    try {
      AppLogger.info('Firestore ADD $collection');
      final ref = await _colRef(collection).add(_withTimestamp(data));
      AppLogger.success('Firestore ADD $collection — id: ${ref.id}');
      return ref.id;
    } on FirebaseException catch (e, st) {
      _logError('ADD', collection, e, st);
      rethrow;
    }
  }

  /// Sets [collection]/[docId]. Overwrites by default; pass [merge] to merge fields.
  Future<void> setDocument(
    String collection,
    String docId,
    Map<String, dynamic> data, {
    bool merge = false,
  }) async {
    try {
      AppLogger.info('Firestore SET $collection/$docId (merge: $merge)');
      await _docRef(collection, docId).set(
        _withTimestamp(data),
        SetOptions(merge: merge),
      );
      AppLogger.success('Firestore SET $collection/$docId');
    } on FirebaseException catch (e, st) {
      _logError('SET', '$collection/$docId', e, st);
      rethrow;
    }
  }

  /// Partially updates [collection]/[docId] — only the provided [data] fields are touched.
  Future<void> updateDocument(
    String collection,
    String docId,
    Map<String, dynamic> data,
  ) async {
    try {
      AppLogger.info('Firestore UPDATE $collection/$docId');
      await _docRef(collection, docId).update({
        ...data,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      AppLogger.success('Firestore UPDATE $collection/$docId');
    } on FirebaseException catch (e, st) {
      _logError('UPDATE', '$collection/$docId', e, st);
      rethrow;
    }
  }

  /// Deletes [collection]/[docId].
  Future<void> deleteDocument(String collection, String docId) async {
    try {
      AppLogger.info('Firestore DELETE $collection/$docId');
      await _docRef(collection, docId).delete();
      AppLogger.success('Firestore DELETE $collection/$docId');
    } on FirebaseException catch (e, st) {
      _logError('DELETE', '$collection/$docId', e, st);
      rethrow;
    }
  }

  // ————————————————— Collection — Read —————————————————

  /// Fetches all documents in [collection].
  /// Pass [queryBuilder] to filter/order/limit results.
  ///
  /// ```dart
  /// final orders = await service.getCollection(
  ///   'orders',
  ///   queryBuilder: (q) => q.where('userId', isEqualTo: uid).orderBy('createdAt', descending: true),
  /// );
  /// ```
  Future<List<Map<String, dynamic>>> getCollection(
    String collection, {
    Query<Map<String, dynamic>> Function(
            CollectionReference<Map<String, dynamic>>)?
        queryBuilder,
  }) async {
    try {
      AppLogger.info('Firestore GET_COLLECTION $collection');
      final ref = _colRef(collection);
      final query = queryBuilder != null ? queryBuilder(ref) : ref;
      final snap = await query.get();
      AppLogger.success('Firestore GET_COLLECTION $collection — ${snap.docs.length} docs');
      return snap.docs.map((d) => {'id': d.id, ...d.data()}).toList();
    } on FirebaseException catch (e, st) {
      _logError('GET_COLLECTION', collection, e, st);
      rethrow;
    }
  }

  /// Returns a real-time stream of [collection].
  /// Pass [queryBuilder] to filter/order/limit results.
  Stream<List<Map<String, dynamic>>> collectionStream(
    String collection, {
    Query<Map<String, dynamic>> Function(
            CollectionReference<Map<String, dynamic>>)?
        queryBuilder,
  }) {
    AppLogger.info('Firestore STREAM_COLLECTION $collection');
    final ref = _colRef(collection);
    final query = queryBuilder != null ? queryBuilder(ref) : ref;
    return query
        .snapshots()
        .map((snap) => snap.docs.map((d) => {'id': d.id, ...d.data()}).toList());
  }

  // ————————————————— Subcollection —————————————————

  /// Fetches all documents in a subcollection at [parentCollection]/[parentId]/[subCollection].
  Future<List<Map<String, dynamic>>> getSubCollection(
    String parentCollection,
    String parentId,
    String subCollection, {
    Query<Map<String, dynamic>> Function(
            CollectionReference<Map<String, dynamic>>)?
        queryBuilder,
  }) async {
    try {
      final path = '$parentCollection/$parentId/$subCollection';
      AppLogger.info('Firestore GET_SUBCOLLECTION $path');
      final ref = _db.collection(path).withConverter<Map<String, dynamic>>(
            fromFirestore: (s, _) => s.data() ?? {},
            toFirestore: (d, _) => d,
          );
      final query = queryBuilder != null ? queryBuilder(ref) : ref;
      final snap = await query.get();
      AppLogger.success('Firestore GET_SUBCOLLECTION $path — ${snap.docs.length} docs');
      return snap.docs.map((d) => {'id': d.id, ...d.data()}).toList();
    } on FirebaseException catch (e, st) {
      _logError('GET_SUBCOLLECTION', '$parentCollection/$parentId/$subCollection', e, st);
      rethrow;
    }
  }

  // ————————————————— Batch —————————————————

  /// Runs multiple writes atomically. All succeed or all fail.
  ///
  /// ```dart
  /// await service.runBatch((batch) {
  ///   batch.set(service.docRef('users', uid), data);
  ///   batch.delete(service.docRef('invites', inviteId));
  /// });
  /// ```
  Future<void> runBatch(
    void Function(WriteBatch batch) operations,
  ) async {
    try {
      AppLogger.info('Firestore BATCH start');
      final batch = _db.batch();
      operations(batch);
      await batch.commit();
      AppLogger.success('Firestore BATCH committed');
    } on FirebaseException catch (e, st) {
      _logError('BATCH', 'commit', e, st);
      rethrow;
    }
  }

  // ————————————————— Transaction —————————————————

  /// Runs [handler] inside a Firestore transaction.
  /// Use when reads and writes must be atomic.
  ///
  /// ```dart
  /// await service.runTransaction((txn) async {
  ///   final snap = await txn.get(service.docRef('wallets', uid));
  ///   final balance = (snap.data()?['balance'] ?? 0) - amount;
  ///   txn.update(service.docRef('wallets', uid), {'balance': balance});
  /// });
  /// ```
  Future<T> runTransaction<T>(
    Future<T> Function(Transaction txn) handler,
  ) async {
    try {
      AppLogger.info('Firestore TRANSACTION start');
      final result = await _db.runTransaction(handler);
      AppLogger.success('Firestore TRANSACTION committed');
      return result;
    } on FirebaseException catch (e, st) {
      _logError('TRANSACTION', 'commit', e, st);
      rethrow;
    }
  }

  // ————————————————— Ref Accessors —————————————————

  /// Exposes a raw [DocumentReference] — useful inside batch/transaction handlers.
  DocumentReference<Map<String, dynamic>> docRef(
          String collection, String docId) =>
      _docRef(collection, docId);

  /// Exposes a raw [CollectionReference] — useful for advanced queries.
  CollectionReference<Map<String, dynamic>> colRef(String collection) =>
      _colRef(collection);

  // ————————————————— Private Helpers —————————————————

  DocumentReference<Map<String, dynamic>> _docRef(
          String collection, String docId) =>
      _db.collection(collection).doc(docId);

  CollectionReference<Map<String, dynamic>> _colRef(String collection) =>
      _db.collection(collection);

  /// Injects [createdAt] on new documents only if the key is not already set.
  Map<String, dynamic> _withTimestamp(Map<String, dynamic> data) => {
        'createdAt': FieldValue.serverTimestamp(),
        ...data,
      };

  void _logError(
    String op,
    String path,
    FirebaseException e,
    StackTrace st,
  ) {
    AppLogger.error(
      'Firestore $op $path — [${e.code}] ${e.message}',
      e,
      st,
    );
  }
}
