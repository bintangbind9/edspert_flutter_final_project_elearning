import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthService {
  Future<User?> signInWithGoogle();
  Future<User?> signInWithFacebook();
  Future<User?> signInWithApple();
  Future<bool> signOut();
  bool isUserSignedIn();
  String? getCurrentSignedInUserEmail();
}