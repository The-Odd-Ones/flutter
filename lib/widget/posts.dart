import 'package:community/provider/postsprovider.dart';
import 'package:provider/provider.dart';

import '../pages/posts/postCard.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  static const routeName = '/posts';

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return PostCard();
  }
}
