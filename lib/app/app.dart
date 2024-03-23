import 'package:flutter/material.dart';
import 'package:playground/app/widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'LFE Sans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          background: Colors.white,
          surface: Colors.white,
          surfaceTint: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Playground',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            final myWidget = myWidgets[index];

            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(myWidget.route());
              },
              child: Card(
                surfaceTintColor: myWidget.color,
                child: Center(
                  child: Text(
                    myWidget.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: myWidgets.length,
        ),
      ),
    );
  }
}
