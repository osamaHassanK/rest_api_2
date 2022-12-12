import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Models/UserModel.dart';

class ThirdExample extends StatefulWidget {
  const ThirdExample({Key? key}) : super(key: key);

  @override
  State<ThirdExample> createState() => _ThirdExampleState();
}

class _ThirdExampleState extends State<ThirdExample> {
  
  List<UserModel> userList =[];
  
  Future<List<UserModel>> getuser() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }else{
      return userList;
    }
}
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title:Text("Flutter With Osama",style:GoogleFonts.lato(
        textStyle: TextStyle(color: Colors.white, letterSpacing: .5),
      ),),backgroundColor: Colors.deepPurpleAccent),
      body:Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getuser(),
                builder: (context,AsyncSnapshot<List<UserModel>> snapshot){
              return ListView.builder(
                  itemCount:userList.length ,
                  itemBuilder: (context,index){
                return TextWidget(title:"name",titleApi:snapshot.data![index].name.toString(),
                    value:"email", valueApi: snapshot.data![index].email.toString(),userid: snapshot.data![index].id.toString(),);
              });
            }),
          )
        ],
      ) ,
    );
  }
}


class TextWidget extends StatelessWidget {
   String? title,value,titleApi,valueApi,userid;
   TextWidget({Key? key,required this.title,required this.value,required this.titleApi,required this.valueApi,required this.userid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("User Detailed",style: GoogleFonts.lato(
                textStyle: TextStyle(color: Colors.blue, letterSpacing: .5,fontSize: 18),
              ),),
            ),
            Text(userid!, style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.blue, letterSpacing: .5,fontSize: 18),),
            )],
        ),
     Row(
       children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(title!,style: TextStyle(fontSize: 18),),
         ),Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(titleApi!,style: TextStyle(fontSize: 18),),
         ),
       ],
     ),Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value!,style: TextStyle(fontSize: 18),),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(valueApi!,style: TextStyle(fontSize: 18),),
            ),
          ],
        )
      ],
    );
  }
}
