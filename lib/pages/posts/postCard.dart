import 'package:community/pages/singlPost.dart';
import 'package:community/provider/post_Provider.dart';
import 'package:community/provider/postsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  //

  Widget buildPosts(post) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(SinglePost.routeName, arguments: post.id);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(post.userImg),
              ),
              title: Text(
                post.username,
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
                image: post.file != null
                    ? NetworkImage(post.file)
                    : NetworkImage(
                        'https://sciences.ucf.edu/psychology/wp-content/uploads/sites/63/2019/09/No-Image-Available.png'),
              ),
            ),
            Text(post.content),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<PostsProvider>(context);
    final postList = postData.posts;
    print(postList);
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: postList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: postList.map((post) => buildPosts(post)).toList(),
            ),
          );
        });
  }
}
