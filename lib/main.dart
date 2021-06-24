import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Logins',
      theme: ThemeData(primarySwatch: Colors.blue,),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}



