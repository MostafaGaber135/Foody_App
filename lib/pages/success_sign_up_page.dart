import 'package:flutter/material.dart';
import 'package:foody_app/pages/home_page.dart';
import 'package:foody_app/widgets/custom_button.dart';

class SuccessSignUpPage extends StatelessWidget {
  const SuccessSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/image 15.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Yeay! Completed',
              style: TextStyle(
                fontSize: 30,
                color: Color(0XFF020202),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                textAlign: TextAlign.center,
                'Now you are able to order some foods as a self-reward',
                style: TextStyle(
                  fontSize: 21,
                  color: Color(0XFF8D92A3),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(
              height: 42,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: CustomButton(
                borderColor: const Color(0XFFEB0029),
                textColor: const Color(0XFFFBF2CF),
                backgroundColor: const Color(0XFFEB0029),
                text: 'Find Foods',
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
