import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_google_signin/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //------------------- Auth method with Google----------------------------//

  Future<UserModel> signInWithGoogle() async {
    try {
      await GoogleSignIn().signOut(); // So user always select to choose which google account to contiue with
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Check if the user cancelled the sign-in
      if (googleUser == null) {
        return Future.error("Sign in aborted by user.");
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);
      User user = result.user!;

      return UserModel.fromMap({
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'photoUrl': user.photoURL,
      });
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return Future.error(e.message!);
    }
  }

  //-------------------------Method to create user with Email----------------------------//

  Future<UserModel> createUserwithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;

      return UserModel.fromMap({
        'uid': user.uid,
        'email': user.email,
        'userName': user.displayName, // User can add later on
        'imageUrl': user.photoURL, // User can add image later on
      });
    } on FirebaseAuthException catch (e) {
      print(e.toString());

      return Future.error(e.message!);
    }
  }

  //---------------------------------Method to get current user-----------------------------//
  UserModel getCurrentUser() {
    User user = _auth.currentUser!;
    return UserModel.fromMap({
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName,
      'photoUrl': user.photoURL,
    });
  }

  //---------------------------------Method to Sign in user with email and password----------------//

  Future<UserModel> signInUserWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;

      return UserModel.fromMap({
        'uid': user.uid,
        'email': user.email,
        'photoUrl': user.photoURL,
        'displayName': user.displayName,
      });
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return Future.error(e.message!);
    }
  }

  //-----------------------------------Method to log out user------------------------//
  static Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message!);
    }
  }
}
