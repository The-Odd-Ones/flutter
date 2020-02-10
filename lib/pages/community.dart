import 'package:flutter/material.dart';
class Community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        backgroundColor: Colors.black,

        body: SafeArea(
        child: Center(
          child: Column(

           children: <Widget>[
             Row(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 Card(
                   child: Column(
                     children: <Widget>[
                       Text('ART',
                         style: TextStyle(
                             fontSize: 30,
                             color: Colors.indigo

                         ),),
                       Container(
                         child: Image.asset('images/art.jpg',
                           scale: 2.8,
                         ),
                       ),
                     ],
                   ),
                 ),
                 Card(
                   child: Column(
                     children: <Widget>[
                       Text('ANIME',
                         style: TextStyle(
                             fontSize: 30,
                             color: Colors.indigo

                         ),),
                       Container(
                         child: Image.asset('images/anime.png',
                           scale: 3,
                         ),
                       ),
                     ],
                   ),
                 ),

               ],
             ),

             Row(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 Card(
                   child: Column(
                     children: <Widget>[
                       Text('ART',
                         style: TextStyle(
                             fontSize: 30,
                             color: Colors.indigo

                         ),),
                       Container(
                         child: Image.asset('images/art.jpg',
                           scale: 4,
                         ),
                       ),
                     ],
                   ),
                 ),
                 Card(
                   child: Column(
                     children: <Widget>[
                       Text('SPORT',
                         style: TextStyle(
                             fontSize: 30,
                             color: Colors.indigo

                         ),),
                       Container(
                         child: Image.asset('images/sport.png',
                           scale: 0.3,
                         ),
                       ),
                     ],
                   ),
                 ),
                 Card(
                   child: Column(
                     children: <Widget>[
                       Text('FOOD',
                         style: TextStyle(
                             fontSize: 30,
                             color: Colors.indigo

                         ),),
                       Container(
                         child: Image.asset('images/food.png',
                           scale: 2,
                         ),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
             Row(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 Card(
                   child: Column(
                     children: <Widget>[
                       Text('NATURE',
                         style: TextStyle(
                             fontSize: 30,
                             color: Colors.indigo

                         ),),
                       Container(
                         child: Image.asset('images/nature.jfif',
                           scale: 2,
                         ),
                       ),
                     ],
                   ),
                 ),
                 Card(
                   child: Column(
                     children: <Widget>[
                       Text('MUSIC',
                         style: TextStyle(
                             fontSize: 30,
                             color: Colors.indigo

                         ),),
                       Container(
                         child: Image.asset('images/music.png',
                           scale: 1.5,
                         ),
                       ),
                     ],
                   ),
                 ),

               ],
             ),
             Row(
               mainAxisSize: MainAxisSize.min,

               children: <Widget>[

             FlatButton(

                    color: Colors.white,
                    textColor: Colors.indigo,
                    child: Text('ALL Community'),
               onPressed: (){
                      print('all');
               },

                  ),


               ],
             )
           ],
          ),
        ),
        ),
        ),
    );
  }
}
