import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolmanagement/resources/student_res/student_module.dart';
import 'package:schoolmanagement/views/login.dart';
import 'package:schoolmanagement/views/student_views/profile.dart';
import 'package:schoolmanagement/views/student_views/studentwork_details.dart';
import 'package:schoolmanagement/views/student_views/subjectwise_notes.dart';
import 'package:schoolmanagement/views/student_views/subjectwise_videos.dart';
import 'package:schoolmanagement/views/student_views/syllabus.dart';

class StudentPortal extends StatefulWidget {
  final String userName;
  StudentPortal(this.userName);
  @override
  _StudentPortalState createState() => _StudentPortalState();
}

enum ModulePage{
  profile,
  syllabus,
  subjectwisenotes,
  subjectwisevideos,
  studnetworkdetails,
}

class _StudentPortalState extends State<StudentPortal> {
  ModulePage _modulePage=ModulePage.profile;
  Widget page=Profile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Student Portal'),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount:StudentRes.studentNavDrawerList.length,
        
          itemBuilder: (ctx,index){
            var value=StudentRes.studentNavDrawerList[index];
            if (value=='User Name') {
                return UserAccountsDrawerHeader(
                accountName: Text(widget.userName),
                accountEmail: null,
                currentAccountPicture: CircleAvatar(
                  child: Container(decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),),
                ),
              );
              
            }
            else{
               return Column(
                 children: [
                   InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      setState(() {
                        //_modulePage=ModulePage.profile;
                        switch (value){
                          case 'Profile' :
                             _modulePage=ModulePage.profile;                         
                          break;
                          case 'Syllabus' :
                             _modulePage=ModulePage.syllabus;                         
                          break;
                          case 'Subject Wise Notes' :
                             _modulePage=ModulePage.subjectwisenotes;                         
                          break;
                          case 'Subject Wise Videos' :
                             _modulePage=ModulePage.subjectwisevideos;                         
                          break;
                          case 'Student Work Details' :
                             _modulePage=ModulePage.studnetworkdetails;                         
                          break;
                          
                        }
                      });
                      if (value=='LogOut') {
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(builder:(ctx)=>Login())
                        );
                      }
                    },
                      child: Container(
                        height: 30,
                        //alignment: Alignment.topCenter,
                       // margin: EdgeInsets.only(bottom: 10,top: 5),
                       child: Center(child: Text(value)),
                    ),
                   ),
                   
                   Divider(thickness: 1,)
                 ],
               );
            }
          }, 
          
        )
      ),
      body:bodyView(_modulePage)
      
    );
  }
  Widget bodyView(ModulePage _modulePage){
    switch (_modulePage) {
      case ModulePage.profile:
       return Profile();  
      break;
      case ModulePage.syllabus:
       return Syllabus();
      break;
      case ModulePage.subjectwisenotes:
        return SubjectWiseNotes();
      break;
      case ModulePage.subjectwisevideos:
        return SubjectWiseVideos();
      break;
      case ModulePage.studnetworkdetails:
        return StudentWorkDetails();
      break;
    }
  }
}