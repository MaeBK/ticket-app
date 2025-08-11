import 'package:flutter/material.dart';
import 'package:ticket_app/events/event_component.dart';
import 'package:ticket_app/users/logins/login_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<EventComponent> events = [];

  void _getEvents(){
    events = EventComponent.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    _getEvents();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.deepPurple[100],

      //event holder
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left:15),
            child: Text('Events',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 700,
            child: ListView.separated(
              itemCount: events.length,
              padding: EdgeInsets.only(
                left: 75,
                right: 75,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemBuilder: (context, index){

                //event boxes
                return Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: events[index].boxColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(

                        ),
                      ),

                      //link to ticket buyer
                      Material(
                        color: Colors.deepPurple[300],
                        borderRadius: BorderRadius.circular(25),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => HomePage())
                            );
                          },
                          borderRadius: BorderRadius.circular(25),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 28,
                            ),
                            child: Text(
                              'Learn More / Buy Tickets',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
  //navbar
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
