class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String photoUrl;

  UserModel(
      {required this.email,
      required this.photoUrl,
      required this.uid,
      required this.displayName});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'],
        photoUrl: map['photoUrl'],
        uid: map['uid'],
        displayName: map['displayName']);
  }

  Map<String,dynamic> toMap(){
    return {
      'uid':uid,
      'email':email,
      'displayName':displayName,
      'photoUrl':photoUrl,
    };
  }
}
