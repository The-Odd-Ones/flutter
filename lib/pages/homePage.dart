import 'package:community/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

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
        ),
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');

                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
                Provider.of<UserProvider>(context, listen: false).logout();
              },
            ),
          ],
        )),
        body: Text("Home"),
      ),
    );
  }
}
