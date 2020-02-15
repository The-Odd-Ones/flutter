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
import 'package:community/provider/eventProvider.dart';

class EventsProvider with ChangeNotifier {
  String token;
  List<SinglEvent> _events = [];

  EventsProvider();

  List<SinglEvent> get events {
    return [..._events];
  }

  SinglEvent findById(String id) {
    return _events.firstWhere((element) => element.id == id);
  }

  Future<void> getEvents(String comuinity) async {
    final List<SinglEvent> loadedEvents = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'userDate';
    final extractedUserData = json.decode(prefs.getString(key)) as Map;
    final token = extractedUserData['token'];
    var url = '192.168.1.7:8080';
    final userHeader = {
      "Content-type": "application/json",
      "authorization": "$token"
    };

    try {
      final param = {'community': '$comuinity'};
      final result = await http.get((new Uri.http(url, '/api/events', param)),
          headers: userHeader);

      final extractedData = json.decode(result.body) as Map<String, dynamic>;
      print(extractedData['result']);
      if (extractedData.length > 0) {
        for (var i = 0; i < extractedData['result'].length; i++) {
          loadedEvents.add(SinglEvent(
              id: extractedData['result'][i]['_id'],
              community: extractedData['result'][i]['community'],
              file: extractedData['result'][i]['file'],
              description: extractedData['result'][i]['description'],
              title: extractedData['result'][i]['title'],
              location: extractedData['result'][i]['location']['coordinates'],
              participant: extractedData['result'][i]['enrollsCount']));
        }
        _events = loadedEvents;
        print(_events);
      } else {
        _events = [];
      }
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
