import 'package:community/models/http_exception.dart';
import 'package:community/pages/login_page.dart';
import 'package:community/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';
import 'dart:convert';
// import 'package:my_app_name/custom_flutter/custom_dialog.dart' as customDialog;

class AddPost extends StatefulWidget {
  const AddPost({Key key}) : super(key: key);
  static const routeName = '/addPost';

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map _postData = {
    'post': '',
    'image': '',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text('add post'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Add post"),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your post',
                              labelText: 'Post',
                            ),
                            maxLines: 5,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Image',
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Publish'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // void _showErrorDialog() async {
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //       title: Text('Add Post'),
  //       content: Form(
  //         key: _formKey,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             TextFormField(
  //               decoration: const InputDecoration(
  //                 // icon: const Icon(Icons.person),
  //                 hintText: 'Enter your post',
  //                 labelText: 'Post',
  //               ),
  //               // textInputAction: TextInputAction.next,
  //               maxLines: 5,
  //               validator: (value) {
  //                 if (value.isEmpty) {
  //                   return 'Post';
  //                 }
  //                 return null;
  //               },
  //             ),
  //             TextFormField(
  //               decoration: const InputDecoration(
  //                 // icon: const Icon(Icons.image),
  //                 labelText: 'Image',
  //               ),
  //               textInputAction: TextInputAction.next,
  //               validator: (value) {
  //                 if (value.isEmpty) {
  //                   return 'Image';
  //                 }
  //                 return null;
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //       actions: <Widget>[
  //         FlatButton(
  //           child: Text('Publish'),
  //           onPressed: () {
  //             Navigator.of(ctx).pop();
  //           },
  //         )
  //       ],
  //     ),
  //   );
  //   // try {
  //   await Provider.of<PostsProvider>(context, listen: false).savePost(
  //     _postData['post'],
  //     _postData['image'],
  //   );
  //   Navigator.of(context).pushReplacementNamed(Home.routeName);
  // } on HttpException catch (error) {
  //   var errorMessage = 'Adding post failed';
  //   _showErrorDialog(errorMessage);
  // } catch (e) {
  //   throw e;
  // }
  // }

}
