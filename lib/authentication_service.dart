import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
    Future<String> SignIn({String email,String Password}) async {
      {
        try {
          await _firebaseAuth.signInWithEmailAndPassword(email: email, password: Password);
          return "signed In";
        }
        on FirebaseAuthException
      catch(e)
      {
        return e.message;
      }
  
  
    }
  }
  Future<String> SignUp({String email,String Password}) async {
    {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: Password);
        return "Signed Up";
      }
      on FirebaseAuthException
      catch (e) {
        return e.message;
      }
    }
  }

}
