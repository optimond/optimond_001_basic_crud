import 'package:flutter/material.dart';

import 'pages/note_page.dart';

class AppMain extends StatelessWidget {
  const AppMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: NotePage(),
    );
  }
}
