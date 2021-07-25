import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Uber",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0
          ),
        ),
      ),
    );
  }
}