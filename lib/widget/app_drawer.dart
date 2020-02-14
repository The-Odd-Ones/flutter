import 'package:community/provider/eventsProvider.dart';
import 'package:community/provider/postsprovider.dart';
import 'package:community/provider/singleCommunity.dart';
import 'package:community/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/communityProvider.dart';

class AppDrawer extends StatelessWidget {
  dynamic postsProv;
  dynamic eventsProv;
  @override
  Widget build(BuildContext context) {
    final commuinty = Provider.of<CommunityProvider>(context);
    List<SingleCommuinty> groups = commuinty.commuinities;
    postsProv = Provider.of<PostsProvider>(context, listen: false);
    eventsProv = Provider.of<EventsProvider>(context, listen: false);

    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Column(
            children: groups.map((e) => menuElement(context, e)).toList(),
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

  Widget menuElement(context, element) {
    return ListTile(
      title: Text(element.commuinty),
      onTap: () async {
        await postsProv.getPosts(element.commuinty);
        await eventsProv.getEvents(element.commuinty);
        final result = postsProv.posts;
        print(result);
      },
    );
  }
}
