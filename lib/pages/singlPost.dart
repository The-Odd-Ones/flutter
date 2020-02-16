import 'package:community/provider/postsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_widget/zoom_widget.dart';
import 'package:community/widget/onecomment.dart';
import 'dart:async';

class SinglePost extends StatefulWidget {
  static const routeName = '/SinglePost';
  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  //this function show all comments
  bool liked = false;
  bool showHeart = false;

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  __commentButtonPressed() {}
  _doubleTapped() {
    setState(() {
      showHeart = true;
      liked = true;
      if (showHeart) {
        Timer(const Duration(milliseconds: 500), () {
          setState(() {
            showHeart = false;
          });
        });
      }
    });
  }

  // Widget showComment() {
  //   return Card(
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           child: Image(
  //             image: NetworkImage(
  //                 'https://r-cf.bstatic.com/images/hotel/max1024x768/208/208351646.jpg'),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context).settings.arguments as String;
    final postData = Provider.of<PostsProvider>(context);
    final post = postData.posts.firstWhere((element) => element.id == postId);

    int nbcomment = post.commentsCount;
    String comm = "$nbcomment";

    IconButton heartButton = IconButton(
      icon: Icon(liked ? Icons.favorite : Icons.favorite_border,
          color: liked ? Colors.red : Colors.grey),
      onPressed: () => _pressed(),
    );

    IconButton commentButton = IconButton(
      icon: Icon(
        Icons.chat_bubble_outline,
        color: Colors.grey,
      ),
      onPressed: () => _pressed(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 4.0,
        centerTitle: true,
        title: Text('Single Post'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(post.userImg),
                        radius: 50,
                      ),
                      Text(
                        post.username,
                        style: TextStyle(fontSize: 25, color: Colors.indigo),
                      ),
                      Container(
                        child: Text(
                          post.content,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image(
                                image: post.file != null
                                    ? NetworkImage(
                                        post.file,
                                        scale: 3,
                                      )
                                    : NetworkImage(
                                        'https://sciences.ucf.edu/psychology/wp-content/uploads/sites/63/2019/09/No-Image-Available.png'),
                              ),
                              // GestureDetector(
                              //   onDoubleTap: () => _doubleTapped(),
                              // ),
                              // showHeart
                              //     ? Icon(
                              //         Icons.favorite,
                              //         color: Colors.red,
                              //         size: 50,
                              //       )
                              //     : Container(),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              ListTile(
                                leading: Row(
                                  children: <Widget>[
                                    heartButton,
                                    commentButton,
                                  ],
                                ),
                              ),
                              // leading: Icon(
                              //   Icons.favorite,
                              //   color: Colors.red,
                              // ),
                              // IconButton(
                              //   iconSize: 35,
                              //   icon: Icon(
                              //       Liked
                              //           ? Icons.favorite
                              //           : Icons.favorite_border,
                              //       color: Liked ? Colors.red : null),
                              //   tooltip: 'Increase volume by 10',
                              //   onPressed: () => _pressed(),
                              // ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        child: OneComment(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
