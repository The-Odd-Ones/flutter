import 'package:community/pages/profile.dart';
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
                })
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
        body: Column(
          children: <Widget>[
            Text("data"),
            RaisedButton(
                child: Text('data'),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  final key = 'userDate';
                  final extractedUserData = prefs.getString(key);
                  // json.decode(prefs.getString('userData'))
                  //     as Map<String, dynamic>;
                  print(extractedUserData);
                })
          ],
        ),
      ),
    );
  }
}
