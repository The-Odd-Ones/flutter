import 'package:community/pages/events.dart';
import 'package:community/pages/posts/posts.dart';
import 'package:community/pages/profile.dart';
import 'package:community/provider/communityProvider.dart';
import 'package:community/provider/postsprovider.dart';
import 'package:community/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });

    Provider.of<CommunityProvider>(context, listen: false).getCommuinties();
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
            // IconButton(
            //     icon: Icon(
            //       Icons.local_post_office,
            //       color: Colors.white,
            //     ),
            //     onPressed: () {
            //       Navigator.of(context).pushNamed(Posts.routeName);
            //     }),
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
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('community'),
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Logout'),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed('/');
                        // Navigator.of(context)
                        //     .pushReplacementNamed(UserProductsScreen.routeName);
                        Provider.of<UserProvider>(context, listen: false)
                            .logout();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
        body: Container(
          child: Column(
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
      ),
    );
  }
}
