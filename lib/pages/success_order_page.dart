import 'package:flutter/material.dart';
import 'package:foody_app/pages/home_page.dart';
import 'package:foody_app/pages/payment_address_page.dart';
import 'package:foody_app/widgets/custom_button.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/image 14.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'You’ve Made Order',
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                textAlign: TextAlign.center,
                'Just stay at home while we are preparing your best foods',
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
            CustomButton(
              textColor: const Color(0XFFFBF2CF),
              backgroundColor: const Color(0XFFEB0029),
              text: 'Order Other Foods',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 21,
            ),
            CustomButton(
              textColor: const Color(0XFFFA7070),
              backgroundColor: Colors.white,
              borderColor: const Color(0XFFFA7070),
              text: 'View My Order',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentAddressPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
