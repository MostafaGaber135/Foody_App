import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foody_app/pages/sign_in_page.dart';
import 'package:foody_app/pages/sign_up_address_page.dart';
import 'dart:io';
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
    });
  }

  void validateFields() {
    bool isFullNameNotEmpty = fullNameController.text.isNotEmpty;
    bool isEmailNotEmpty = emailController.text.isNotEmpty;
    bool isPasswordNotEmpty = passwordController.text.isNotEmpty;

    isButtonEnabled.value =
        isFullNameNotEmpty && isEmailNotEmpty && isPasswordNotEmpty;
  }

  void showErrorMessages() {
    if (fullNameController.text.isEmpty) {
      showSnackBar(context, 'Please enter your full name');
    } else if (emailController.text.isEmpty) {
      showSnackBar(context, 'Please enter your email');
    } else if (passwordController.text.isEmpty) {
      showSnackBar(context, 'Please enter your password');
    }
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<String?> _uploadImage(File image) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images/${FirebaseAuth.instance.currentUser!.uid}');
      final uploadTask = await storageRef.putFile(image);
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      log('Error uploading image: $e');
      return null;
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_image == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please upload a photo')),
          );
        }
        return;
      }

      if (fullNameController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your full name')),
        );
        return;
      }

      if (emailController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your email address')),
        );
        return;
      }

      if (passwordController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your password')),
        );
        return;
      }

      try {
        final userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (userCredential.user != null) {
          final imageUrl = await _uploadImage(_image!);
          final fullName = fullNameController.text.trim();

          if (imageUrl != null) {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(userCredential.user!.uid)
                .set({
              'fullName': fullName,
              'profileImageUrl': imageUrl,
            });
          }

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account created successfully')),
            );

            Navigator.pushReplacementNamed(context, '/home');
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to create account')),
            );
          }
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        switch (e.code) {
          case 'weak-password':
            errorMessage = 'The password provided is too weak.';
            break;
          case 'email-already-in-use':
            errorMessage = 'The account already exists for that email.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is invalid.';
            break;
          default:
            errorMessage = 'An error occurred. Please try again later.';
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('An unexpected error occurred. Please try again.'),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.05,
            horizontal: 24,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                const CustomAppBar(
                  title: 'Sign Up',
                  subTitle: 'Register and eat',
                ),
                const SizedBox(height: 32),
                CustomDottedBorder(
                  onImagePicked: _onImagePicked,
                  image: _image,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Full Name',
                  style: TextStyle(
                    color: Color(0XFF020202),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                CustomFullName(controller: fullNameController),
                const SizedBox(height: 12),
                const Text(
                  'Email Address',
                  style: TextStyle(
                    color: Color(0XFF020202),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                CustomTextField(controller: emailController),
                const SizedBox(height: 24),
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Color(0XFF020202),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                CustomPasswordField(controller: passwordController),
                const SizedBox(height: 32),
                ValueListenableBuilder<bool>(
                  valueListenable: isButtonEnabled,
                  builder: (context, isEnabled, child) {
                    return CustomButton(
                      text: 'Continue',
                      onPressed: isEnabled
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SignUpAddressPage(),
                                ),
                              );
                            }
                          : () {
                              showErrorMessages();
                            },
                      textColor: const Color(0XFFFBF2CF),
                      backgroundColor: const Color(0XFFEB0029),
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
        ),
      ),
    );
  }
}
