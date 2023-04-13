import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class JuicyCircleButton extends StatefulWidget {
  const JuicyCircleButton({
    super.key,
    required this.animateButton,
    required this.outerColor,
    required this.innerColors,
    this.width = 50,
    this.height = 50,
  });

  final bool animateButton;
  final Color outerColor;
  final List<Color> innerColors;
  final double width;
  final double height;

  @override
  State<JuicyCircleButton> createState() => _JuicyCircleButtonState();
}

class _JuicyCircleButtonState extends State<JuicyCircleButton> {

  static const double _shadowHeight = 4;
  double _position = 4;

  @override
  Widget build(BuildContext context) {
    double height = widget.height - _shadowHeight;
    return SizedBox(
      height: widget.height + _shadowHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Transform(
              transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(-0.4),
              alignment: Alignment.topCenter,
              child: Container(
                height: height,
                width: widget.width,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.outerColor,
                  border: Border.all(color: widget.outerColor),
                ),
                child: const Center(
                  child: Icon(Icons.add, color: Colors.white)
                ),
              ).animate(target: widget.animateButton ? 1 : 0,).scale(),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.elasticIn,
            bottom: _position,
            duration: const Duration(milliseconds: 70),
            child: Transform(
              transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(-0.4),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTapUp: (_) {
                  setState(() {
                    _position = 4;
                  });
                },
                onTapDown: (_) {
                  setState(() {
                    _position = 0;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _position = 4;
                  });
                },
                child: Container(
                  height: height,
                  width: widget.width,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: widget.innerColors
                    ),
                    border: Border.all(color: const Color.fromARGB(255, 4, 12, 117))
                  ),
                  child: const Center(
                    child: Icon(Icons.add, color: Colors.white)
                  ),
                )
                .animate(target: widget.animateButton ? 1 : 0,)
                .scale()
              ),
            ),
          ),
        ],
      ),
    );
  }
}