import 'package:flutter/material.dart';
import 'package:mcerebrum_main_flutter/utils/uidata.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Colors.black87,
        title: Text("Login to Server"),
        actions: <Widget>[
          SizedBox(
            width: 5.0,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: loginBody(context),
      ),
    );
  }

  loginBody(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[loginHeader(), loginFields(context)],
    ),
  );

  loginHeader() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      new Container(
        width: 80.0,
        height: 80.0,
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/images/cerebral_cortex.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
/*
      FlutterLogo(
        colors: Colors.green,
        size: 80.0,
      ),
*/
      SizedBox(
        height: 30.0,
      ),
      Text(
        "Welcome to Cerebral Cortex",
        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
      ),
      SizedBox(
        height: 5.0,
      ),
      Text(
        "Sign in to continue",
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );

  loginFields(BuildContext context) => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          child: TextField(
            maxLines: 1,
            maxLength: 30,
            decoration: InputDecoration(
                hintText: "Enter your username",
                labelText: "Username",
                icon: new Icon(Icons.person_outline)
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: TextField(
            maxLines: 1,
            maxLength: 30,
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Enter your password",
                labelText: "Password",
                icon: new Icon(Icons.lock_outline)
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: TextField(
            maxLines: 1,
            maxLength: 30,
            obscureText: false,
            decoration: InputDecoration(
                hintText: "www.frodo.edu",
                labelText: "Server",
                icon: new Icon(Icons.cloud_queue)
            ),
          ),
        ),

        SizedBox(
          height: 30.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          width: double.infinity,
          child: RaisedButton(
            padding: EdgeInsets.all(12.0),
            shape: StadiumBorder(),
            child: Text(
              "SIGN IN",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context,UIData.serverRoute);

            },
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          "SIGN UP FOR AN ACCOUNT",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}
