import 'package:flutter/material.dart';
import 'package:foody_app/widgets/custom_app_bar.dart';
import 'package:foody_app/widgets/custom_details_item_ordered.dart';

class PaymentAddressPage extends StatelessWidget {
  const PaymentAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 60,
        ),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Payment',
              subTitle: 'You deserve better meal',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomDetailsItemOrdered(),
          ],
        ),
      ),
    );
  }
}
