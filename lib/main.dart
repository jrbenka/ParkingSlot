import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kparking/Extras/Bottomsheet.dart';
import 'package:kparking/screens/login.dart';
import 'package:kparking/screens/loginmanager.dart';
import 'package:kparking/screens/loginuser.dart';
import 'package:kparking/screens/userpage.dart';
import 'screens/registraton.dart';
import 'screens/second.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp()
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kpark',
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      initialRoute: Second.id,
      routes: {
        Second.id:(context)=>Second(),
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        LoginUScreen.id:(context)=>LoginUScreen(),
        LoginMScreen.id:(context)=>LoginMScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        UserPage.id:(context)=>UserPage(),
        DraggableSheet.id:(context)=>DraggableSheet(),


      },
    );
  }
}
