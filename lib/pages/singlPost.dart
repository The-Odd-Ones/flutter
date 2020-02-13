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
  Widget showComment() {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        children: <Widget>[
          Container(
              child: Image(
            image: NetworkImage(
                'https://r-cf.bstatic.com/images/hotel/max1024x768/208/208351646.jpg'),
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
    final post = postData.posts.firstWhere((element) => element.id == postId);

    int nbcomment = post.commentsCount ;
    String comm = "$nbcomment";
    //


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          elevation: 4.0,
          centerTitle: true,
          title: Text('Single Post'),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(

          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
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
                          child: Text(post.content,
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            //if there is file
                            children: <Widget>[
                              Image(
                                image: NetworkImage(
                                  post.file,
                                  scale: 3,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
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
                                      onTap: () {
                                        setState(() {
                                          print('clicked');
                                          showComment();
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
                    Container(

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
