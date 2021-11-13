import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geek/Core/data/models/models.dart';
import 'package:geek/Core/misc/Extra/CustomToast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool autoValidate = false;
  bool loading = false;
  bool isLoggedIn = false;
  User user;

  String selectedCategory;

  String _message;
  String _errorMessage;

  String get errorMessage => _errorMessage;

  setCategory(value) {
    selectedCategory = value;
    notifyListeners();
  }

  setmessage(value) {
    _message = value;
    notifyListeners();
  }

  setErrorMessage(value) {
    _errorMessage = value;
    notifyListeners();
  }

  get message {
    return this._message;
  }

  setAutoValidate(value) {
    autoValidate = value;
    notifyListeners();
  }

  setLoading(value) {
    loading = value;
    notifyListeners();
  }

  Future signUp(name, email, password, phone, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      print('signUp was called');
      user = User(
          category: selectedCategory,
          name: name,
          email: email,
          phone: phone,
          password: password);
      var s = json.encode(user);
      prefs.setString('user', s);
      print(s);
      notifyListeners();
      Navigator.of(context).pushNamed('/login');
    } catch (e) {
      print(e);
      setLoading(false);
    }
  }

  logIn(name, password, context) async {
    setLoading(true);
    // Future.delayed(Duration(seconds: 5));
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var s = prefs.getString('user') ?? "";
      User user = User.fromJson(json.decode(s));

      print('Login was called');
      if (user.name == name && user.password == password) {
        Navigator.of(context).pushNamed('/land');
        setLoading(false);
      } else {
        setLoading(false);
        showErrorToast('Invalid Credentials');
      }

      notifyListeners();
    } catch (e) {
      // setmessage(e.message);
      showErrorToast(e.toString());
      print(e);
      setLoading(false);
      // notifyListeners();
    }
  }
}
