import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future SignIn({required String email, required String password}) async {
    try {
        await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        return "Deu";
    } on FirebaseAuthException catch(e){
      print(e.toString());
      return null;
    }
  }

  Future ChangePassword({required String newPassword, required String password}) async {

    final user = await FirebaseAuth.instance.currentUser;
    AuthCredential cred = EmailAuthProvider.credential(
        email: 'pato.burguer.mob4@gmail.com', password: password);

    await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(cred);
    try {
      await user!.updatePassword(newPassword);
      return "Sim";
    } on FirebaseAuthException catch(e){
      return null;
    }
  }

  Future<String?> ResetPassword() async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: 'pato.burguer.mob4@gmail.com');
      return "Request enviada";
    } on FirebaseAuthException catch(e){
      return e.message;
    }
  }
}