import 'package:flutter/material.dart';

class User {
  final String id;
  final String userName;
  final String firstName;
  final String lastName;
  final String bio;
  final String age;
  final String email;
  final String password;
  User(this.id, this.userName, this.firstName, this.lastName, this.bio,
      this.age, this.email, this.password);
}
