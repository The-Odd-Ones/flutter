import 'package:community/provider/communityProvider.dart';
import 'package:community/provider/postsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_widget/zoom_widget.dart';

class SinglePost extends StatefulWidget {
  static const routeName = '/SinglePost';
  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  //this function show all comments
  Widget showComment(comments) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        children: <Widget>[
          Container(
              child: Image(
            image: NetworkImage(comments.userImg),
          )),
          Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context).settings.arguments as String;
    final postData = Provider.of<PostsProvider>(context);
    final communtiyData = Provider.of<CommunityProvider>(context);

    final post = postData.posts.firstWhere((element) => element.id == postId);
    final community = communtiyData.commuinities
        .firstWhere((element) => element.commuintyId == post.community);
    final comments = postData.getCommentsOnPost(post.id, community.commuinty);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Card(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(post.userImg),
                            radius: 50,
                          ),
                          Text(
                            post.username,
                            style:
                                TextStyle(fontSize: 25, color: Colors.indigo),
                          ),
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              //if there is file
                              children: <Widget>[
                                Image(
                                  image: post.file != null
                                      ? NetworkImage(
                                          post.file,
                                          scale: 3,
                                        )
                                      : NetworkImage(
                                          'https://sciences.ucf.edu/psychology/wp-content/uploads/sites/63/2019/09/No-Image-Available.png'),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                          size: 25,
                                        ),
                                        onTap: () {
                                          print('onTap called');
                                        },
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.comment,
                                          color: Colors.grey,
                                          size: 25,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            print('clicked');
                                            showComment(comments);
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.share,
                                          color: Colors.grey,
                                          size: 25,
                                        ),
                                        // onTap will be changed and work correctly with the back ena
                                        onTap: () {
                                          print('onTap called');
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
