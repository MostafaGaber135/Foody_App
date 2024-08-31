import 'package:flutter/material.dart';
import 'package:foody_app/pages/home_page.dart';
import 'package:foody_app/widgets/custom_button.dart';
import 'package:foody_app/widgets/text_details_transaction.dart';

class CustomDetailsItemOrdered extends StatelessWidget {
  const CustomDetailsItemOrdered({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'Item Ordered',
              style: TextStyle(
                color: Color(
                  0XFF020202,
                ),
                fontWeight: FontWeight.w400,
                fontSize: 21,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image(
            image: AssetImage(
              'assets/images/pic_cherry_healthyy.png',
            ),
          ),
          title: Text(
            'Cherry Healthy',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Color(
                0XFF020202,
              ),
            ),
          ),
          subtitle: Text(
            'IDR 289.000',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Color(
                0XFF8D92A3,
              ),
            ),
          ),
          trailing: Text(
            '14 items',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Color(
                0XFF8D92A3,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Row(
          children: [
            Text(
              'Details Transaction',
              style: TextStyle(
                color: Color(
                  0XFF020202,
                ),
                fontSize: 21,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Column(
          children: [
            TextDetailsTransaction(
              text: 'Cherry Healthy',
              subText: 'IDR 18.390.000',
            ),
            SizedBox(
              height: 5,
            ),
            TextDetailsTransaction(
              text: 'Driver',
              subText: 'IDR 50.000',
            ),
            SizedBox(
              height: 5,
            ),
            TextDetailsTransaction(
              text: 'Tax 10%',
              subText: 'IDR 1.800.390',
            ),
            SizedBox(
              height: 5,
            ),
            TextDetailsTransaction(
              text: 'Total Price',
              subText: 'IDR 390.803.000',
              color: Color(
                0XFF4BAF31,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        const Row(
          children: [
            Text(
              'Deliver to:',
              style: TextStyle(
                color: Color(
                  0XFF020202,
                ),
                fontSize: 21,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Column(
          children: [
            TextDetailsTransaction(
              text: 'Name',
              subText: 'Angga Risky',
            ),
            SizedBox(
              height: 5,
            ),
            TextDetailsTransaction(
              text: 'Phone No.',
              subText: '0822 0819 9688',
            ),
            SizedBox(
              height: 5,
            ),
            TextDetailsTransaction(
              text: 'Address',
              subText: 'Setra Duta Palima',
            ),
            SizedBox(
              height: 5,
            ),
            TextDetailsTransaction(
              text: 'House No.',
              subText: 'A5 Hook',
            ),
            SizedBox(
              height: 5,
            ),
            TextDetailsTransaction(
              text: 'City',
              subText: 'Bandung',
            ),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        CustomButton(
          text: 'Checkout Now',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          textColor: const Color(0XFFFBF2CF),
          backgroundColor: const Color(0XFFEB0029),
        ),
      ],
    );
  }
}
