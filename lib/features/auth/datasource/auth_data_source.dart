// ————————————————— Dependencies —————————————————

import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// ————————————————— Auth Data Source —————————————————

class AuthDataSource {
  // ————————————————— Fields —————————————————

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  // ————————————————— Constructor —————————————————

  AuthDataSource({
    required FirebaseAuth auth,
    GoogleSignIn? googleSignIn,
  })  : _auth = auth,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  // ————————————————— Auth State Stream —————————————————

  /// Emits a [User] whenever the auth state changes (sign-in / sign-out).
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // ————————————————— Email & Password —————————————————

  /// Signs in an existing user with [email] and [password].
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      rethrow;
    }
  }

  /// Creates a new account with [email] and [password].
  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      rethrow;
    }
  }

  /// Sends a password-reset email to [email].
  Future<void> forgotPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  // ————————————————— Google Sign-In —————————————————

  /// Opens the Google sign-in flow and authenticates with Firebase.
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'sign-in-cancelled',
          message: 'Google sign-in was cancelled by the user.',
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  // ————————————————— Apple Sign-In —————————————————

  /// Opens the Apple sign-in flow and authenticates with Firebase.
  /// A SHA-256 nonce is used to prevent replay attacks.
  Future<UserCredential> signInWithApple() async {
    try {
      final String rawNonce = _generateNonce();
      final String nonce = _sha256ofString(rawNonce);

      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final OAuthCredential oauthCredential =
          OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      return await _auth.signInWithCredential(oauthCredential);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  // ————————————————— Phone Auth —————————————————

  /// Sends an OTP to [phoneNumber] and triggers the appropriate callbacks.
  ///
  /// - [verificationCompleted] – auto-retrieval or instant verification on Android.
  /// - [verificationFailed]    – called when verification fails.
  /// - [codeSent]              – called when the SMS code has been sent; provides
  ///                             [verificationId] and an optional [resendToken].
  /// - [codeAutoRetrievalTimeout] – called when auto-retrieval times out.
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String verificationId, int? resendToken) codeSent,
    required void Function(String verificationId) codeAutoRetrievalTimeout,
    int? resendToken,
    Duration timeout = const Duration(seconds: 60),
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        forceResendingToken: resendToken,
        timeout: timeout,
      );
    } on FirebaseAuthException {
      rethrow;
    }
  }

  /// Verifies the [smsCode] against [verificationId] and signs the user in.
  Future<UserCredential> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  // ————————————————— Anonymous Sign-In —————————————————

  /// Signs the user in anonymously, creating a temporary Firebase account.
  Future<UserCredential> signInAnonymously() async {
    try {
      return await _auth.signInAnonymously();
    } on FirebaseAuthException {
      rethrow;
    }
  }

  // ————————————————— Account Management —————————————————

  /// Re-authenticates the current user with [email] and [password].
  /// Must be called before sensitive operations (delete, password change)
  /// when the user's session is stale.
  Future<UserCredential> reauthenticateWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final User? user = _auth.currentUser;

      if (user == null) {
        throw FirebaseAuthException(
          code: 'no-current-user',
          message: 'No authenticated user found to re-authenticate.',
        );
      }

      final AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      return await user.reauthenticateWithCredential(credential);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  /// Permanently deletes the current user's Firebase account.
  /// Re-authentication may be required before calling this.
  Future<void> deleteAccount() async {
    try {
      final User? user = _auth.currentUser;

      if (user == null) {
        throw FirebaseAuthException(
          code: 'no-current-user',
          message: 'No authenticated user found to delete.',
        );
      }

      await user.delete();
    } on FirebaseAuthException {
      rethrow;
    }
  }

  /// Signs the current user out of Firebase (and Google if applicable).
  Future<void> signOut() async {
    try {
      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  // ————————————————— Private Helpers —————————————————

  /// Generates a cryptographically secure random nonce string of [length] chars.
  String _generateNonce([int length = 32]) {
    const String charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final Random random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the SHA-256 hex digest of [input].
  String _sha256ofString(String input) {
    final List<int> bytes = utf8.encode(input);
    final Digest digest = sha256.convert(bytes);
    return digest.toString();
  }
}
