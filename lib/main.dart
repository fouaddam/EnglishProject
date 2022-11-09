import 'package:flutter/material.dart';

import 'FirstView.dart';

void main() {
  runApp( App());
}

class App extends StatelessWidget {
      App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/fistPage',
      routes: {
        '/fistPage': (context) => FirstView(),
      }
    );

  }
}
