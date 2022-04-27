import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/welcome_image.png",fit: BoxFit.cover,),
          Text("Welcome",style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }
}
