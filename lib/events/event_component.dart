import 'package:flutter/material.dart';

class EventComponent {
  String name;
  String imgPath;
  Color boxColor;

  EventComponent({
    required this.name,
    required this.imgPath,
    required this.boxColor,
});

  static List<EventComponent> getEvents() {
    List<EventComponent> events = [];

    events.add(
      EventComponent(
          name: 'FGC Tournament',
          imgPath: 'assets/icons/game.svg',
          boxColor: Color(0xFFB39DDB))
    );

    events.add(
        EventComponent(
            name: 'Baking competition',
            imgPath: 'assets/icons/baking.svg',
            boxColor: Color(0xFFB39DDB))
    );

    events.add(
        EventComponent(
            name: 'TWRPs Birthday Bash',
            imgPath: 'assets/icons/birthday.svg',
            boxColor: Color(0xFFB39DDB))
    );

    events.add(
        EventComponent(
            name: 'All You Can Eat Festival',
            imgPath: 'assets/icons/food.svg',
            boxColor: Color(0xFFB39DDB))
    );

    events.add(
        EventComponent(
            name: 'Coffee Convention',
            imgPath: 'assets/icons/coffee.svg',
            boxColor: Color(0xFFB39DDB))
    );

    return events;
  }
}