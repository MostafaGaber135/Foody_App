import 'package:flutter/material.dart';
import 'package:foody_app/models/account_model.dart';

class CustomListTileProfilePage extends StatelessWidget {
  const CustomListTileProfilePage({super.key, required this.accountModel,});

  final AccountModel accountModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        accountModel.text,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w400,
          color: Color(
            0XFF020202,
          ),
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_sharp,
      ),
    );
  }
}
