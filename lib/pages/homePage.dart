import 'package:community/pages/events.dart';
import 'package:community/pages/posts/postCard.dart';
import 'package:community/pages/profile.dart';
import 'package:community/widget/posts.dart';
import 'package:community/widget/eventWidget.dart';

import 'package:community/provider/communityProvider.dart';
import 'package:community/provider/postsprovider.dart';
import 'package:community/provider/eventsProvider.dart';
import 'package:community/provider/user_provider.dart';
import 'package:community/widget/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('comunity'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.portrait,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(Profile.routeName);
                }),
            IconButton(
                icon: Icon(
                  Icons.event,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(Events.routeName);
                }),
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: <Widget>[
            Text("data"),
            RaisedButton(
              child: Text('data'),
              onPressed: () async {
                final result =
                Provider.of<CommunityProvider>(context, listen: false)
                    .commuinities[1];
                print(result);
                await Provider.of<PostsProvider>(context, listen: false)
                    .getPosts(result);


              },
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