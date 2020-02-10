import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostsProvider with ChangeNotifier {
  String token;
  final String userId;
  Map _posts;

  PostsProvider(this.token, this.userId, this._posts);

  Future getPosts() async {}
}
