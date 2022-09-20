import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;

  UdUser? _uduserFromUser(User? user) {
    if(user != null)
        return UdUser(user.uid);
    return null;
  }
  Future signInEmailAndPass(String email, String password) async {
    try{
      UserCredential authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = authResult.user;
      return _uduserFromUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }
  Future signUpWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = authResult.user;
      return _uduserFromUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }

  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}