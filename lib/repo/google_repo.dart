import 'package:google_sign_in/google_sign_in.dart';

class GoogleRepositry {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<dynamic> handleSignIn() async {
    
      await _googleSignIn.signIn();
      
      return _googleSignIn.currentUser?.displayName;
    
  }
}
