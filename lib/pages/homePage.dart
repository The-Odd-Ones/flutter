import 'package:community/pages/events.dart';
import 'package:community/pages/posts/postCard.dart';
import 'package:community/pages/profile.dart';
import 'package:community/provider/eventsProvider.dart';
import 'package:community/widget/mapWidget.dart';
import 'package:community/widget/posts.dart';
import 'package:community/provider/communityProvider.dart';
import 'package:community/provider/postsprovider.dart';
import 'package:community/provider/user_provider.dart';
import 'package:community/widget/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../widget/imageCapture.dart';
import 'package:community/pages/homePage.dart';
import 'package:community/models/http_exception.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  String result;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> coomuin;
  // final community;
  @override
  void initState() {
    Provider.of<CommunityProvider>(context, listen: false).getCommuinties();
    Provider.of<PostsProvider>(context, listen: false).getPosts('Main');
    Provider.of<EventsProvider>(context, listen: false).getEvents('Main');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    Map _postData = {
      'community': '',
      'content': '',
      'file': '',
      'event': '',
      'user': '',
    };
    void saveForm() async {
      if (!_formKey.currentState.validate()) {
        // Invalid!
        return;
      }
      _formKey.currentState.save();
      // print(_authData);
      try {
        await Provider.of<PostsProvider>(context, listen: false).addPost(
          _postData['content'],
          // _postData['content'],
          // _postData['file'],
          // _postData['event'],
          // _postData['user']
        );
        Navigator.of(context).pushNamed(Home.routeName);
      } on HttpException catch (e) {
        throw e;
      }
    }

    return Center(
      child: Scaffold(
        appBar: AppBar(

            backgroundColor: Colors.lightGreen,
            elevation: 4.0,
            centerTitle: true,
         

          title: Text('comunity'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.portrait,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Profile.routeName);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.event,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Events.routeName);
              },
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: <Widget>[
            // Text("data"),
            // RaisedButton(
            //   child: Text('data'),
            //   onPressed: () async {
            //     final result =
            //         Provider.of<CommunityProvider>(context, listen: false)
            //             .commuinities[1];
            //     print(result);
            //     await Provider.of<PostsProvider>(context, listen: false)
            //         .getPosts(result);
            //   },
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text('Add post'),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Add post"),
                          content: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Enter your post',
                                    labelText: 'Post',
                                  ),
                                  maxLines: 5,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Enter your image',
                                    labelText: 'image',
                                  ),
                                ),
                                // FlatButton(
                                //     child: Text('Upload an Image'),
                                //     onPressed: () {
                                //       Navigator.of(context)
                                //           .pushNamed(ImageCap.routeName);
                                //     }),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Publish'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
                RaisedButton(
                  child: Text('Add event'),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Add event"),
                          content: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Enter your event',
                                    labelText: 'Event',
                                  ),
                                  maxLines: 5,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Image',
                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Publish'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: Posts(),
            ),
          ],
        ),
      ),
    );
  }
}
