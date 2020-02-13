import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SinglEvent with ChangeNotifier {
  final String id;

  final String title;
  final String community;
  final String description;
  final String file;
  final List location;
  final int participant;

  SinglEvent(
      {@required this.id,
      this.title,
      @required this.community,
      @required this.description,
      this.file,
      this.location,
      this.participant});
}
