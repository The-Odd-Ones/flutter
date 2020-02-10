import 'package:community/pages/posts/postCard.dart';
import 'package:flutter/material.dart';
class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return PostCard();
  }
}

/*
child: ListTile(
                leading:Icon(Icons.phone,
                  size: 30,
                  color: Colors.pinkAccent,
                ),
                title: Text('24778550',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 20,
                  ),),

              ),
 */