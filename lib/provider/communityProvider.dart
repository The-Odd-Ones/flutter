import 'dart:convert';
import 'package:community/pages/community.dart';
import 'package:community/provider/singleCommunity.dart';
import 'package:community/provider/user_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/getToken.dart';

class CommunityProvider with ChangeNotifier {
  List<SingleCommuinty> _commuinities = [];
  CommunityProvider();

  List<SingleCommuinty> get commuinities {
    return [..._commuinities];
  }

  Future<void> getCommuinties() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'userDate';
    final extractedUserData = json.decode(prefs.getString(key)) as Map;
    final token = extractedUserData['token'];

    final url = '192.168.137.60:8080';
    final userHeader = {
      "Content-type": "application/json",
      "authorization": "$token"
    };
    try {
      final result = await http.get((new Uri.http(url, "/api/communities")),
          headers: userHeader);
      final extractedData = json.decode(result.body) as Map;
      if (extractedData == null) {
        return;
      }
      final List<SingleCommuinty> loadedCommuinities = [];

      for (var i = 0; i < extractedData['result'].length; i++) {
        loadedCommuinities.add(SingleCommuinty(
          commuintyId: extractedData['result'][i]['_id'],
          commuinty: extractedData['result'][i]['name'],
        ));
      }
      // print(extractedData);
      // extractedData['result'].forEach((key, value) {
      //   // loadedCommuinities.add(
      //   print(key);

      //   print(value);
      //   // SingleCommuinty(
      //   //   commuintyId: value['_id'], commuinty: value['name']));
      // });
      _commuinities = loadedCommuinities;
      print(_commuinities);
    } catch (e) {
      throw (e);
    }
  }
}
