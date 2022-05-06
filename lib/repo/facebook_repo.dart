import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacbookRepositiry {
  late LoginResult result;
  Future<dynamic> facebookLogin() async {
    result = await FacebookAuth.instance.login(permissions: ['public_profile']);
    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData(fields: "name");
      return userData['name'];
    } else {}
  }
}
