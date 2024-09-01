import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody_app/pages/sign_in_page.dart';
import 'package:foody_app/pages/success_sign_up_page.dart';
import 'package:foody_app/widgets/custom_app_bar.dart';
import 'package:foody_app/widgets/custom_button.dart';
import 'package:foody_app/widgets/custom_dotted_border.dart';
import 'package:foody_app/widgets/custom_full_name.dart';
import 'package:foody_app/widgets/custom_password_field.dart';
import 'package:foody_app/widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  File? _image;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isButtonEnabled = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    fullNameController.addListener(validateFields);
    emailController.addListener(validateFields);
    passwordController.addListener(validateFields);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onImagePicked(File? image) {
    setState(() {
      _image = image;
      log('Image picked: ${image?.path}');
    });
  }

  void validateFields() {
    bool isFullNameNotEmpty = fullNameController.text.isNotEmpty;
    bool isEmailNotEmpty = emailController.text.isNotEmpty;
    bool isPasswordNotEmpty = passwordController.text.isNotEmpty;

    isButtonEnabled.value = isFullNameNotEmpty &&
        isEmailNotEmpty &&
        isPasswordNotEmpty &&
        _image != null;
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    final hasLowerCase = RegExp(r'[a-z]').hasMatch(password);
    final hasUpperCase = RegExp(r'[A-Z]').hasMatch(password);
    final hasDigit = RegExp(r'\d').hasMatch(password);
    final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
    return password.length >= 8 &&
        hasLowerCase &&
        hasUpperCase &&
        hasDigit &&
        hasSpecialChar;
  }

  Future<bool> checkIfEmailExists(String email) async {
    return false;
  }

  Future<void> createAccount(
      String fullName, String email, String password, File? image) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('Account created successfully: ${credential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar('The account already exists for that email.');
      } else {
        showSnackBar('Failed to create account. Please try again.');
      }
    } catch (e) {
      showSnackBar('An error occurred. Please try again.');
    }
  }

  void _continueToAddressPage() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = emailController.text;
      final fullName = fullNameController.text;
      final password = passwordController.text;

      if (_image == null) {
        showSnackBar('Please select an image');
        return;
      }

      bool emailExists = await checkIfEmailExists(email);

      if (!mounted) return; 

      if (emailExists) {
        showSnackBar('Email already exists');
        return;
      }

      await createAccount(fullName, email, password, _image);

      if (!mounted) return; 

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SuccessSignUpPage(),
        ),
      );
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05,
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            CustomAppBar(
              title: 'Sign Up',
              subTitle: 'Register and eat',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 32),
            CustomDottedBorder(
              image: _image,
              onImagePicked: _onImagePicked,
            ),
            const SizedBox(height: 32),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Full Name',
                    style: TextStyle(
                      color: Color(0XFF020202),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomFullName(
                    hint: 'Type your full name',
                    controller: fullNameController,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Email',
                    style: TextStyle(
                      color: Color(0XFF020202),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hint: 'Type your email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!isValidEmail(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Color(0XFF020202),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomPasswordField(
                    hint: 'Type your password',
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (!isValidPassword(value)) {
                        return 'Password must be at least 8 characters long and include a mix of uppercase, lowercase, digits, and special characters';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ValueListenableBuilder<bool>(
              valueListenable: isButtonEnabled,
              builder: (context, isEnabled, child) {
                return CustomButton(
                  textColor: const Color(0XFFFBF2CF),
                  backgroundColor: isEnabled
                      ? const Color(0XFFEB0029)
                      : const Color(0XFFEB0029),
                  text: 'Sign Up Now',
                  onPressed: _continueToAddressPage,
                  borderColor: const Color(0XFFEB0029),
                );
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
    );
  }
}
