import 'package:flutter/material.dart';

import 'family_confirm_prompt.dart';

class FamilyView extends StatefulWidget {
  const FamilyView({
    super.key,
    this.title = 'Family Button Confirmation'
  });

  final String title;

  static const routeName = '/family';

  @override
  State<FamilyView> createState() => _FamilyViewState();
}

class _FamilyViewState extends State<FamilyView> with SingleTickerProviderStateMixin {

  late double _scale;
  late AnimationController _controller;

  bool _showPrompt = false;
  bool _changeButton = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.lightGreen,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.lightGreenAccent,
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
          _showPrompt 
          ? Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 40,
                    blurRadius: 30,
                    offset: Offset(0, 10),
                  )
                ]
              ),
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
            ),
          ) 
          : const SizedBox(),
          Align(
            alignment: Alignment.bottomCenter,
            child: FamilyPrompt(
              showPrompt: _showPrompt,
              bgColor: const Color.fromARGB(255, 178, 194, 207),
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _showPrompt = false;
                        _changeButton = false;
                      });
                    
                    }, 
                    icon: Icon(Icons.clear)
                  ),
                  
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  _showPrompt 
                  ? const SizedBox() 
                  : Container(
                    height: 90,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 40,
                          blurRadius: 30,
                          offset: Offset(0, 10),
                        )
                      ]
                    ),
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                  ),
                  GestureDetector(
                    onLongPress: () {
                      _controller.forward();
                    },
                    onLongPressEnd: (details) {
                      _controller.reverse().then((value) => {
                        // pull up the confirmation prompt
                        setState(() {
                          _showPrompt = true;
                          _changeButton = true;
                        })
                      });
                      if(_changeButton) 
                        print('do something on long press end');
                    },
                    onTap: (() {
                      _controller.forward();
                      Future.delayed(const Duration(milliseconds: 100), (() {
                        _controller.reverse();
                      })).then((value) => {
                        // pull up the confirmation prompt
                        setState(() {
                          _showPrompt = true;
                          _changeButton = true;
                        })
                      });
                      if(_changeButton) 
                        print('do something');
                          
                    }),
                    child: Transform.scale(
                      scale: _scale,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 6, 62, 109),
                            borderRadius: BorderRadius.circular(20 - 20 / 2),
                          ),
                          child: Center(
                            child: Text(
                              _changeButton ? 'Press for confirmation' :  'Press for prompt',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              )
                            ),
                            // AnimatedCrossFade(
                            //   crossFadeState: _changeButton ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            //   duration: const Duration(milliseconds: 250),
                            //   sizeCurve: Curves.easeInOutBack,
                            //   firstCurve: Curves.easeOutBack,
                            //   secondCurve: Curves.easeInBack,
                            //   firstChild: const Text(
                            //     'Press for prompt',
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 18,
                            //     )
                            //   ),
                            //   secondChild: const Text(
                            //     'Press for confirmation',
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 18,
                            //     )
                            //   ),
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
