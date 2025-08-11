import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../users/logins/login_screen.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen>
{

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObscure = true.obs;


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.deepPurple[100],
      body: LayoutBuilder(
        builder: (context, cons)
        {
          return  ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),

            // Login Header
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child:
                    Container(
                      alignment: Alignment.center,
                      child:
                      Text('About This Event:',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //nav
  AppBar appBar() {
    return AppBar(
      title: Text(
        'Ticket App',
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,

      actions: [
        Builder(
            builder: (context) {
              return GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen())
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: 37,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[100],
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Icon(
                        Icons.person_2_outlined,
                        color: Colors.deepPurple
                    ),
                  )
              );
            }
        )
      ],
    );
  }
}
