import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

class PostComment with ChangeNotifier {
  final String id;
  final String username;
  final String userImg;
  final String post;
  final String content;
  final int likesCount;
  final int commentsCount;

  PostComment(
      {this.id,
      this.username,
      this.userImg,
      this.post,
      this.content,
      this.likesCount,
      this.commentsCount});
}
