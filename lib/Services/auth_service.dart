import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signinWithEmail(String email, String pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      return userCredential.user;
    } catch (e) {
      print('Error ${e.toString}');
      return null;
    }
  }

  Future<User?> registerWithEmail(String email, String pass) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);
      return userCredential.user;
    } catch (e) {
      print('Error ${e.toString}');
      return null;
    }
  }

  Future<void> signOut() async {
    _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
