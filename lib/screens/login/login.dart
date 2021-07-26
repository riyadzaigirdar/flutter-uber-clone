import 'package:flutter/material.dart';
import 'package:uber/constants.dart';
import 'package:uber/models/user.dart';
import 'package:uber/routes.dart';
import 'package:uber/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void loginUser(BuildContext context) async{
    var message = await loginUserModel(_emailController.text, _passwordController.text);
    FocusScope.of(context).requestFocus(new FocusNode());
    successMessage(context, message);
    setState(() {
      _emailController.text = "";
      _passwordController.text = "";
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
              width: screenSize.width,
              height: screenSize.height,
              child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                     height: screenSize.height / 20.0
                    ),
                    if(Navigator.of(context).canPop())
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, 
                          icon: Icon(Icons.arrow_back)
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height / 9.26,
                    ),
                    Image(
                      image: AssetImage("assets/images/logo.png"),
                      width: screenSize.width / 1.43,
                      height: screenSize.height / 3.09,
                    ),
                    Text(
                      "Login as a Rider",
                      style: LoginStyle,
                      ),
                    Container(
                      margin: const EdgeInsets.only(left: 30.0, right: 30.0 , bottom: 10.0, top: 15.0),
                      child: TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Empty email address not applicable";
                          }
                          if(!value.contains("@")){
                            return "Please provide a valid email address";
                          }
                          return null;   
                        },
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email", 
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold
                          ), 
                        ),
                      ),
                    ),
                    PasswordField(
                      controller: _passwordController
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    LoginButton(
                      press: () {
                        loginUser(context);
                        },
                      formKey: _formKey
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, RegisterRoute);
                      },
                      child: Text(
                        "Do not have an account? Register here",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final VoidCallback press;
  final formKey;

  const LoginButton({
    required this.press,
    required this.formKey
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        if(formKey.currentState!.validate()){
          press();
        } 
      }, 
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0)
        ),
        backgroundColor: Colors.yellow,
        padding: EdgeInsets.symmetric(horizontal: 170.0, vertical: 17.0)
      ),
      child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              )
      );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({
    required this.controller
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10.0),
      child: TextFormField(
        controller: widget.controller,
        validator: (value){
          if(value == null || value.isEmpty){
            return "Empty password is not applicable";
          }
          if(value.length < 6){
            return "Password must be atleast 6 characters";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold
          ),
          suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(25.0),
            onTap: (){
              hidePassword = !hidePassword;
              setState(() {});
            },
            child: Icon(
              Icons.remove_red_eye,
              color: hidePassword ? Colors.black.withOpacity(0.23) : Colors.black,
              )
            ),
        ),
        obscureText: hidePassword,
      ),
    );
  }
}