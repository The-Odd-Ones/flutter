import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneComment extends StatefulWidget {
  @override
  _OneCommentState createState() => _OneCommentState();
}

class _OneCommentState extends State<OneComment> {
  List<String> _comments = [
    "list of comments",
    "list 2 comments",
    "list commments 3"
  ];
  void _addComment(String val) {
    setState(() {
      _comments.add(val);
    });
  }

  Widget _buildCommentList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _comments.length) {
        return _buildCommentItem(
          _comments[index],
        );
      }
    });
  }

  Widget _buildCommentItem(String comment) {
    return ListTile(
      title: Text("comments"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildCommentList(),
          ),
          TextField(
            onSubmitted: (String submittedStr) {
              _addComment(submittedStr);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Add comment",
            ),
          ),
        ],
      ),
    );
    // return Card(
    //   margin: EdgeInsets.symmetric(
    //     vertical: 10,
    //     horizontal: 10,
    //   ),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: <Widget>[
    //       TextField(
    //         decoration: InputDecoration(
    //             labelText: 'comment here',
    //             contentPadding: EdgeInsets.all(5),
    //             border: new OutlineInputBorder(
    //               borderRadius: new BorderRadius.circular(15.0),
    //               borderSide: new BorderSide(),
    //             )),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           children: <Widget>[
    //             CircleAvatar(
    //               backgroundColor: Colors.blue,
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             Text(
    //               'name\n',
    //               style: TextStyle(fontWeight: FontWeight.bold),
    //             ),
    //             Text(
    //               ' \nthis is a comment',
    //               overflow: TextOverflow.ellipsis,
    //               maxLines: 5,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
