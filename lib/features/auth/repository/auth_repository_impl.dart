// ————————————————— Dependencies —————————————————

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod_template/core/exceptions/app_exception.dart';
import 'package:flutter_riverpod_template/features/auth/datasource/auth_data_source.dart';
import 'package:flutter_riverpod_template/features/auth/repository/auth_repository.dart';

// ————————————————— Auth Repository Impl —————————————————

class AuthRepositoryImpl implements AuthRepository {
  // ————————————————— Fields —————————————————

  final AuthDataSource _dataSource;

  // ————————————————— Constructor —————————————————

  AuthRepositoryImpl({required AuthDataSource dataSource})
      : _dataSource = dataSource;

  // ————————————————— Auth State —————————————————

  @override
  Stream<User?> get authStateChanges => _dataSource.authStateChanges;

  // ————————————————— Email & Password —————————————————

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) => _run(
        () => _dataSource.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) => _run(
        () => _dataSource.signUpWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );

  @override
  Future<void> forgotPassword({required String email}) =>
      _run(() => _dataSource.forgotPassword(email: email));

  // ————————————————— Social Sign-In —————————————————

  @override
  Future<void> signInWithGoogle() =>
      _run(() => _dataSource.signInWithGoogle());

  @override
  Future<void> signInWithApple() =>
      _run(() => _dataSource.signInWithApple());

  // ————————————————— Phone Auth —————————————————

  @override
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String verificationId, int? resendToken) codeSent,
    required void Function(String verificationId) codeAutoRetrievalTimeout,
    int? resendToken,
    Duration timeout = const Duration(seconds: 60),
  }) => _run(
        () => _dataSource.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
          resendToken: resendToken,
          timeout: timeout,
        ),
      );

  @override
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) => _run(
        () => _dataSource.verifyOtp(
          verificationId: verificationId,
          smsCode: smsCode,
        ),
      );

  // ————————————————— Anonymous —————————————————

  @override
  Future<void> signInAnonymously() =>
      _run(() => _dataSource.signInAnonymously());

  // ————————————————— Account Management —————————————————

  @override
  Future<void> reauthenticateWithEmailAndPassword({
    required String email,
    required String password,
  }) => _run(
        () => _dataSource.reauthenticateWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );

  @override
  Future<void> deleteAccount() => _run(() => _dataSource.deleteAccount());

  @override
  Future<void> signOut() => _run(() => _dataSource.signOut());

  // ————————————————— Private Helper —————————————————

  /// Runs [call], maps [FirebaseAuthException] → [AppException.firebase],
  /// and wraps everything else as [AppException.unknown].
  Future<void> _run(Future<Object?> Function() call) async {
    try {
      await call();
    } on FirebaseAuthException catch (e) {
      throw AppException.firebase(
        code: e.code,
        message: _mapFirebaseCode(e.code),
      );
    } catch (e) {
      throw AppException.unknown(
        message: 'Something went wrong.',
        error: e,
      );
    }
  }

  // ————————————————— Firebase Code Mapping —————————————————

  String _mapFirebaseCode(String code) => switch (code) {
        'user-not-found'           => 'No account found for this email.',
        'wrong-password'           => 'Incorrect password.',
        'invalid-credential'       => 'Invalid credentials. Please try again.',
        'email-already-in-use'     => 'An account already exists for this email.',
        'weak-password'            => 'Password is too weak.',
        'invalid-email'            => 'The email address is not valid.',
        'user-disabled'            => 'This account has been disabled.',
        'too-many-requests'        => 'Too many attempts. Please try again later.',
        'network-request-failed'   => 'No internet connection.',
        'sign-in-cancelled'        => 'Sign-in was cancelled.',
        'account-exists-with-different-credential' =>
          'An account already exists with a different sign-in method.',
        _                          => 'Something went wrong.',
      };
}
