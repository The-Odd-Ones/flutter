

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class EditProfil extends StatefulWidget {

  static const routeName = '/EditProfil';
  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageCapture(),
    );
  }
}

class ImageCapture extends StatefulWidget {
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File _imageFile;
  //function capture the image from the gal or camera
  Future<void>_pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = selected;
    });
  }
  void _clear(){
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,

      ),
          body: Center(
            child: Form(

              child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.cyan,
                          child: Text('Edit',
                          style: TextStyle(
                            color: Colors.white
                          ),)
                      ),
                      IconButton(
                        icon: Icon(Icons.photo_camera),
                        onPressed: () => _pickImage(ImageSource.gallery),
                      ),
                      Container(

                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.white70),
                            left: BorderSide(width: 1, color: Colors.white70),
                            right: BorderSide(width: 1, color: Colors.white70),
                            bottom: BorderSide(width: 1, color: Colors.white70),

                          )
                        ),
                        child: Column(
                          children: <Widget>[
                            Text('User Name',
                            textAlign: TextAlign.left,),

                        TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter new username'
                          ),
                        )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1, color: Colors.white70),
                              left: BorderSide(width: 1, color: Colors.white70),
                              right: BorderSide(width: 1, color: Colors.white70),
                              bottom: BorderSide(width: 1, color: Colors.white70),

                            )
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(' Name',
                              textAlign: TextAlign.left,),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter new name'
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1, color: Colors.white70),
                              left: BorderSide(width: 1, color: Colors.white70),
                              right: BorderSide(width: 1, color: Colors.white70),
                              bottom: BorderSide(width: 1, color: Colors.white70),

                            )
                        ),
                        child: Column(
                          children: <Widget>[
                            Text('Last Name',
                              textAlign: TextAlign.left,),
                            TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter new lastname'
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1, color: Colors.white70),
                              left: BorderSide(width: 1, color: Colors.white70),
                              right: BorderSide(width: 1, color: Colors.white70),
                              bottom: BorderSide(width: 1, color: Colors.white70),

                            )
                        ),
                        child: Column(
                          children: <Widget>[
                            Text('Password',
                              textAlign: TextAlign.left,),
                            TextFormField(
                              decoration: InputDecoration(

                                  border: InputBorder.none,
                                  hintText: 'Enter Password'
                              ),
                              obscureText: true,
                            )
                          ],
                        ),
                      ),
                      FlatButton(

                        textColor: Colors.white,
                        color: Colors.green,

                        child: Text('Save changes'),
                      )
                    ],
              ),
            ),
          ),

      
    );
  }
}

/*
child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'User Name'),
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
                  decoration: InputDecoration(labelText: 'Password'),
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
                  child: Text('Save'),
                  onPressed: () {
                    saveForm();
                  },
                ),
                RaisedButton(
                    child: Text('Create Account'),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignUp.routeName);
                    })
              ],
            ),
          ),
 */