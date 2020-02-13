import 'package:flutter/material.dart';
import '../models/classEvent.dart';
import '../widget/eventWidget.dart';

class Events extends StatefulWidget {
  static const routeName = '/events';
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<Event> events = [
    Event(
      image:
      'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'event title',
      title: 'Be yourself; everyone else is already taken',
      description: 'Be yourself; everyone else is already taken',
    ),
    Event(
      // image:
      //     'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'Osca hgjil2',
      title: 'I have nothing to declare except my genius ',
      description:
      'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea ',
    ),
    Event(
      image:
      'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'Os455jca Wi9e',
      title: 'Be yourself; everyone else is already taken',
      description: 'Be yourself; everyone else is already taken',
    ),
    Event(
      image:
      'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'Osdgca Wi5lde',
      title: 'Be yourself; everyone else is already taken',
      description:
      'commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    Event(
      // image:
      //     'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'Os547 W7l2',
      title: 'I have nothing to declare except my genius ',
      description: 'Be yourself; everyone else is already taken',
    ),
    Event(
      image:
      'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'O89a Wilde',
      title: 'Be yourself; everyone else is already taken',
      description:
      'commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    Event(
      // image:
      //     'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
      user: 'Osca W58l2',
      title: 'I have nothing to declare except my genius ',
      description:
      'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea ',
    ),
  ];

//cover Image
  Widget _buildCoverImage(Size screenSize, event) {
    return Container(
      height: screenSize.height / 4.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: event.image != null
              ? NetworkImage(event.image)
              : NetworkImage(
              'https://sciences.ucf.edu/psychology/wp-content/uploads/sites/63/2019/09/No-Image-Available.png'),
          fit: BoxFit.cover,
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
      event.user,
      style: _nameTextStyle,
    );
  }

// description
  Widget _buildDescription(BuildContext context, event) {
    TextStyle _descriptionTextStyle = TextStyle(
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
        style: _descriptionTextStyle,
      ),
    );
  }

//events template
  Widget buildEvents(event) {
    Size screenSize = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            navigateToEventP(context);
          },
          child: Column(
            children: <Widget>[
              _buildCoverImage(screenSize, event),
              _buildTitle(event),
              _buildDescription(context, event),
            ],
          ),
        ),
      ),
    );
  }

  Future navigateToEventP(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EventP()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Events'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    children:
                    events.map((event) => buildEvents(event)).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
