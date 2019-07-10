import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
// Explicit

// Method
  Widget showLogo() {
    return Container(
      width: 160.0,
      height: 160.0,
      child: Image.asset(
        'images/logo_car.png',
      ),
    );
  }

  Widget showText() {
    return Text(
      'Su TPA',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.grey[800],
        fontWeight: FontWeight.bold,
        fontFamily: 'Mitr',
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 240.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          hintText: 'you@email.com',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 240.0,
      child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password :',
            hintText: 'More 6 Charactor',
          )),
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.teal[800],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.teal[200],
      child: Text('Sign Up'),
      onPressed: () {},
    );
  }

  Widget showButton() {
    return Container(
      width: 240.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signInButton(),
          ),
          mySizeBox(),
          Expanded(
            child: signUpButton(),
          ),
        ],
      ),
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      width: 10.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.teal[800]],
            radius: 3.0,
            center: Alignment.topCenter,
          ),
        ),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            showText(),
            emailText(),
            passwordText(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
