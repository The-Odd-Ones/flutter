import 'package:community/models/posts_model.dart';

import 'package:community/pages/auth.dart';
import 'package:community/pages/events.dart';
import 'package:community/pages/homePage.dart';
import 'package:community/provider/eventsProvider.dart';
import 'package:community/widget/eventWidget.dart';
import 'package:community/widget/mapWidget.dart';
import 'package:community/widget/posts.dart';
import 'package:community/pages/profile.dart';
import 'package:community/pages/signup_page.dart';
import 'package:community/pages/singlPost.dart';
import 'package:community/pages/splash_screen.dart';
import 'package:community/provider/communityProvider.dart';
import 'package:community/provider/postsprovider.dart';
import 'package:community/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/login_page.dart';
import 'package:community/pages/editProfil.dart';
import 'package:community/widget/onecomment.dart';
//
import 'package:community/widget/imageCapture.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: UserProvider()),
          ChangeNotifierProvider.value(value: CommunityProvider()),
          ChangeNotifierProvider.value(value: PostsProvider()),
          ChangeNotifierProvider.value(value: EventsProvider()),
        ],
        child: Consumer<UserProvider>(
          builder: (context, userProvider, _) => MaterialApp(
            home: userProvider.isAuth
                ? Home()
                : FutureBuilder(
                    future: userProvider.tryAutoLogin(),
                    builder: (context, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : Auth(),
                  ),
            routes: {
              Home.routeName: (context) => Home(),
              Login.routeName: (context) => Login(),
              SignUp.routeName: (context) => SignUp(),
              Profile.routeName: (context) => Profile(),
              Events.routeName: (context) => Events(),
              EditProfil.routeName: (context) => EditProfil(),
              SinglePost.routeName: (context) => SinglePost(),
              EventP.routeName: (context) => EventP(),
              MapPage.routeName: (context) => MapPage(),
            },
          ),
        ));
  }
}

/*
MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: UserProvider()),
          ChangeNotifierProvider.value(value: CommunityProvider()),
          ChangeNotifierProvider.value(value: PostsProvider()),
          ChangeNotifierProvider.value(value: EventsProvider()),
        ],
        child: Consumer<UserProvider>(
          builder: (context, userProvider, _) => MaterialApp(
            home: userProvider.isAuth
                ? Home()
                : FutureBuilder(
                    future: userProvider.tryAutoLogin(),
                    builder: (context, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : Auth(),
                  ),
            routes: {
              Home.routeName: (context) => Home(),
              Login.routeName: (context) => Login(),
              SignUp.routeName: (context) => SignUp(),
              Profile.routeName: (context) => Profile(),
              Events.routeName: (context) => Events(),
              EditProfil.routeName: (context) => EditProfil(),
              SinglePost.routeName: (context) => SinglePost(),
              EventP.routeName: (context) => EventP(),
              MapPage.routeName: (context) => MapPage(),
            },
          ),
        ));
 */
