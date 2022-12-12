import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  void login(String email,password) async{
    try {
      Response response= await post( Uri.parse('https://reqres.in/api/register'),
      body: {
        'email': email ,
        'password': password,
      }
      );
      if(response.statusCode==200){
        print('acount created successfully');
      }else{
        print('failed');
      }
    }catch(e){
     print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up Api"),),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText:"email"),
            ),
          ),   Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passController,
              decoration: InputDecoration(hintText:"password"),
            ),
          ),
          MaterialButton(
              height: 50,
              onPressed: (){
                login(emailController.text.toString(), passController.text.toString());
              },
              child: Text("Sign up",style: TextStyle(fontSize: 18,color: Colors.white),),
              color: Colors.deepPurple),

        ],

      ),
    );
  }
}
