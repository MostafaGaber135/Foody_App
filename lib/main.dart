import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foody_app/firebase_options.dart';
import 'package:foody_app/pages/forgot_password_page.dart';
import 'package:foody_app/pages/order_empty_page.dart';
import 'package:foody_app/pages/success_order_page.dart';
import 'package:foody_app/pages/success_sign_up_page.dart';
import 'package:foody_app/pages/sign_in_page.dart';
import 'package:foody_app/pages/sign_up_page.dart';
import 'package:foody_app/widgets/splash_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FoodyApp());
}

class FoodyApp extends StatelessWidget {
  const FoodyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const SuccessSignUpPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/sign-in': (context) => const SignInPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/Success-Order': (context) => const SuccessOrderPage(),
        '/Order-Empty': (context) => const OrderEmptyPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}

double getResoponsiveFontSize(BuildContext context,
    {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
