import 'package:community/models/http_exception.dart';
import 'package:community/pages/homePage.dart';
import 'package:community/pages/signup_page.dart';
import 'package:community/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'username': '',
    'password': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 4.0,
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(

          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[

                Center(
                  child: Text('Welcome to community App',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightGreen,
                      fontFamily: 'Galada',
                    ),
                  ),
                ),
                TextFormField(

                  decoration: InputDecoration(labelText: 'User Name',

                      contentPadding: EdgeInsets.all(5),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(

                        ),)
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some User Name';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['username'] = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password',
                      contentPadding: EdgeInsets.all(5),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(
                        ),)
                  ),
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty || value.length < 6) {
                      return 'Please enter some password';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['password'] = val;
                  },
                ),
                RaisedButton(
                  color: Colors.lightGreen,
                  shape: StadiumBorder(),
                  elevation: 2,
                  child: Text('Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Galada',
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    saveForm();
                  },
                ),
                RaisedButton(
                    color: Colors.lightGreen,
                    shape: StadiumBorder(),
                    child: Text('Create Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Galada',
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignUp.routeName);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveForm() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    print(_authData);
    try {
      await Provider.of<UserProvider>(context, listen: false)
          .login(_authData['username'], _authData['password']);
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('username exists')) {
        errorMessage = 'This username is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error
          .toString()
          .contains('password should be 8 digits or more')) {
        errorMessage =
        'This password is too weak, password should be 8 digits or more.';
      } else if (error.toString().contains('User not found')) {
        errorMessage = 'Could not find a user with that username.';
      } else if (error.toString().contains('Password is incorrect')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (e) {
      // _showErrorDialog(e);*
      print(e);
    }

    // final userHeader = {"Content-type": "application/json"};
    // try {
    //   await http
    //       .post(new Uri.http("192.168.3.93:8080", "api/users/authenticate"),
    //           body: json.encode(bodyUser), headers: userHeader)
    //       .then((value) => print(json.decode(value.body)));
    // } catch (e) {
    //   print(e);
    // }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
}