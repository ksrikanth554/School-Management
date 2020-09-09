import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolmanagement/utils/usertypes.dart';
import 'package:schoolmanagement/views/admin_portal.dart';
import 'package:schoolmanagement/views/student_portal.dart';
import 'package:schoolmanagement/views/teacher_portal.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _userType;
  TextEditingController userNameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        
        child: Card(
          elevation: 4.0,
            child: Container(
            color: Colors.white,
            height: size.height*0.4,
            width: size.width*0.6,
            child: ListView(
              
              children: [
                TextField(
                  controller: userNameController,
                  decoration:InputDecoration(
                    hintText: 'User Name',
                  ),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  //keyboardType: TextInputType.visiblePassword,
                  decoration:InputDecoration(
                    hintText: 'Password',
                    
                  ),
                ),
                DropdownButton(
                  items: userTypes.map((user){
                    return DropdownMenuItem<String>(
                      child: Text(user),
                      value: user,

                    );
                  }).toList(), 
                  onChanged: (currentuser){
                    setState(() {
                      _userType=currentuser;
                    });
                  },
                  value: _userType,
                  hint: Text('Select UserType'),
                ),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: (){
                    if (userNameController.text!=null && userNameController.text.trim()!=''
                       && passwordController.text!=null && passwordController.text.trim()!='') {
                      navigateToHomePage(_userType,context);
                    }
                    else{
                      showDialog(
                        context: context,
                        builder: (context){
                         return CupertinoAlertDialog(
                           title: Text('Message'),
                           content: Text('Please enter valid details'),
                           actions: [
                             FlatButton(onPressed: ()=>Navigator.pop(context), child:Text('ok'))
                           ],
                          );
                        }
                      );
                    }
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void navigateToHomePage(String _userType,context){
    switch (_userType) {
      case 'Student':
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (ctx)=>StudentPortal()));
      break;
      case 'Teacher':
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (ctx)=>TeacherPortal()));
      break;
      case 'Admin':
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (ctx)=>AdminPortal()));
      break;
      default:
      showAlert(context);
    }
  }
  showAlert(BuildContext context){
    showDialog(
      context: context,
      builder: (context){
        return CupertinoAlertDialog(
          title: Text('Message'),
          content: Text('please select user type'),
          actions: [
            FlatButton(onPressed: ()=>Navigator.pop(context), child:Text('ok'))
          ],
        );
      }
    );
  }
}