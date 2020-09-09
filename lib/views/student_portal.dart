import 'package:flutter/material.dart';

class StudentPortal extends StatefulWidget {
  @override
  _StudentPortalState createState() => _StudentPortalState();
}

class _StudentPortalState extends State<StudentPortal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text('Welcome to the Student Portal'),
      ),
      
    );
  }
}