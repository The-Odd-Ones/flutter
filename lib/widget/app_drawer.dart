import 'package:community/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/communityProvider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Divider(),
                  ListTile(
                    title: Text(
                        Provider.of<CommunityProvider>(context, listen: false)
                            .commuinities[1]),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Orders'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Manage Products'),
                  ),
                  Divider(),
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
      ),
    );
  }
}
