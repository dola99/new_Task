import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_task/model/user_model.dart';
import 'package:simple_task/repo/facebook_repo.dart';
import 'package:simple_task/repo/google_repo.dart';
import 'package:simple_task/screens/setting_page.dart';

class LoginProvider extends ChangeNotifier {
  late User _user;
  bool _isloading = false;

  bool get isLoading => _isloading;
  User get user => _user;
  static LoginProvider of(BuildContext context, {bool listen = false}) {
    if (listen) return context.watch<LoginProvider>();
    return context.read<LoginProvider>();
  }

  Future<void> googleSignin(BuildContext context) async {
    _isloading = true;
    notifyListeners();
    try {
      await GoogleRepositry()
          .handleSignIn()
          .then((value) => _user = User(methodOfLogin: 'google', name: value));
      _isloading = false;
      notifyListeners();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SettingPage()),
          (route) => false);
    } catch (error) {
      _isloading = false;
      notifyListeners();
   
    }
  }

  Future<void> facebookSignin(BuildContext context) async {
    _isloading = true;
    notifyListeners();
    await FacbookRepositiry()
        .facebookLogin()
        .then((value) => _user = User(methodOfLogin: 'facebook', name: value));
    _isloading = false;
    notifyListeners();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SettingPage()),
        (route) => false);
  }
}
