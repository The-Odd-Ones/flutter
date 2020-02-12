import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:community/provider/post_Provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PostsProvider with ChangeNotifier {
  String token;

  // List<SinglPost> _posts;

  PostsProvider();

  Future<void> getPosts(String comuinity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'userDate';
    final extractedUserData = json.decode(prefs.getString(key)) as Map;
    final token = extractedUserData['token'];
    var url = '192.168.137.200:8080';
    final userHeader = {
      "Content-type": "application/json",
      "authorization": "$token"
    };

    try {
      final param = {'community': '$comuinity'};
      final result = await http.get((new Uri.http(url, '/api/posts', param)),
          headers: userHeader);

      // final extractedData = json.decode(result.body) as Map<String, dynamic>;
      print(result.body);
    } catch (e) {
      print(e);
    }
  }
}

// "https://192.168.137.200:8080/api/posts?community=Art"
