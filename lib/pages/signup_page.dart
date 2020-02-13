import 'package:community/models/http_exception.dart';
import 'package:community/pages/login_page.dart';
import 'package:community/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';
import 'dart:convert';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);
  static const routeName = '/signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map _authData = {
    'username': '',
    'firstname': '',
    'lastname': '',
    'email': '',
    'password': '',
  };

  String _validateEmail(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter email address";
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return null;
    }

    // The pattern of the email didn't match the regex above.
    return 'Email is not valid';
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

  void saveForm() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    // print(_authData);
    try {
      await Provider.of<UserProvider>(context, listen: false).signup(
          _authData['username'],
          _authData['firstname'],
          _authData['lastname'],
          _authData['email'],
          _authData['password']);
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
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 4.0,
        centerTitle: true,
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Center(
                  child: Text('Be part of a large community',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightGreen,
                      fontFamily: 'Galada',
                    ),
                  ),
                ),

                TextFormField(
                  decoration: InputDecoration(labelText: 'UserName',
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
                  decoration: InputDecoration(labelText: 'first Name',
                      contentPadding: EdgeInsets.all(5),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(

                        ),)
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some first Name';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['firstname'] = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'last Name',
                      contentPadding: EdgeInsets.all(5),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(

                        ),)
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some last Name';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['lastname'] = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email',
                      contentPadding: EdgeInsets.all(5),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(

                        ),)),
                  textInputAction: TextInputAction.next,
                  validator: _validateEmail,
                  onSaved: (val) {
                    _authData['email'] = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'password',
                      contentPadding: EdgeInsets.all(5),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(

                        ),)
                  ),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
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
                    child: Text('Register',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Galada',
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      saveForm();
                    }),
                RaisedButton(
                    color: Colors.lightGreen,
                    shape: StadiumBorder(),
                    child: Text('I have a account',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Galada',
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Login.routeName);
                    })
              ],
            )),
      ),
    );
  }
}
