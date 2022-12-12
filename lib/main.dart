import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_2/homescreen.dart';
import 'package:rest_api_2/postscreen.dart';
import 'package:rest_api_2/secondpage.dart';
import 'package:rest_api_2/thirdpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
