import 'dart:ui';
import 'package:fact_watch/functions/functionalities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:fact_watch/models/User.dart';
import 'package:flutter/material.dart';
import 'package:fact_watch/pallete.dart';
import 'package:fact_watch/widgets/widgets.dart';
import 'homePage.dart';
class UserInfoPage extends StatefulWidget {
  final bool comment;
  final bool homePage;
  UserInfoPage({required this.comment,required this.homePage});
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  TextEditingController email=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController website=TextEditingController();

  @override
  Widget build(BuildContext context) {
    email.text=Functionalities.user.email;
    website.text=Functionalities.user.website;
    name.text=Functionalities.user.name;
    Size size = MediaQuery.of(context).size;
    return Stack(

      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(

            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.black45,
                            child: Icon(
                              Icons.person,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        child: Icon(
                          Icons.arrow_upward,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    TextInputField(
                      icon:Icons.person,
                      hint: 'Name',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      controller: name,

                    ),
                    TextInputField(
                      icon: Icons.email_outlined,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
controller: email,
                    ),
                    TextInputField(
                      controller: website,
                        icon: Icons.lock,
                      hint: 'Website',
                      inputAction: TextInputAction.next,
                        inputType: TextInputType.text
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(buttonName: 'Save',function: () async {
                      User userInfo=new User(email:email.text,name:  name.text,website: website.text);
                      print(userInfo.toString());
                      SharedPreferences shared_User = await SharedPreferences.getInstance();
                      shared_User.setString('user', jsonEncode(userInfo));
                      Functionalities.user=userInfo;
// store your string list in shared prefs

                      if(!widget.homePage)widget.comment?Navigator.pop(context):Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomePage()));
                    },),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}