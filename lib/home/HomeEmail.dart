import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/authentication/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';

class HomeEmail extends StatefulWidget {
  @override
  _HomeEmailState createState() => _HomeEmailState();
}

class _HomeEmailState extends State<HomeEmail> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocalStorageData();
  }

  getLocalStorageData() async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     setState(() {
       this.email = sharedPreferences.getString(emails);
     });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[

              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                this.email==null?"":this.email,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () async {
                  await _auth.signOut();
                  isLogin();
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext) => Login()));
                },
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }

  isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(isEmailLogin, false);
    sharedPreferences.setString(email, " ");
  }


}
