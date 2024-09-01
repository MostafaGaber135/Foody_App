import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foody_app/widgets/custom_dotted_border.dart';
import 'package:foody_app/widgets/custom_item_grid_view_food_market.dart';
import 'package:foody_app/widgets/custom_item_grid_view_profile_page.dart';
import 'package:foody_app/widgets/custom_tab_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  File? _image;

  void _onImagePicked(File? image) {
    setState(() {
      _image = image;
      log('Image picked: ${image?.path}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05,
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            CustomDottedBorder(
              image: _image,
              onImagePicked: _onImagePicked,
            ),
            const SizedBox(height: 32),
            const Text(
              'Aashifa Sheikh',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 27,
                color: Color(0XFF020202),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'contact.uiuxexperts@gmail.com',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 21,
                color: Color(0XFF8D92A3),
              ),
            ),
            const Expanded(
              child: CustomTabBar(
                tabLabels: [
                  'In Progress',
                  'Past Orders',
                ],
                tabLength: 2,
                tabViews: [
                  CustomItemGridViewProfilePage(),
                  CustomItemGridViewFoodMarket(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
