import 'package:flutter/material.dart';
import '../models/classFollower.dart';

class FollowersPage extends StatelessWidget {
  List<Follower> followers = [
    Follower(
      image:
          'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'Osca Wilde',
      text: 'Be yourself; everyone else is already taken',
    ),
    Follower(
      user: 'Osca hgjil2',
      text: 'I have nothing to declare except my genius ',
    ),
    Follower(
      image:
          'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'Os455jca Wi9e',
      text: 'Be yourself; everyone else is already taken',
    ),
    Follower(
      // image:
      //     'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'Osdgca Wi5lde',
      text: 'Be yourself; everyone else is already taken',
    ),
    Follower(
      image:
          'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'Os547 W7l2',
      text: 'I have nothing to declare except my genius ',
    ),
    Follower(
      // image:
      //     'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'O89a Wilde',
      text: 'Be yourself; everyone else is already taken',
    ),
    Follower(
      user: 'Osca W58l2',
      text: 'I have nothing to declare except my genius ',
    ),
    Follower(
      image:
          'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'Osca Wie215',
      text: 'Be yourself; everyone else is already taken',
    ),
    Follower(
      user: 'Osca Wil2',
      text: 'I have nothing to declare except my genius ',
    ),
  ];

//follower
  Widget followerTemplate(follower) {
    return Card(
      margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundImage:
                  // NetworkImage(
                  //     'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg'),
                  follower.image != null
                      ? NetworkImage(follower.image)
                      : NetworkImage(
                          'https://www.pngitem.com/pimgs/m/285-2855629_profile-clipart-hd-png-download.png'),
              radius: 30,
            ),
            SizedBox(height: 8.0),
            Text(
              follower.user,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    children: followers
                        .map((follower) => followerTemplate(follower))
                        .toList(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
