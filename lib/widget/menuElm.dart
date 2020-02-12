import 'package:flutter/material.dart';

class MenuElement extends StatelessWidget {
  String comun;
  MenuElement(this.comun);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(comun),
      ),
    );
  }
}
