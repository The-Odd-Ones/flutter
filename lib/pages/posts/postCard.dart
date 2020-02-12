import 'package:flutter/material.dart';
import '../../models/classPost.dart';

class PostCard extends StatefulWidget {
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;
  var likeCol = '';
  verifLiked() {
    if (liked = true) {
      return Icon(
        Icons.favorite_border,
        size: 20,
        color: Colors.red,
      );
    } else {
      return Icon(
        Icons.favorite_border,
        size: 20,
        color: Colors.grey,
      );
    }
  }

  List<Post> posts = [
    Post(
        image:
            'https://r-cf.bstatic.com/images/hotel/max1024x768/208/208351646.jpg',
        user: 'Osca Wilde',
        text: 'Be yourself; everyone else is already taken'),
    // Post(user: 'Osca Wil', text: 'I have nothing to declare except my genius'),
    // Post(user: 'Osca WIlde', text: 'The truth is rarely pure and never simple'),
    Post(
        image:
            'https://r-cf.bstatic.com/images/hotel/max1024x768/208/208351646.jpg',
        user: 'Osca Wilde',
        text: 'Be yourself; everyone else is already taken'),
    Post(
        image:
            'https://r-cf.bstatic.com/images/hotel/max1024x768/208/208351646.jpg',
        user: 'Osca Wil',
        text: 'I have nothing to declare except my genius'),
    // Post(user: 'Osca WIlde', text: 'The truth is rarely pure and never simple'),
  ];

  Widget buildPosts(posts) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://hairstylecamp.com/wp-content/uploads/famous-actresses-with-brown-hair-16.jpg'),
            ),
            title: Text(
              posts.user,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              'marooo',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ),
          Container(
            child: Image(
              image: NetworkImage != null
                  ? NetworkImage(posts.image)
                  : NetworkImage(
                      'https://sciences.ucf.edu/psychology/wp-content/uploads/sites/63/2019/09/No-Image-Available.png'),
            ),
          ),
          Text(posts.text),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              verifLiked(),
              Icon(
                Icons.share,
                color: Colors.grey,
              ),
              Icon(
                Icons.comment,
                color: Colors.grey,
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: posts.map((post) => buildPosts(post)).toList(),
            ),
          );
        });
  }
}
