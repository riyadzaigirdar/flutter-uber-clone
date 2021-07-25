import 'package:flutter/material.dart';
import 'package:uber/screens/home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber',
      theme: ThemeData(
        fontFamily: "Ibm-Flex-Sans",
        primarySwatch: Colors.red,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}