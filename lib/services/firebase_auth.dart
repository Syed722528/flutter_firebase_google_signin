import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_google_signin/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  //-------------------------Method to create user with Email----------------------------//

  Future<UserModel> createUser(String email, String password)async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;

      return UserModel.fromMap({
        'uid':user.uid,
        'email':user.email,
        'userName':user.displayName,
        'imageUrl':user.photoURL, // User can add image later on
      }) ;
    }catch(e){
      print(e.toString());
      return Future.error(e);
    }
  }

  //---------------------------------Method to get current user-----------------------------//
  UserModel getCurrentUser(){
    User user = _auth.currentUser!;
    return UserModel.fromMap({
      'uid':user.uid,
      'email':user.email,
      'displayName':user.displayName,
      'photoUrl':user.photoURL,
    });
  }
}
