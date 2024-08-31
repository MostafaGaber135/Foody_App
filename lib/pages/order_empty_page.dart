import 'package:flutter/material.dart';
import 'package:foody_app/pages/home_page.dart';
import 'package:foody_app/widgets/custom_button.dart';

class OrderEmptyPage extends StatelessWidget {
  const OrderEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/image 16.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Ouch! Hungry',
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
                'Seems like you have not ordered any food yet',
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
                textColor: const Color(0XFFFBF2CF),
                backgroundColor: const Color(0XFFEB0029),
                text: 'Find Foods',
                onPressed: () {
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