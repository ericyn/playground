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
              height: 45,
              width: 45,
              icon: Icon(
                Icons.camera_alt, 
                color: Colors.white,
                size: 18,
              ),
              outerColor: Color(0xff0a0055), 
              innerColors:  [
                Color(0xff1c00d6),
                Color(0xff4510ff),
                Color(0xff5300ff)
              ]
            ),
          ]
        ),
      ),
    );
  }
}