import 'package:flutter/material.dart';
import 'package:lettutor/common/values/hex_color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Row(
        children: [
          Text(
            "Say hello to your English tutors",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: HexColor.fromHex('#000000'),
            )
          ),
          Text(
            "Become fluent faster through one on one video chat lessons tailored to your goals.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: HexColor.fromHex('#000000'),
            )
          ),
        ],
      ),
    );
  }
}
