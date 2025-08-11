import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:ticket_app/users/logins/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
    );
  }
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
                      color: Colors.deepPurple[200],
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
