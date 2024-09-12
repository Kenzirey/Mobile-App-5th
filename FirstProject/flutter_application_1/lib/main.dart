import 'package:flutter/material.dart';

import 'package:flutter_application_1/gradiant_container.dart';


void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(Colors.black, Color.fromARGB(255, 17, 114, 198)),
      ),
    ),
  );
}

