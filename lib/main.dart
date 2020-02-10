import 'package:community/pages/auth.dart';
import 'package:community/pages/homePage.dart';
import 'package:community/pages/posts/postCard.dart';
import 'file:///C:/rbk/community/flutter/lib/pages/posts/posts.dart';
import 'package:community/pages/signup_page.dart';
import 'package:community/pages/splash_screen.dart';
import 'package:community/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/login_page.dart';
import 'pages/homePage.dart';
import 'package:community/pages/community.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: UserProvider())],
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
              SignUp.routeName: (context) => SignUp()
            },
          ),
        ));
  }
}

/*

*/
