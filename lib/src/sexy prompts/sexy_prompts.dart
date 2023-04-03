import 'dart:ui';

import 'package:flutter/material.dart';

class SexyPrompt extends StatelessWidget {
  const SexyPrompt({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: AlertDialog(
        title: Text(title),
        shadowColor: Colors.transparent,
        //backgroundColor: Colors.white.withOpacity(0.6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text('Hello'), 
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  final String title;
  final String body;
  final String picture;

  const CustomDialog({
    super.key,
    required this.title,
    required this.body,
    required this.picture,
  });

  @override
  State<StatefulWidget> createState() => CustomDialogState();
}

class CustomDialogState extends State<CustomDialog> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeInCubic);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            margin: EdgeInsets.all(50.0),
            //padding: EdgeInsets.fromLTRB(0, 15,0,0),
            height: 500,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            child: Column(
              children: [
                
                SizedBox(height: 10),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.body,
                        
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Expanded(
                //   child: Container(
                //     color: Colors.red,
                //     padding: EdgeInsets.all(15),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         // Center(
                //         //     child: Image(
                //         //       image: AssetImage('assets/images/2.png'),
                //         //       height: 80,
                //         //     ),
                //         //   ),
                          
                //         Text(
                //           "Oops!",
                //           style: Theme.of(context)
                //             .textTheme
                //             .headline6
                //             .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                //         ),
                //         SizedBox(height: 10),
                //         Text(
                //           "Look's like all the data has already been uploaded. You're all set!",
                //           style: Theme.of(context)
                //             .textTheme
                //             .subtitle1
                //             .copyWith(color: Colors.black,),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                  
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      //color: Colors.blue,
                      height: 50,
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.black.withOpacity(0.5)
                          ),
                          // Expanded(
                          //   child: Divider(
                          //     color: Colors.black
                          //   )
                          // ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      
                                     setState(() {
                                       scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeOutBack);
                                     });
                                     controller.reverse().then((value) =>  Navigator.pop(context));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6)),
                                      //  color: Colors.lightBlueAccent,
                                      ),
                                      height: 45,
                                      child: Center(
                                        child: Text(
                                          "OK"
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   child: VerticalDivider(
                                //     color: Colors.black,    
                                //   )
                                // ),
                                // Expanded(  
                                //   child: InkWell(
                                //     onTap: ()=> print('cancel yah yeah'),
                                //     child: Container(
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.only(bottomRight: Radius.circular(6)),
                                //       //  color: Colors.blue,
                                //       ),
                                //       height: 45,
                                //       child: Center(
                                //         child: Padding(
                                //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                //           child: Text(
                                //             "Canecle"
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ),
              ]
            ),
          ),
        )
      )
    );
  }
}