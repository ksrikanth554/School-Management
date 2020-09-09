import 'package:flutter/material.dart';

class AdminPortal extends StatefulWidget {
  @override
  _AdminPortalState createState() => _AdminPortalState();
}

class _AdminPortalState extends State<AdminPortal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text('Welcome to the Admin Portal'),
      ),
      
    );
  }
}