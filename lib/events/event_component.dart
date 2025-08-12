import 'package:flutter/material.dart';

class EventComponent {
  String name;
  String imgPath;
  Color boxColor;
  String description;

  EventComponent({
    required this.name,
    required this.imgPath,
    required this.boxColor,
    required this.description,
});

  static List<EventComponent> getEvents() {
    List<EventComponent> events = [];

    events.add(
      EventComponent(
          name: 'FGC Tournament',
          imgPath: 'assets/icons/game.svg',
          boxColor: Color(0xFFB39DDB),
          description: 'Come join us in Vegas to compete in one of the '
              'biggest fighting game events of the year! Could you become '
              'the next FGC moment 39?'
      ),
    );

    events.add(
        EventComponent(
            name: 'Baking competition',
            imgPath: 'assets/icons/baking.svg',
            boxColor: Color(0xFFB39DDB),
            description: 'Do you thing you have the chops to cook with some'
                'of the best? Lets see what you can cook up!'
        ),
    );

    events.add(
        EventComponent(
            name: 'TWRPs Birthday Bash',
            imgPath: 'assets/icons/birthday.svg',
            boxColor: Color(0xFFB39DDB),
            description: "'TWRP is coming to a town near you, to spend their birthday with YOU!! "
                "don't you feel special~? Come on down for cake, festivities, and "
                "rockin' music, maybe NSP will be there??? "
        ),
    );

    events.add(
        EventComponent(
            name: 'All You Can Eat Festival',
            imgPath: 'assets/icons/food.svg',
            boxColor: Color(0xFFB39DDB),
            description: 'The name says it all! Get your forks and spoons ready, '
                'brings your friends, and get ready to chow down on some of the most'
                'amazing food you cna find in Charlotte!'
        ),
    );

    events.add(
        EventComponent(
            name: 'Coffee Convention',
            imgPath: 'assets/icons/coffee.svg',
            boxColor: Color(0xFFB39DDB),
            description: "Weather you're a coffee drinker or a coffee maker, "
                "there is something for everyone to enjoy here at the Coffee"
                "Convention!"
        ),
    );

    return events;
  }
}