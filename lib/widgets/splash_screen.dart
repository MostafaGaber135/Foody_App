import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';
import 'package:foody_app/pages/sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEB0029),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 2),
              child: const Image(
                image: AssetImage('assets/images/Group.png'),
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 2),
              child: Text(
                'Foody',
                style: TextStyle(
                  fontSize: getResoponsiveFontSize(context, fontSize: 32),
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
