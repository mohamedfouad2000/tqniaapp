import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/edit_profile_screen_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.image});
  final String name;
  final String email;
  final String phone;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: kbackColor,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text(
          'Edit Profile',
          style: StylesData.font18,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
      ),
      body: EditProfileScreenBody(
        name: name,
        email: email,
        phone: phone,
        image: image,
      ),
    );
  }
}
