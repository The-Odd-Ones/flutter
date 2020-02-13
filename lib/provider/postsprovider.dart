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
  List<SinglPost> _posts = [];
  // List<SinglPost> _posts;

  PostsProvider();

  List<SinglPost> get posts {
    return [..._posts];
  }

  SinglPost findById(String id) {
    return _posts.firstWhere((element) => element.id == id);
  }

  Future<void> getPosts(String comuinity) async {
    final List<SinglPost> loadedPosts = [];
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

      final extractedData = json.decode(result.body) as Map<String, dynamic>;
      if (extractedData.length > 0) {
        for (var i = 0; i < extractedData['posts'].length; i++) {
          loadedPosts.add(SinglPost(
            id: extractedData['posts'][i]['_id'],
            content: extractedData['posts'][i]['content'],
            username: extractedData['posts'][i]['user']['username'],
            userImg: extractedData['posts'][i]['user']['file'],
            community: extractedData['posts'][i]['community'],
            file: extractedData['posts'][i]['file'],
            commentsCount: extractedData['posts'][i]['commentsCount'],
            likesCount: extractedData['posts'][i]['likesCount'],
            sharesCount: extractedData['posts'][i]['sharesCount'],
          ));
        }
        _posts = loadedPosts;
        print(_posts);
      } else {
        _posts = [];
      }
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  // Future<void> savePost(String post, String image) async {
  //   const url = '192.168.137.200:8080';
  //   const postHeader = {"Content-type": "application/json"};
  //   Map bodyPost = {
  //     'post': post,
  //     'image': image
  //   };
  //   try {
  //     final result = await http.post(new Uri.http(url, "api/post"),
  //         body: json.encode(bodyPost), headers: postHeader);

  //     final resultData = json.decode(result.body);
  //     if (resultData['success'] == true) {
  //       _token = resultData['token'];
  //       final postResult = resultData['post'];
  //       _postId = postResult['_id'];
  //       _post = postResult['post'];
  //       _image = postResult['image'];
  //       _savepostData(
  //           _token, _postId, post, image);
  //     } else {
  //       throw HttpException(resultData['msg']);
  //     }
  //   } catch (e) {
  //     throw e;
  //   }

  //   notifyListeners();
  // }
}

// "https://192.168.137.200:8080/api/posts?community=Art"
