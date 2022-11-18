import 'package:flutter/material.dart';
import 'package:security_app/ui/style/app_colors.dart';
import 'package:security_app/ui/style/text_tyle_constants.dart';

class MyActivityScreen extends StatelessWidget {
  const MyActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Image.asset(
            "assets/img_security.png",
            width: 50,
          ),
        ),
        actions: [
          Center(
            child: Text(
              "Security \nSmart",
              style: TextStyleConstants.kHeading6.copyWith(
                color: AppColors.white,
              ),
            ),
          )
        ],
        backgroundColor: AppColors.softBlue,
      ),
      body: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/s1.jpeg",
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "test",
                    style: TextStyleConstants.kHeading4,
                  ),
                  Text(
                    "Ini adalah kegiatan saya",
                    style: TextStyleConstants.kBody2,
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
