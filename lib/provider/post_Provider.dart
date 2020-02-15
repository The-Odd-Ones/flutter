import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SinglPost with ChangeNotifier {
  final String id;
  final String username;
  final String userImg;
  final String community;
  final String content;
  final String file;
  final int commentsCount;
  final int sharesCount;
  final int likesCount;
  bool isLiked;
  bool isShared;

  SinglPost(
      {@required this.id,
      @required this.username,
      this.userImg,
      @required this.community,
      @required this.content,
      this.file,
      this.commentsCount,
      this.likesCount,
      this.sharesCount,
      this.isLiked = false,
      this.isShared = false});

  void _isliked(bool newValue) {
    isLiked = newValue;
    notifyListeners();
  }

  Future<void> toggleisLiked(String token, String userId) async {
    final oldStatus = isLiked;
    isLiked = !isLiked;
    notifyListeners();
    final url = '192.168.137.222:8080';
    const userHeader = {
      "Content-type": "application/json",
    };
  }
}
