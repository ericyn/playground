import 'package:flutter/material.dart';

class SubstackView extends StatefulWidget {
  const SubstackView({super.key});

  static const routeName = '/substack';

  @override
  State<SubstackView> createState() => _SubstackViewState();
}

class _SubstackViewState extends State<SubstackView> {

  bool activateSubStack = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.fastOutSlowIn,
            top: 0,
            bottom: activateSubStack ? 75 : 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: activateSubStack ? height * 0.8 : height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: activateSubStack ? const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)) : BorderRadius.zero
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        activateSubStack = !activateSubStack;
                      });
                    }, 
                    icon: const Icon(Icons.handshake)
                  )
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            bottom: activateSubStack ? 0 : -100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: activateSubStack ? const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)) : BorderRadius.zero
              ),
              height: height * 0.08, 
              width: width,
            )
          ),
        ],
      ),
    );
  }
}