import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRealm with ChangeNotifier {
  final app = App(AppConfiguration("application-1-rckhlho"));
  User? user;

  Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  Future<void> clearUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
  }

  Future<void> checkLoggedInUser() async {
    final userId = await getUserId();
    if (userId != null) {
      user = app.currentUser;
      notifyListeners();
    }
  }

  Future<void> register(String email, String password) async {
    try {
      EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(app);
      await authProvider.registerUser(email, password);
      user = app.currentUser;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final emailPwCredentials = Credentials.emailPassword(email, password);
      user = await app.logIn(emailPwCredentials);
      if (user != null) {
        await saveUserId(user!.id);
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await user!.logOut();
      await clearUserId();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
