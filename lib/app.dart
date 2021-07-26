import 'package:uber/constants.dart';
import 'package:flutter/material.dart';
import 'package:uber/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber',
      theme: ThemeData(
        fontFamily: "Ibm-Flex-Sans",
        primarySwatch: colorCustom,
      ),
      onGenerateRoute: routes(),
      initialRoute: LoginRoute,
      debugShowCheckedModeBanner: false,
    );
  }

  
}

