import 'package:community/pages/singlPost.dart';
import 'package:community/provider/communityProvider.dart';
import 'package:community/provider/postsprovider.dart';
import 'package:flutter/material.dart';
import '../models/classPost.dart';
import '../models/classEvent.dart';
import 'mapWidget.dart';
import 'package:provider/provider.dart';
import 'package:community/provider/eventsProvider.dart';

class EventP extends StatefulWidget {
  static const routeName = '/singlEvent';
  @override
  _EventPState createState() => _EventPState();
}

class _EventPState extends State<EventP> {
  // List<Event> event = [
  //   Event(
  //     image:
  //         'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
  //     user: 'event title',
  //     title: 'Be yourself; everyone else is already taken',
  //     description:
  //         'description: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  //   ),
  // ];

  // List<Post> posts = [
  //   Post(
  //       user: 'Osca Wilde',
  //       text: 'Be yourself; everyone else is already taken'),
  //   Post(user: 'Osca Wil', text: 'I have nothing to declare except my genius'),
  //   Post(user: 'Osca WIlde', text: 'The truth is rarely pure and never simple'),
  //   Post(
  //       user: 'Osca Wilde',
  //       text: 'Be yourself; everyone else is already taken'),
  //   Post(user: 'Osca Wil', text: 'I have nothing to declare except my genius'),
  //   Post(user: 'Osca WIlde', text: 'The truth is rarely pure and never simple'),
  // ];

//cover Image
  Widget _buildCoverImage(Size screenSize) {
    return Container(
      // child: MapPage(),
      height: screenSize.height / 4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://sciences.ucf.edu/psychology/wp-content/uploads/sites/63/2019/09/No-Image-Available.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

//profile Image
  Widget _buildProfileImage(event) {
    return Center(
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: event.file != null
                ? NetworkImage(event.file)
                : NetworkImage(
                'https://sciences.ucf.edu/psychology/wp-content/uploads/sites/63/2019/09/No-Image-Available.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80),
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
        ),
      ),
    );
  }

//title
  Widget _buildTitle(event) {
    TextStyle _nameTextStyle = TextStyle(
      fontSize: 28,
      fontFamily: 'Robot',
      color: Colors.black,
    );
    return Text(
      event.title,
      style: _nameTextStyle,
    );
  }

// description
  Widget _buildDescription(BuildContext context, event) {
    TextStyle descriptionTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontStyle: FontStyle.italic,
      color: Colors.grey,
      fontSize: 16,
    );
    return Container(
      // color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8),
      child: Text(
        event.description,
        // != null
        //     ? event.description
        //     : Text("no Description available"),
        textAlign: TextAlign.center,
        style: descriptionTextStyle,
      ),
    );
  }

//post
  Widget postTemplate(post) {
    return Card(
      margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              post.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

  @override
  //events template
  Widget buildEvent(event) {
    Size screenSize = MediaQuery.of(context).size;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(MapPage.routeName, arguments: event.location);
              },
              child: _buildCoverImage(screenSize),
            ),
            _buildProfileImage(event),
            _buildTitle(event),
            _buildDescription(context, event),
          ],
        ),
      ),
    );
  }

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
                // verifLiked(),
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

  Widget build(BuildContext context) {
    Provider.of<EventsProvider>(context);
    Provider.of<PostsProvider>(context);
    Provider.of<CommunityProvider>(context);
    final eventId = ModalRoute.of(context).settings.arguments as String;
    Size screenSize = MediaQuery.of(context).size;
    final eventData = Provider.of<EventsProvider>(context);
    final postProv = Provider.of<PostsProvider>(context);
    final commProv = Provider.of<CommunityProvider>(context);

    final event =
        eventData.events.firstWhere((element) => element.id == eventId);

    final commuinty = commProv.commuinities
        .firstWhere((element) => element.commuintyId == event.community);
    final postData = postProv.getPostsbyEvents(eventId, commuinty.commuintyId);
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Event'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(height: screenSize.height / 5),
                Column(children: <Widget>[
                  buildEvent(event),
                ]),
              ],
            ),
            Column(
              children: postProv.posts.map((post) => buildPosts(post)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}