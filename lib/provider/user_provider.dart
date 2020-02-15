import 'dart:ffi';
import 'dart:convert';
import 'package:community/config/conf.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/User.dart';
import '../models/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String _token;
  String _userId;
  String _username;

  String _firstname;
  String _lastname;
  String _email;

  bool get isAuth {
    return _token != null;
  }

  String get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    if (_userId != null) {
      return _userId;
    }
    return null;
  }

  Future<void> signup(String username, String firstname, String lastname,
      String email, String password) async {
    const url = '192.168.3.207:8080';
    const userHeader = {"Content-type": "application/json"};
    Map bodyUser = {
      'username': username,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password
    };
    try {
      final result = await http.post(new Uri.http(url, "api/users/register"),
          body: json.encode(bodyUser), headers: userHeader);

      final resultData = json.decode(result.body);
      if (resultData['success'] == true) {
        _token = resultData['token'];
        final userResult = resultData['user'];
        _userId = userResult['_id'];
        _username = userResult['username'];
        _firstname = userResult['firstname'];
        _lastname = userResult['lastname'];
        _email = userResult['email'];
        _saveUserData(
            _token, _userId, _username, _firstname, _lastname, _email);
      } else {
        throw HttpException(resultData['msg']);
      }
    } catch (e) {
      throw e;
    }

    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    final bodyUser = {'username': username, 'password': password};
    final userHeader = {"Content-type": "application/json"};

    try {
      final result = await http.post(
          new Uri.http('192.168.3.207:8080', 'api/users/authenticate'),
          body: json.encode(bodyUser),
          headers: userHeader);

      final resultData = json.decode(result.body);

      if (resultData['success'] == true) {
        _token = resultData['token'];
        final userResult = resultData['user'];
        _userId = userResult['_id'];
        _username = userResult['username'];
        _firstname = userResult['firstname'];
        _lastname = userResult['lastname'];
        _email = userResult['email'];
        // _saveUserData(
        //     _token, _userId, _username, _firstname, _lastname, _email);

        final prefs = await SharedPreferences.getInstance();
        final key = 'userDate';
        final userData = json.encode({
          'token': _token,
          'userId': _userId,
          'username': _username,
          'firstname': _firstname,
          'lastname': _lastname,
          'email': _email,
        });
        print(userData);
        prefs.setString(key, userData);

        // final extractedUserData =
        //     json.decode(prefs.getString('userData')) as Map;
        // print(extractedUserData);
      } else {
        throw HttpException(resultData['msg']);
      }
    } catch (e) {
      throw e;
    }

    notifyListeners();
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _username = null;
    _firstname = null;
    _lastname = null;
    _email = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userDate';
    if (!prefs.containsKey('userDate')) {
      return false;
    }
    final extractedUserData = json.decode(prefs.getString(key)) as Map;
    print(extractedUserData);
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _username = extractedUserData['username'];
    _firstname = extractedUserData['firstname'];
    _lastname = extractedUserData['lastname'];
    _email = extractedUserData['email'];
    notifyListeners();
    return true;
  }

  _saveUserData(String token, String userId, String username, String firstname,
      String lastname, String email) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userDate';
    final userData = json.encode({
      'token': token,
      'userId': userId,
      'username': username,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
    });

    prefs.setString(key, userData);
  }
}
