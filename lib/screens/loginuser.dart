import 'package:flutter/material.dart';
import 'package:kparking/flutterfire.dart';
import 'package:kparking/screens/userpage.dart';

class LoginUScreen extends StatefulWidget {
  static const String id = 'loginuser';
  LoginUScreen({Key key}) : super(key: key);
  @override
  _LoginUScreenState createState() => _LoginUScreenState();
}

class _LoginUScreenState extends State<LoginUScreen> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField =TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String error="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child:Form(
          key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 150.0,
              child: Image.asset('images/user.png'),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextFormField(
              validator: (value)=> value.isEmpty ?'Enter email':null,
              controller: _emailField,
              onChanged: (value){},
              decoration: InputDecoration(
                hintText: 'Enter your mail id ',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              validator: (value)=> value.length<5 || value.isEmpty?'Password null ':null,
              controller: _passwordField,
              obscureText: true,
              onChanged: (value){},
              decoration: InputDecoration(
                hintText: 'Enter your password.',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            //  Padding(
            //   padding: EdgeInsets.symmetric(vertical: 16.0),
            //   child: Material(
            //     color: Colors.red,
            //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
            //     elevation: 5.0,
            //     child: MaterialButton(
            //       minWidth: 200.0,
            //       height: 42.0,
            //       onPressed: () async {
            //         bool shouldNavigate =
            //          await register(_emailField.text,_passwordField.text);
            //         if(shouldNavigate){
            //         Navigator.pushNamed(context, UserPage.id);
            //         //Implement login functionality.
            //       }
            //       },
            //       child: Text(
            //         'Register',
            //         style: TextStyle(
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
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
                  minWidth: 200.0,
                  height: 42.0,
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      bool shouldNavigate = await signIn(
                          _emailField.text, _passwordField.text);
                      if (shouldNavigate) {
                        Navigator.pushNamed(context, UserPage.id);

                        }
                      else{
                        setState(()=> error='WRONG PASSWORD OR WRONG MAIL ID');
                        //Implement login functionality.
                      }
                      }
                    },
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          SizedBox(height: 20.0),
          Center(
            child: Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 15.00),
        ),
          ),
         ]
        ),
      ),
    ),
    );
  }
}
