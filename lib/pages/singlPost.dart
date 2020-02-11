
import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';
class SinglePost extends StatefulWidget {
  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  //this function show all comments
   Widget showComment(){
      return Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Column(
          children: <Widget>[

            Container(
                child: Image(image: NetworkImage('https://r-cf.bstatic.com/images/hotel/max1024x768/208/208351646.jpg'),)
            ),
            Container(

            ),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
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

                            backgroundImage: NetworkImage("https://cdn1.thr.com/sites/default/files/imagecache/landscape_928x523/2019/06/gettyimages-1144044827_copy.jpg"),
                            radius: 50,

                          ),
                          Text('maria joe',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.indigo

                            ),),
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              //if there is file
                              children: <Widget>[
                                Image(image: NetworkImage('https://r-cf.bstatic.com/images/hotel/max1024x768/208/208351646.jpg',
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
                                  Row(

                                    children: <Widget>[
                                      GestureDetector(
                                        child: Icon(Icons.favorite_border,
                                          color: Colors.red,
                                          size: 25,

                                        ),
                                        onTap: (){
                                          print('onTap called');
                                        },
                                      ),
                                      GestureDetector(
                                        child: Icon(Icons.comment,
                                          color: Colors.grey,
                                          size: 25,

                                        ),
                                        onTap: (){
                                          setState(() {
                                            print('clicked');
                                            showComment();
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        child: Icon(Icons.share,
                                          color: Colors.grey,
                                          size: 25,
                                        ),
                                        // onTap will be changed and work correctly with the back ena
                                        onTap: (){
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

/*
 Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Column(
              children: <Widget>[

                Container(
                    child: Image(image: NetworkImage('https://r-cf.bstatic.com/images/hotel/max1024x768/208/208351646.jpg'),)
                ),
                Container(

                ),
              ],
            ),
          ),

          *************
            Column(
                                      children: <Widget>[
                                        //car of the comment should appear just when we click on the comment
                                        Card(
                                          color: Colors.white70,
                                          child: Row(
                                            children: <Widget>[
                                              CircleAvatar(backgroundImage: NetworkImage('https://live.staticflickr.com/429/18561499804_4fe0b79b10.jpg'),
                                                radius: 30,
                                              ),
                                              Card(
                                                color: Colors.white60,

                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: <Widget>[


                                                    Text('teeeeee fddrffdse fdredf fdrsv uk',
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 5,

                                                    ),


                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),

                                      ),

//
                                    ],
                                  )
 */
