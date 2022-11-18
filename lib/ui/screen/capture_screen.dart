import 'package:flutter/material.dart';
import 'package:security_app/ui/style/app_colors.dart';
import 'package:security_app/ui/style/text_tyle_constants.dart';

class CaptureScreen extends StatelessWidget {
  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _alertWarning(),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Image.asset(
                  "assets/f.png",
                  width: 250,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Keterangan",
                style: TextStyleConstants.kHeading5,
              ),
              const Card(
                color: AppColors.softGrey,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 5, //or null
                    decoration: InputDecoration.collapsed(
                      hintText: "Enter your text here",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyleConstants.kHeading6.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _alertWarning() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    decoration: BoxDecoration(
      color: AppColors.yellow.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: AppColors.yellow,
        width: 1,
      ),
    ),
    child: Row(
      children: [
        const Icon(
          Icons.info_outline,
          color: AppColors.duneGrey,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          "Lokasi anda sudah direkam",
          style: TextStyleConstants.kBody3,
        ),
      ],
    ),
  );
}
