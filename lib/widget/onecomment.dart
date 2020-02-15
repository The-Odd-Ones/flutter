import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneComment extends StatefulWidget {
  @override
  _OneCommentState createState() => _OneCommentState();
}

class _OneCommentState extends State<OneComment> {
  @override
  Widget build(BuildContext context) {
    OneComment();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,


        body: Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText:'comment here',

                    contentPadding: EdgeInsets.all(5),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                      borderSide: new BorderSide(

                      ),)
                ),
              ),
              GestureDetector(
                child: Icon(Icons.done_all,
                color: Colors.greenAccent,

                ),
                onTap: (){
                  setState(() {
                    print('it takes you to the profil');
                  });

                },
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30,),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    CircleAvatar(backgroundColor: Colors.blue,),
                    SizedBox(width:30),

                    Text('this is a comment',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,

                    ),
                  ],
                ),
              )

            ],
          ),

          ),
      ),
    );

  }
}
