import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

get getToken async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final key = 'userDate';
  final extractedUserData = json.decode(prefs.getString(key)) as Map;
  final token = extractedUserData['token'];

  return token.toString();
}
