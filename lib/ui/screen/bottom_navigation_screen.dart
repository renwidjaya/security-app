import 'package:flutter/material.dart';
import 'package:security_app/ui/screen/capture_screen.dart';
import 'package:security_app/ui/screen/home_screen.dart';
import 'package:security_app/ui/screen/rekapitulasi_screen.dart';
import 'package:security_app/ui/style/app_colors.dart';
import 'package:security_app/ui/style/text_tyle_constants.dart';
import 'package:security_app/ui/widget/custom_drawer.dart';

class BottomNaviationScreen extends StatefulWidget {
  const BottomNaviationScreen({super.key});

  @override
  State<BottomNaviationScreen> createState() => _BottomNaviationScreenState();
}

class _BottomNaviationScreenState extends State<BottomNaviationScreen> {
  int currentIndex = 0;
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
      drawer: const CustomDrawer(),
      body: screen(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: TextStyleConstants.kBody3.copyWith(
            color: AppColors.white,
          ),
          selectedLabelStyle: TextStyleConstants.kBody3,
          selectedItemColor: AppColors.white,
          backgroundColor: AppColors.softBlue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.newspaper,
              ),
              label: "Berita",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
              ),
              label: "Capture",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chrome_reader_mode,
              ),
              label: "Rekapitulasi",
            ),
          ],
        ),
      ),
    );
  }

  Widget screen() {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CaptureScreen();
      case 2:
        return const RekapitulasiScreen();
      default:
        return const HomeScreen();
    }
  }
}
