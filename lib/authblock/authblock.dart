import 'package:artlar/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc {
  final authService = AuthService();
  final googleSignIn = GoogleSignIn(scopes: ['email']);
  Stream<User> get currentUser => authService.currentUser;
  loginGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      //Entrar en Firebase
      final result = await authService.sinInWhitCredential(credential);

      print('${result.user.email}');
    } catch (error) {
      print(error);
    }
  }

  logout() {
    authService.logout();
  }
}