import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SinglPost with ChangeNotifier {
  final String id;
  final String user;
  final String community;
  final String event;
  final String content;
  final String file;
  final String sharedpost;
  bool isLiked;

  SinglPost(
      {@required this.id,
      @required this.user,
      @required this.community,
      this.event,
      @required this.content,
      this.file,
      this.sharedpost,
      this.isLiked = false});
  void _isliked(bool newValue) {
    isLiked = newValue;
    notifyListeners();
  }

  Future<void> toggleisLiked(String token, String userId) async {
    final oldStatus = isLiked;
    isLiked = !isLiked;
    notifyListeners();
    final url = '192.168.137.200:8080';
    const userHeader = {
      "Content-type": "application/json",
    };
  }
}
