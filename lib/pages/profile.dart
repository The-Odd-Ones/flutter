import 'package:flutter/material.dart';
import '../models/classPost.dart';
import '../widget/followingWidget.dart';
import '../widget/followersWidget.dart';
import './editProfil.dart';
import '../provider/user_provider.dart';

//import './editProfile.dar';
class Profile extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String _followers = "125";
  final String _following = "100";
  final String fullName = "Name";
  final String bio =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
  List<Post> posts = [
    Post(
        user: 'Osca Wilde',
        text: 'Be yourself; everyone else is already taken'),
    Post(user: 'Osca Wil', text: 'I have nothing to declare except my genius'),
    Post(user: 'Osca WIlde', text: 'The truth is rarely pure and never simple'),
    Post(
        user: 'Osca Wilde',
        text: 'Be yourself; everyone else is already taken'),
    Post(user: 'Osca Wil', text: 'I have nothing to declare except my genius'),
    Post(user: 'Osca WIlde', text: 'The truth is rarely pure and never simple'),
  ];

//cover Image
  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 4.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

//profile Image
  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
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

//fullName
  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontSize: 28,
      fontFamily: 'Robot',
      color: Colors.black,
    );
    return Text(
      fullName,
      style: _nameTextStyle,
    );
  }

//profile bio
  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontStyle: FontStyle.italic,
      color: Colors.grey,
      fontSize: 16,
    );
    return Container(
      // color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8),
      child: Text(
        bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

// followers and following
  Widget _buildStatItem(String label, String count) {
    TextStyle _stateLabelTextStyle = TextStyle(
      fontSize: 16,
      fontFamily: 'Roboto',
      color: Colors.black,
    );

    TextStyle _stateCountTextStyle = TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _stateCountTextStyle,
        ),
        Text(
          label,
          style: _stateLabelTextStyle,
        ),
      ],
    );
  }

  Future navigateToFollowersPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FollowersPage()));
  }

  Future navigateToFollowingPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FollowingPage()));
  }

// profile state
  Widget _buildStateContainer() {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: GestureDetector(
              onTap: () {
                navigateToFollowersPage(context);
                print('followers clicked');
              },
              child: _buildStatItem("Followers", _followers),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                navigateToFollowingPage(context);
                print('following clicked');
              },
              child: _buildStatItem("Following", _following),
            ),
          ),
        ],
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
            Text(
              post.user,
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
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.account_box),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProfil.routeName);
              }),
        ],
        title: Text('Profile Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                _buildCoverImage(screenSize),
                Column(
                  children: <Widget>[
                    SizedBox(height: screenSize.height / 8),
                    _buildProfileImage(),
                    _buildFullName(),
                    _buildBio(context),
                    _buildStateContainer(),
                  ],
                ),
              ],
            ),
            Column(
              children: posts.map((post) => postTemplate(post)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

//SafeArea(
//   child: SingleChildScrollView(
//     child: Column(
//       children: <Widget>[
//         _buildCoverImage(screenSize),

//         // ClipPath(
//         //   child: Container(
//         //     // child: Image.network(
//         //     //   "https://cdn.pixabay.com/photo/2019/09/29/21/00/background-4514414_960_720.jpg",
//         //     // ),
//         //     color: Colors.grey,
//         //     width: 400.0,
//         //     height: 200.0,
//         //   ),
//         // ),
//         Center(
//           child: CircleAvatar(
//             radius: 60,
//             backgroundImage: AssetImage('assets/ninja.jpg'),
//           ),
//         ),
//         // left: (MediaQuery.of(context).size.width/2) - radius,
//         // top: topWidgetHeight - avatarRadius,
//         Text(
//           '$fullName',
//           style: TextStyle(
//             fontSize: 25,
//           ),
//         ),
//         Container(
//           child: Text('$bio'),
//         ),
//         SizedBox(
//           height: 30,
//           width: 350,
//           child: Divider(
//             color: Colors.teal,
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 child: Text('_Followers ($_followers)'),
//                 padding: EdgeInsets.all(30),
//                 color: Colors.cyan,
//               ),
//               Container(
//                 child: Text('Following ($following)'),
//                 padding: EdgeInsets.all(30),
//                 color: Colors.pinkAccent,
//               ),
//             ],
//           ),
//         ),
//         Column(
//           children: posts.map((post) => postTemplate(post)).toList(),
//         ),
//       ],
//     ),
//   ),
// ),
