import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.red,
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String password = "correct";
  String animationType = "idle";
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    passwordFocusNode.addListener(() {
      if(passwordFocusNode.hasFocus) {
        setState(() {
          animationType = "test";
        });
      }
      else{
        animationType = "idle";
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.red, Colors.white],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 200,
          ),
          Center(
            child: Container(
              height: 300,
              width: 300,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: FlareActor(
                    "assets/teddy.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: animationType,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 200.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 200,
                      child: TextField(
                        textAlign: TextAlign.center,
                        autocorrect: false,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: "username",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        autocorrect: false,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                        ),
                        decoration: InputDecoration(
                          hintText: "password",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Material(
                        elevation: 5.0,
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30.0),
                        child: MaterialButton(
                          onPressed: () {
                            if(passwordController.text == password) {
                              setState(() {
                                animationType = "success";
                              });
                            }
                            else{
                              setState(() {
                                animationType = "fail";
                              });
                            }
                          },
                          minWidth: 200.0,
                          height: 42.0,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

