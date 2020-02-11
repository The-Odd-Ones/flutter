import 'package:community/pages/auth.dart';
import 'package:community/pages/events.dart';
import 'package:community/pages/homePage.dart';
import 'package:community/pages/posts/posts.dart';
import 'package:community/pages/profile.dart';
import 'package:community/pages/signup_page.dart';
import 'package:community/pages/splash_screen.dart';
import 'package:community/provider/communityProvider.dart';
import 'package:community/provider/postsprovider.dart';
import 'package:community/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/login_page.dart';
//

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
          ChangeNotifierProvider.value(value: PostsProvider())
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
              Posts.routeName: (context) => Posts(),
              Events.routeName: (context) => Events()
            },
          ),
        ));
  }
}
