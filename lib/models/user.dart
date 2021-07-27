import 'package:http/http.dart' as http;
import 'dart:convert';

class User{
  final String name;
  final String email;
  final String phone;
  final String password;

  const User({
    required this.name,
    required this.email,
    required this.phone,
    required this.password
  }); 

 Object toJson(){
   return {
     "name": this.name,
     "email": this.email,
     "phone": this.phone,
     "password": this.password,
   };
 }
}

Future<String> loginUserModel(String email, String password)async{
  var url = 'http://localhost:3000/user/?q=$email';
  var res = await http.get(Uri.parse(url));
  print(res.statusCode);
  List<dynamic> data = jsonDecode(res.body);
  if(data.length != 0){
    if(data[0]["password"] == password){
      return "Successfully logged in";
    }
    return "password didnt match";
  }
  return "No user found with that email";
}

Future<bool> createUser(String name, String email, String phone, String password) async{
  final User user = User(name: name, email: email, phone: phone, password: password);
  var url = 'http://localhost:3000/user/';
  var res = await http.post(Uri.parse(url), body: user.toJson());
  if(res.statusCode==201){
    return true;
  }
  return false;
}