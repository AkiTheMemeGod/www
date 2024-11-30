import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/images/splash_pic.jpg",
              fit: BoxFit.cover,
              height: height * .5,
              width: width * 0.9,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              "What?, When?, Where?",
              style: GoogleFonts.anton(letterSpacing: 6, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}