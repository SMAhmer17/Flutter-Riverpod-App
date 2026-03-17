// ————————————————— Dependencies —————————————————

import 'package:firebase_auth/firebase_auth.dart';

// ————————————————— Auth Repository —————————————————

/// Contract for all authentication operations.
/// The UI and providers depend only on this abstraction.
abstract interface class AuthRepository {
  // ————————————————— Auth State —————————————————

  Stream<User?> get authStateChanges;

  // ————————————————— Email & Password —————————————————

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> forgotPassword({required String email});

  // ————————————————— Social Sign-In —————————————————

  Future<void> signInWithGoogle();

  Future<void> signInWithApple();

  // ————————————————— Phone Auth —————————————————

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String verificationId, int? resendToken) codeSent,
    required void Function(String verificationId) codeAutoRetrievalTimeout,
    int? resendToken,
    Duration timeout = const Duration(seconds: 60),
  });

  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  });

  // ————————————————— Anonymous —————————————————

  Future<void> signInAnonymously();

  // ————————————————— Account Management —————————————————

  Future<void> reauthenticateWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> deleteAccount();

  Future<void> signOut();
}
