import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: Colors.grey))),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.grey)),
                TextSpan(
                    text: " Sign up.",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600))
              ]),
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 60,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/images/Instagram_logo.png"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("lib/images/person1.jpg"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Mohammad Sbeity",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Text(
              "Log in",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 140, vertical: 12)),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Switch accounts",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w600),
          )
        ],
      )),
    );
  }
}
