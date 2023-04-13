import 'package:flutter/material.dart';
import 'package:playground/src/juicy%20circle%20butt/juicy_circle_button.dart';

class PagePagePage extends StatefulWidget {
  const PagePagePage({
    super.key,
    this.title = 'Just Page Pager boy'
  });

  final String title;

  static const routeName = '/page';

  @override
  State<PagePagePage> createState() => _PagePagePageState();
}

class _PagePagePageState extends State<PagePagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            JuicyCircleButton(
              animateButton: true,
              outerColor: Color.fromARGB(255, 4, 12, 117),
              innerColors: [
                Color.fromARGB(255, 85, 145, 255),
                Color.fromARGB(255, 7, 20, 202),
              ],
            ),
          ]
        ),
      ),
    );
  }
}