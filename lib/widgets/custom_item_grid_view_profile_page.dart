import 'package:flutter/material.dart';
import 'package:foody_app/models/account_model.dart';

import 'package:foody_app/widgets/custom_list_tile_profile_page.dart';

class CustomItemGridViewProfilePage extends StatelessWidget {
  const CustomItemGridViewProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textAccount = [
      AccountModel(
        text: 'Edit Profile',
      ),
      AccountModel(
        text: 'Home Address',
      ),
      AccountModel(
        text: 'Security',
      ),
      AccountModel(
        text: 'Payments',
      ),
    ];
    return GridView.builder(
      itemCount: textAccount.length,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 4.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 2,
          ),
          child: CustomListTileProfilePage(
            accountModel: textAccount[index],
          ),
        );
      },
    );
  }
}
