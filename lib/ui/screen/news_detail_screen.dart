import 'package:flutter/material.dart';
import 'package:security_app/repositories/model/articles_model.dart';
import 'package:security_app/ui/style/text_tyle_constants.dart';
import 'package:security_app/utils/constants_utils.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;
  const NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.comment),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                        "https://asset.kompas.com/crops/va1BnSmU8PmCoMNkwnnVWPuBUEs=/0x517:893x1113/750x500/data/photo/2020/05/15/5ebeafd04c75f.jpeg"),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  article.title,
                  style: TextStyleConstants.kHeading4,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  article.description,
                  style: TextStyleConstants.kBody2,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  "Komentar",
                  style: TextStyleConstants.kHeading4,
                  textAlign: TextAlign.center,
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: Image.asset(
                      "assets/a1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    "Pak Akhmad",
                    style: TextStyleConstants.kHeading6,
                  ),
                  subtitle: Text(
                    "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, ",
                    style: TextStyleConstants.kBody2,
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: Image.asset(
                      "assets/a1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    "Pak Ali",
                    style: TextStyleConstants.kHeading6,
                  ),
                  subtitle: Text(
                    "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, ",
                    style: TextStyleConstants.kBody2,
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: Image.asset(
                      "assets/a1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    "Pak Simaf",
                    style: TextStyleConstants.kHeading6,
                  ),
                  subtitle: Text(
                    "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, ",
                    style: TextStyleConstants.kBody2,
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: Image.asset(
                      "assets/a1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    "Pak Gigi",
                    style: TextStyleConstants.kHeading6,
                  ),
                  subtitle: Text(
                    "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, ",
                    style: TextStyleConstants.kBody2,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
