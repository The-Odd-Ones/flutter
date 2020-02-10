import 'package:flutter/material.dart';
class PostCard extends StatefulWidget {
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;
  var likeCol = '';
   verifLiked() {
     if (liked = true) {
       return Icon(Icons.favorite_border,
         size: 20,
         color: Colors.red,);
     } else {
       return Icon(Icons.favorite_border,
         size: 20,
         color: Colors.grey,);
     }
   }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Center(

        child: Column(
          children: <Widget>[
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),


              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

              ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage('https://hairstylecamp.com/wp-content/uploads/famous-actresses-with-brown-hair-16.jpg'),
              ) ,

              title: Text('Marie joe',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              ),
              subtitle: Text('marooo',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
              ) ,
              ),
                  Container(
                    child: Image(image: NetworkImage('https://r-cf.bstatic.com/images/hotel/max1024x768/208/208351646.jpg'),)
                  ),
                  Text('in the best place near the sea with a good food and nice lights , what can i say ?? i\'m very happy  '),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        verifLiked(),
                        Icon(Icons.share,
                          color: Colors.grey,

                        ),
                        Icon(Icons.comment,
                        color: Colors.grey,

                        )

                      ],
                    ),


                ],
              )


            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://hairstylecamp.com/wp-content/uploads/famous-actresses-with-brown-hair-16.jpg'),
                ) ,

                title: Text('Marie joe',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text('marooo',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ) ,
                ),
                  Text('it is never too late start and ou will see the result , you can do it ',
                  ),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      verifLiked(),
                      Icon(Icons.share,
                        color: Colors.grey,

                      ),
                      Icon(Icons.comment,
                        color: Colors.grey,

                      )

                    ],
                  ),

                ]
                ),
            ),
              ],
            ),

      ),
    );
  }
}
