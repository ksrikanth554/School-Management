import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class TeacherPortal extends StatefulWidget{
  @override
 _TeacherPortalState createState()=>_TeacherPortalState();
}

class _TeacherPortalState extends State<TeacherPortal>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child:Text('Welcome to the Teacher Portal') ,
      ),
    );
  }
}