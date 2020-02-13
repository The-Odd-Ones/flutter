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
  List<SinglEvent> _events= [];


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
    var url = ' 192.168.3.207:8080';
    final userHeader = {
      "Content-type": "application/json",
      "authorization": "$token"
    };

    try {
      final param = {'community': '$comuinity'};
      final result = await http.get((new Uri.http(url, '/api/events', param)),
          headers: userHeader);
        print(result);
      final extractedData = json.decode(result.body) as Map<String, dynamic>;
      if (extractedData.length > 0) {
        for (var i = 0; i < extractedData['events'].length; i++) {
          loadedEvents.add(SinglEvent(
            id: extractedData['events'][i]['_id'],
            description: extractedData['events'][i]['description'],
            username: extractedData['events'][i]['user']['username'],
            userImg: extractedData['posts'][i]['user']['file'],
            community: extractedData['posts'][i]['community'],
            file: extractedData['events'][i]['file'],
            location: extractedData['events'][i]['location'],
            participant: extractedData['events'][i]['participant'],

          ));
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


