// ————————————————— Dependencies —————————————————

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/features/auth/datasource/auth_data_source.dart';
import 'package:flutter_riverpod_template/features/auth/repository/auth_repository.dart';
import 'package:flutter_riverpod_template/features/auth/repository/auth_repository_impl.dart';

// ————————————————— Firebase Services —————————————————

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (_) => FirebaseAuth.instance,
);

final firestoreProvider = Provider<FirebaseFirestore>(
  (_) => FirebaseFirestore.instance,
);

final firebaseStorageProvider = Provider<FirebaseStorage>(
  (_) => FirebaseStorage.instance,
);

// ————————————————— Auth DataSource —————————————————

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSource(auth: ref.watch(firebaseAuthProvider));
});

// ————————————————— Auth Repository —————————————————

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    dataSource: ref.watch(authDataSourceProvider),
  );
});

// ————————————————— Auth State Stream —————————————————

/// Emits [User?] whenever the Firebase auth state changes.
/// `null`  → user is signed out.
/// non-null → user is signed in.
final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});
