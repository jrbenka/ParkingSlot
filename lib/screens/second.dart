import 'package:flutter/material.dart';
import 'package:kparking/screens/login.dart';
import 'registraton.dart';


class Second extends StatefulWidget {
  static const String id= 'homescreen' ;
  Second({Key key, this.title}) : super(key: key);

  final String title;
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
  @override
  Widget build(BuildContext context) {
    // final userField = TextField(
    //   obscureText: false,
    //   style: style,
    //   decoration: InputDecoration(
    //       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
    //       hintText: "Username",
    //       border:
    //       OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    // );
    // final passwordField = TextField(
    //   obscureText: true,
    //   style: style,
    //   decoration: InputDecoration(
    //       contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //       hintText: "Password",
    //       border:
    //       OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    // );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.pushNamed(context, WelcomeScreen.id);
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final signupButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0,15.0),
        onPressed: () {
          Navigator.pushNamed(context, RegistrationScreen.id);
        },
        child: Text("Signup",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('K-PARKING')),)
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150.0,
                  child: Image.asset(
                    "images/car.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                // SizedBox(height: 25.0),
                // userField,
                // SizedBox(height: 25.0),
                // passwordField,
                SizedBox(
                  height: 25.0,
                ),
                loginButon,
                SizedBox(
                  height: 10.0,
                ),
                signupButon,
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

