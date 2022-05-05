import 'package:firebase_auth/firebase_auth.dart';
import 'package:nuntium_news_app/utils/widgets/toast.dart';

class Auth {
  // initializing the object
  FirebaseAuth auth = FirebaseAuth.instance;

  // getter for user object from Auth package itself
  User? get user => auth.currentUser;

  // sign in
  Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      showErrorToast(error.toString());
      return;
    }
  }

  // sign up
  Future<void> signUp(String email, String password, String username) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await user!.updateDisplayName(username);
    } on FirebaseAuthException catch (error) {
      showErrorToast(error.toString());
    }
  }

  // signOut
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (error) {
      showErrorToast(error.toString());
    }
  }

  // reset password email
  // need more info here [confrimPasswordReset]
  Future<void> forgotPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      showErrorToast(error.toString());
    }
  }
}
