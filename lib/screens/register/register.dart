import 'package:flutter/material.dart';
import 'package:uber/constants.dart';
import 'package:uber/routes.dart';

class Register extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
            height: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                     height: screenSize.height / 20.0
                    ),
                    if(Navigator.of(context).canPop())
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            print("register back");
                            Navigator.pop(context);
                          }, 
                          icon: Icon(Icons.arrow_back)
                        )
                      ],
                    ),
                    SizedBox(
                     height: screenSize.height / 300.0
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      width: screenSize.width / 1.43,
                      height: screenSize.height / 3.09,
                    ),
                    Text(
                      "Register as a Rider",
                      style: LoginStyle,
                    ),
                    // name
                    Container(
                        margin: const EdgeInsets.only(left: 30.0, right: 30.0 , bottom: 10.0, top: 15.0),
                        child: TextFormField(
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Empty name not applicable";
                            }
                            if(value.length < 3){
                              return "Name length must be atleast 3 characters";
                            }
                            return null;   
                          },
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Name", 
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold
                            ), 
                          ),
                        ),
                      ),
                    // email
                    Container(
                        margin: const EdgeInsets.only(left: 30.0, right: 30.0 , bottom: 10.0),
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
                      // phone
                      Container(
                        margin: const EdgeInsets.only(left: 30.0, right: 30.0 , bottom: 10.0),
                        child: TextFormField(
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Must provide a phone number";
                            }
                            if(value.length < 3){
                              return "provide a valid phone number";
                            }
                            return null;   
                          },
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Phone", 
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
                        height: 10.0,
                      ),
                      RegisterButton(
                        press: () {
                          registerUser(context);
                        },
                        formKey: _formKey,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextButton(
                        onPressed: (){
                          // Navigator.pushNamed(context, LoginRoute);
                          Navigator.pushNamedAndRemoveUntil(context, LoginRoute, (Route route) => false);
                        },
                        child: Text(
                          "Already have a account? Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0
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

  void registerUser(BuildContext context) async{
    final user = true;
    if(user){
      // user created
      // show success message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("User created successfully"),
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.green,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(50))),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'X',
          onPressed: () {},
          ),
        ));
      // navigate to login
      Navigator.pushNamedAndRemoveUntil(context, LoginRoute, (Route route) => false);
    }else{
      // something went wrong
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Something went wrong, try again later"),
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.red,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(50))),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'X',
          onPressed: () {},
          ),
        ));
    }
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


class RegisterButton extends StatelessWidget {
  final VoidCallback press;
  final formKey;

  const RegisterButton({
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
        padding: EdgeInsets.symmetric(horizontal: 155.0, vertical: 17.0)
      ),
      child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              )
      );
  }
}