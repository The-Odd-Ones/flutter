/*
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class EventsProvider extends ChangeNotifier{

  dynamic authToken;
  String userId;
  List<String> _events = [];
  EventsProvider();

  List<String> get events {
    return [..._events];
  }




  Future <String> getEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'userDate';
    final extractedUserData = json.decode(prefs.getString(key)) as Map;
    final token = extractedUserData['token'];

    final url = '192.168.3.207:8080';
    final userHeader = {
      "Content-type": "application/json",
      "authorization": "$token"
    };
    try {
      final result = await http.get((new Uri.http(url, "/api/events")),
          headers: userHeader);
      final extractedData = json.decode(result.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<String> loadedEvents = [];

      for (var i = 0; i < extractedData['result'].length; i++) {
        loadedEvents.add(extractedData['result'][i]['name']);
      }

      _events = loadedEvents;
      print(_events);
    } catch (e) {
      throw (e);
    }
  }

}
*/



import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  NetworkHelper(this.url);

  final String url ;
  Future getData()async {
    http.Response response = await http.get('192.168.3.207:8080/api/events');

    if(response.statusCode ==200) {
      String data = response.body;
      return jsonDecode(data);
    }else
    { print(response.statusCode);}

  }

}
/*
class EventsProvider extends ChangeNotifier{

  dynamic authToken;
  String userId;
  List<String> _events = [];
  EventsProvider();


  List<String> getallEvents {
    return [..._events];
  }

}
 */

