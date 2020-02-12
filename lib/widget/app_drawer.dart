import 'package:community/provider/user_provider.dart';
import 'package:community/widget/menuElm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/communityProvider.dart';

class AppDrawer extends StatelessWidget {
  List<String> groups;
  @override
  Widget build(BuildContext context) {
    final commuinty = Provider.of<CommunityProvider>(context);
    groups = commuinty.commuinities;
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Column(
            children: groups.map((e) => menuElement(e)).toList(),
          ),

          // ListView.builder(
          //   itemCount: groups.length,
          //   itemBuilder: menuElement,
          // ),
          Divider(),
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
      ),
    );
  }

  Widget menuElement(element) {
    return ListTile(
      title: Text(element),
    );
  }
}
