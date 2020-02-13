import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SinglEvent with ChangeNotifier {
  final String id;
  final String username;
  final String userImg;
  final String community;
  final String description;
  final String file;
  final double location;
  final int participant;


  SinglEvent(
      {@required this.id,
        @required this.username,
        this.userImg,
        @required this.community,
        @required this.description,
        this.file,
        this.location,
        this.participant

        });
/*
  void _isliked(bool newValue) {
    isLiked = newValue;
    notifyListeners();
  }

  Future<void> toggleisLiked(String token, String userId) async {
    final oldStatus = isLiked;
    isLiked = !isLiked;
    notifyListeners();
    final url = ' 192.168.3.207:8080';
    const userHeader = {
      "Content-type": "application/json",
    };
  }
  */
}
