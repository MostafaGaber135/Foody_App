import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody_app/main.dart';
import 'package:foody_app/pages/sign_up_page.dart';
import 'package:foody_app/widgets/custom_button.dart';
import 'package:foody_app/widgets/custom_container_social_media.dart';
import 'package:foody_app/widgets/custom_password_field.dart';
import 'package:foody_app/widgets/custom_text_field.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> with WidgetsBindingObserver {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String emailError = '';
  String passwordError = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _signOut();
    super.dispose();
  }

  Future<void> _signOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log('Error signing out: $e');
    }
  }

  Future<void> signIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    setState(() {
      emailError = email.isEmpty ? 'Please enter an email' : '';
      passwordError = password.isEmpty ? 'Please enter a password' : '';
    });

    if (emailError.isNotEmpty || passwordError.isNotEmpty) {
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (mounted) {
        Navigator.pushReplacementNamed(context, '/Order-Empty');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'Account not found. Please sign up.';
          break;
        case 'wrong-password':
          errorMessage = 'Email or password does not match.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is invalid.';
          break;
        default:
          errorMessage = 'The email or password you entered is incorrect';
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
            content: Text('The email or password you entered is incorrect'),
          ),
        );
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      if (mounted) {
        Navigator.pushReplacementNamed(context, '/Order-Empty');
      }
    } catch (e) {
      log('Error signing in with Google: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In',
                style: TextStyle(
                  color: const Color(0XFF020202),
                  fontWeight: FontWeight.w500,
                  fontSize: getResoponsiveFontSize(context, fontSize: 22),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Find your best ever meal',
                style: TextStyle(
                  color: const Color(0XFF8D92A3),
                  fontWeight: FontWeight.w300,
                  fontSize: getResoponsiveFontSize(context, fontSize: 14),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Email Address',
                style: TextStyle(
                  color: const Color(0XFF020202),
                  fontWeight: FontWeight.w400,
                  fontSize: getResoponsiveFontSize(context, fontSize: 16),
                ),
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hint: 'Type your email',
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              if (emailError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    emailError,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 24),
              Text(
                'Password',
                style: TextStyle(
                  color: const Color(0XFF020202),
                  fontWeight: FontWeight.w400,
                  fontSize: getResoponsiveFontSize(context, fontSize: 16),
                ),
              ),
              const SizedBox(height: 12),
              CustomPasswordField(
                hint: 'Type your password',
                controller: passwordController,
              ),
              if (passwordError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    passwordError,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 64),
              CustomButton(
                text: 'Sign In',
                onPressed: signIn,
                textColor: const Color(0XFFFBF2CF),
                backgroundColor: const Color(0XFFEB0029),
                borderColor: const Color(0XFFEB0029),
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/forgot-password');
                },
                child: Center(
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: const Color(0XFFEB0029),
                      fontWeight: FontWeight.w400,
                      fontSize: getResoponsiveFontSize(context, fontSize: 18),
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0XFFEB0029),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  '- OR Continue with -',
                  style: TextStyle(
                    color: const Color(0XFF575757),
                    fontWeight: FontWeight.w400,
                    fontSize: getResoponsiveFontSize(context, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomContainerSocialMedia(
                    text: 'Google',
                    image: 'assets/images/google 1.png',
                    onTap: () async {
                      await signInWithGoogle();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Create An Account',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF575757),
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
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
