import 'package:flutter/material.dart';
import 'package:ticket_app/pages/home.dart';
import 'package:ticket_app/users/logins/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket Buyer',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        builder: (context, dataSnapShot){
          return LoginScreen();
        }, future: null,
      )
    );
  }
}