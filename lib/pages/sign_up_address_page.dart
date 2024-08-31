import 'package:flutter/material.dart';
import 'package:foody_app/pages/sign_in_page.dart';
import 'package:foody_app/widgets/custom_address_field.dart';
import 'package:foody_app/widgets/custom_app_bar.dart';
import 'package:foody_app/widgets/custom_button.dart';
import 'package:foody_app/widgets/custom_drop_down_button.dart';
import 'package:foody_app/widgets/custom_phone_number_field.dart';

class SignUpAddressPage extends StatefulWidget {
  const SignUpAddressPage({super.key});

  @override
  State<SignUpAddressPage> createState() => _SignUpAddressPageState();
}

class _SignUpAddressPageState extends State<SignUpAddressPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 60,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              CustomAppBar(
                onTap: () {
                  Navigator.pop(context);
                },
                title: 'Address',
                subTitle: 'Make sure it’s valid',
              ),
              const SizedBox(height: 32),
              const Text(
                'Phone No.',
                style: TextStyle(
                  color: Color(0XFF020202),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              const CustomPhoneNumberField(
                hint: 'Type your phone number',
              ),
              const SizedBox(height: 12),
              const Text(
                'Address',
                style: TextStyle(
                  color: Color(0XFF020202),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              const CustomAddressField(),
              const SizedBox(height: 12),
              const Text(
                'House No.',
                style: TextStyle(
                  color: Color(0XFF020202),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              const CustomPhoneNumberField(
                hint: 'Type your house number',
              ),
              const SizedBox(height: 12),
              const Text(
                'City',
                style: TextStyle(
                  color: Color(0XFF020202),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              const CustomDropDownButton(),
              const SizedBox(height: 32),
              CustomButton(
                textColor: const Color(0XFFFBF2CF),
                backgroundColor: const Color(0XFFEB0029),
                text: 'Sign Up Now',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpAddressPage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')),
                    );
                  }
                },
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0XFF575757),
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFFEB0029),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
