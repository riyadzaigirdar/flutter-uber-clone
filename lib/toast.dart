import 'package:flutter/material.dart';

void successMessage(BuildContext context, String msg){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.black,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(50))),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'X',
        onPressed: () {},
        ),
    )
  );
}

void errorMessage(BuildContext context, String msg){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.red,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(50))),
      action: SnackBarAction(
          textColor: Colors.white,
          label: 'X',
          onPressed: () {},
          ),
    )
  );
}