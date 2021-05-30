import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kparking/flutterfire.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id ='registration' ;
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formkey = GlobalKey<FormState>();
  String name="";
  String num="";
  String email="";
  String password="";
  String error="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
         key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              validator: (value)=> value.isEmpty?"Enter usrname": null,
              onChanged: (value) {
                setState(()=> name= value);
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your User name',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              validator : (value)=> value.length!=10 ?"Enter proper phone number": null,
              onChanged: (value) {
               setState(()=> num= value ); //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              validator: (value)=> value.isEmpty?'Enter mail id':null ,
              onChanged: (value) {
                setState(()=> email= value);
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              validator: (value)=> value.isEmpty||value.length<5?'password weak or null':null ,
              onChanged: (value) {
                setState(()=> password= value);
                //Do something with the user input.
              },

              decoration: InputDecoration(
                hintText: 'Enter your password',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    if(_formkey.currentState.validate()){
                    bool result = await register(email, password);
                    if(result)
                      {}
                    else{
                        setState(()=> error='PlEASE ENTER PROPER EMAIL ID');

                      }
                    //Implement rgistration functionality.
                   }
                    },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
              Center(
                child: Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.00),
                ),
              ),
          ],
        ),
        ),
      ),
    );
  }
}
