import 'package:flutter/material.dart';
import 'package:playground/widgets/animated_reveal_stack.dart';

class MyWidget {
  const MyWidget({
    required this.name,
    required this.description,
    required this.color,
    required this.route,
  });

  final String name;
  final String description;
  final Color color;
  final PageRoute<dynamic> Function() route;
}

final List<MyWidget> myWidgets = [
  const MyWidget(
    name: 'Animated Reveal Stack',
    description: "Taken from Family's Token page",
    color: Colors.blue,
    route: AnimatedRevealStack.route,
  ),
];
