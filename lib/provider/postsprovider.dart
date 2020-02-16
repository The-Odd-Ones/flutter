import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:community/provider/postComment.dart';
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

  List<PostComment> _comments = [];

  PostsProvider();

  List<SinglPost> get posts {
    return [..._posts];
  }

  List<PostComment> get comments {
    return [..._comments];
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
    var url = '1192.168.1.7:8080';
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

  Future<void> addPost(SinglPost single) async {
    final url = '1192.168.1.7:8080';

    try {
      final result = await http.post(
        new Uri.http(url, "api/post"),
        body: json.encode({
          'content': single.content,
          'username': single.username,
          'userImg': single.userImg,
          'community': single.community,
          'file': single.file,
          'commentsCount': single.commentsCount,
          'likesCount': single.likesCount,
          'sharesCount': single.sharesCount,
        }),
      );
      final newPost = SinglPost(
        id: single.id,
        content: single.content,
        username: single.username,
        userImg: single.userImg,
        community: single.community,
        file: single.file,
        commentsCount: single.commentsCount,
        likesCount: single.likesCount,
        sharesCount: single.sharesCount,
      );
      _posts.add(newPost);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> getPostsbyEvents(String eventId, String comuinity) async {
    final List<SinglPost> loadedPosts = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'userDate';
    final extractedUserData = json.decode(prefs.getString(key)) as Map;
    final token = extractedUserData['token'];

    var url = '1192.168.1.7:8080';
    final userHeader = {
      "Content-type": "application/json",
      "authorization": "$token"
    };

    try {
      final param = {'community': '$comuinity'};
      final result = await http.get(
          (new Uri.http(url, '/api/events/$eventId/posts', param)),
          headers: userHeader);
      final extractedData = json.decode(result.body) as Map<String, dynamic>;
      if (extractedData['result'].length > 0) {
        for (var i = 0; i < extractedData['result'].length; i++) {
          loadedPosts.add(SinglPost(
            id: extractedData['result'][i]['_id'],
            content: extractedData['result'][i]['content'],
            username: extractedData['result'][i]['user']['username'],
            userImg: extractedData['result'][i]['user']['file'],
            community: extractedData['result'][i]['community'],
            file: extractedData['result'][i]['file'],
            commentsCount: extractedData['result'][i]['commentsCount'],
            likesCount: extractedData['result'][i]['likesCount'],
            sharesCount: extractedData['result'][i]['sharesCount'],
          ));
        }
        _posts = loadedPosts;
        print(_posts);
      } else {
        _posts = [];
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> getCommentsOnPost(String postId, String comuinity) async {
    final List<PostComment> loadedComments = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'userDate';
    final extractedUserData = json.decode(prefs.getString(key)) as Map;
    final token = extractedUserData['token'];

    var url = '192.168.137.60:8080';
    final userHeader = {
      "Content-type": "application/json",
      "authorization": "$token"
    };

    try {
      final param = {'community': '$comuinity'};
      final result = await http.get(
          (new Uri.http(url, '/api/posts/$postId/comments', param)),
          headers: userHeader);

      final extractedData = json.decode(result.body) as Map<String, dynamic>;
      if (extractedData['result'].length > 0) {
        for (var i = 0; i < extractedData['result'].length; i++) {
          loadedComments.add(PostComment(
              id: extractedData['result'][i]['_id'],
              username: extractedData['result'][i]['user']['username'],
              userImg: extractedData['result'][i]['user']['file'],
              post: extractedData['result'][i]['post'],
              content: extractedData['result'][i]['content'],
              likesCount: extractedData['result'][i]['likesCount'],
              commentsCount: extractedData['result'][i]['commentsCount']));
        }
        _comments = loadedComments;
      } else {
        _comments = [];
      }
      print(_comments);
    } catch (e) {
      throw e;
    }
  }
}

// "https://1192.168.1.7:8080/api/posts?community=Art"
