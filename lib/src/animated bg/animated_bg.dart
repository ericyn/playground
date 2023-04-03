import 'package:flutter/material.dart';
import 'package:playground/src/sexy%20prompts/sexy_prompts.dart';

class AnimatedGradient extends StatefulWidget {
  const AnimatedGradient({
    super.key,
    this.title = 'Animated Background'
  });

  final String title;

  static const routeName = '/animatedGradient';

  @override
  State<AnimatedGradient> createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient> {
  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            onEnd: () {
              setState(() {
                index = index + 1;
                // animate the color
                bottomColor = colorList[index % colorList.length];
                topColor = colorList[(index + 1) % colorList.length];

                //// animate the alignment
                // begin = alignmentList[index % alignmentList.length];
                // end = alignmentList[(index + 2) % alignmentList.length];
              });
            },
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: begin,
                end: end, 
                colors: [bottomColor, topColor]
              )
            ),
          ),
          Positioned.fill(
            child: IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                setState(() {
                  bottomColor = Colors.blue;
                });
              },
            ),
          ),
          Positioned(
            bottom: 50,
            child: Center(
              child: IconButton(
                icon: Icon(Icons.abc),
                onPressed: () {
                  showDialog(context: context, builder: (BuildContext context) => SexyPrompt(title: 'help'));
                },
              ),
            ),
          )
        ],
      )
    );
  }
}
