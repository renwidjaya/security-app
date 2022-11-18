import 'package:flutter/material.dart';
import 'package:security_app/ui/screen/my_activity_screen.dart';
import 'package:security_app/ui/style/text_tyle_constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(
                    "assets/img_security.png",
                    width: 100,
                  ),
                  Text(
                    "Security Smart",
                    style: TextStyleConstants.kHeading4,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
            ),
            title: Text(
              "Cature Kegiatan",
              style: TextStyleConstants.kBody2,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.security,
            ),
            title: Text(
              "Satuan Kerja",
              style: TextStyleConstants.kBody2,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.chrome_reader_mode,
            ),
            title: Text(
              "Rekapitulasi",
              style: TextStyleConstants.kBody2,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.run_circle,
            ),
            title: Text(
              "Kegiatan",
              style: TextStyleConstants.kBody2,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyActivityScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.key,
            ),
            title: Text(
              "Ganti Password",
              style: TextStyleConstants.kBody2,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
