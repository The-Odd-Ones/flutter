import 'dart:ffi';
import 'dart:convert';
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

  String _firstName;
  String _lastName;
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

  Future<void> signup(String username, String firstname, String lastname,
      String email, String password) async {
    const url = '192.168.137.200:8080';
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
        _userId = resultData['user']['_id'];
        _username = resultData['user']['userName'];
        _firstName = resultData['user']['firstName'];
        _lastName = resultData['user']['lastName'];
        _email = resultData['user']['email'];
        _saveUserData(
            _token, _userId, _username, _firstName, _lastName, _email);
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
          new Uri.http("192.168.137.200:8080", "api/users/authenticate"),
          body: json.encode(bodyUser),
          headers: userHeader);

      final resultData = json.decode(result.body);

      if (resultData['success'] == true) {
        _token = resultData['token'];
        _userId = resultData['user']['_id'];
        _username = resultData['user']['userName'];
        _firstName = resultData['user']['firstName'];
        _lastName = resultData['user']['lastName'];
        _email = resultData['user']['email'];
        _saveUserData(
            _token, _userId, _username, _firstName, _lastName, _email);
        print(_username);
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
    _firstName = null;
    _lastName = null;
    _email = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userDate')) {
      return false;
    }
    final extractedUserData = json.decode(prefs.getString('userData'));

    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _username = extractedUserData['username'];
    _firstName = extractedUserData['firstname'];
    _lastName = extractedUserData['lastname'];
    _email = extractedUserData['email'];
    notifyListeners();
    return true;
  }

  _saveUserData(String token, String userId, String username, String firstname,
      String lastname, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
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
