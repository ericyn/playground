import 'package:flutter/material.dart';

class FamilyPrompt extends StatelessWidget {
  const FamilyPrompt({
    super.key,
    required this.showPrompt,
    required this.child,
    this.height = 400,
    required this.bgColor,
  });

  final bool showPrompt;
  final Widget child;
  final double height;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showPrompt ? 1 : 0,
      duration: const Duration(milliseconds: 50),
      child: AnimatedContainer(
        curve: Curves.easeInOutQuart,
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: showPrompt ? height : 0,
        width: MediaQuery.of(context).size.width,
        child: child
      ),
    );
  }
}