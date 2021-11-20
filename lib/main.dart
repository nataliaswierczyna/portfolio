import 'dart:developer';

import 'package:flutter/material.dart';
import 'code_editor.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Portfolio()));
  }
}

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('source code'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CodeGenerator()));
        },
      ),
    );
  }
}
