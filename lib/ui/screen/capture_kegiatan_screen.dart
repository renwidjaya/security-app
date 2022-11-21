import 'package:flutter/material.dart';
import 'package:security_app/repositories/model/articles_model.dart';
import 'package:security_app/ui/screen/news_detail_screen.dart';
import 'package:security_app/ui/style/app_colors.dart';
import 'package:security_app/ui/style/text_tyle_constants.dart';

class CaptureKegiatanScreen extends StatelessWidget {
  const CaptureKegiatanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture Kegiatan'),
        backgroundColor: AppColors.softBlue,
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NewsDetailScreen(
                  article: Article(
                    id: 1,
                    title: "Admin",
                    description: "Cek Location",
                    image:
                        "https://asset.kompas.com/crops/va1BnSmU8PmCoMNkwnnVWPuBUEs=/0x517:893x1113/750x500/data/photo/2020/05/15/5ebeafd04c75f.jpeg",
                    createdAt: DateTime(200),
                    updatedAt: DateTime(200),
                    user: User(
                      id: 1,
                      name: "renwidjaya",
                      username: "renwidjaya",
                      email: "renwidjaya@gmail.com",
                      nik: "2133231290",
                      satker: "satker",
                      role: "role",
                    ),
                  ),
                ),
              ),
            ),
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.network(
                  //     "${ConstantsUtils.baseUrl}${provider.articles!.data[index].image}"),
                  Image.asset("assets/s1.jpeg"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Admin",
                          style: TextStyleConstants.kHeading4,
                        ),
                      ),
                      Wrap(
                        children: [
                          Wrap(
                            children: const [
                              Icon(Icons.comment),
                              Text("3"),
                            ],
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Wrap(
                            children: const [
                              Icon(
                                Icons.favorite,
                              ),
                              Text("3"),
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  Text(
                    "Cek Location : " + "Tangerang",
                    style: TextStyleConstants.kBody2,
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NewsDetailScreen(
                  article: Article(
                    id: 1,
                    title: "Admin",
                    description: "Cek Location",
                    image:
                        "https://asset.kompas.com/crops/va1BnSmU8PmCoMNkwnnVWPuBUEs=/0x517:893x1113/750x500/data/photo/2020/05/15/5ebeafd04c75f.jpeg",
                    createdAt: DateTime(200),
                    updatedAt: DateTime(200),
                    user: User(
                      id: 1,
                      name: "renwidjaya",
                      username: "renwidjaya",
                      email: "renwidjaya@gmail.com",
                      nik: "2133231290",
                      satker: "satker",
                      role: "role",
                    ),
                  ),
                ),
              ),
            ),
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.network(
                  //     "${ConstantsUtils.baseUrl}${provider.articles!.data[index].image}"),
                  Image.asset("assets/s2.jpeg"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Admin",
                          style: TextStyleConstants.kHeading4,
                        ),
                      ),
                      Wrap(
                        children: [
                          Wrap(
                            children: const [
                              Icon(Icons.comment),
                              Text("4"),
                            ],
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Wrap(
                            children: const [
                              Icon(
                                Icons.favorite,
                              ),
                              Text("3"),
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  Text(
                    "Cek Location : " + "Tangerang",
                    style: TextStyleConstants.kBody2,
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NewsDetailScreen(
                  article: Article(
                    id: 1,
                    title: "Admin",
                    description: "Cek Location",
                    image:
                        "https://asset.kompas.com/crops/va1BnSmU8PmCoMNkwnnVWPuBUEs=/0x517:893x1113/750x500/data/photo/2020/05/15/5ebeafd04c75f.jpeg",
                    createdAt: DateTime(200),
                    updatedAt: DateTime(200),
                    user: User(
                      id: 1,
                      name: "renwidjaya",
                      username: "renwidjaya",
                      email: "renwidjaya@gmail.com",
                      nik: "2133231290",
                      satker: "satker",
                      role: "role",
                    ),
                  ),
                ),
              ),
            ),
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.network(
                  //     "${ConstantsUtils.baseUrl}${provider.articles!.data[index].image}"),
                  Image.asset("assets/s3.jpeg"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Admin",
                          style: TextStyleConstants.kHeading4,
                        ),
                      ),
                      Wrap(
                        children: [
                          Wrap(
                            children: const [
                              Icon(Icons.comment),
                              Text("4"),
                            ],
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Wrap(
                            children: const [
                              Icon(
                                Icons.favorite,
                              ),
                              Text("3"),
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  Text(
                    "Cek Location : " + "Tangerang",
                    style: TextStyleConstants.kBody2,
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NewsDetailScreen(
                  article: Article(
                    id: 1,
                    title: "Admin",
                    description: "Cek Location",
                    image:
                        "https://asset.kompas.com/crops/va1BnSmU8PmCoMNkwnnVWPuBUEs=/0x517:893x1113/750x500/data/photo/2020/05/15/5ebeafd04c75f.jpeg",
                    createdAt: DateTime(200),
                    updatedAt: DateTime(200),
                    user: User(
                      id: 1,
                      name: "renwidjaya",
                      username: "renwidjaya",
                      email: "renwidjaya@gmail.com",
                      nik: "2133231290",
                      satker: "satker",
                      role: "role",
                    ),
                  ),
                ),
              ),
            ),
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.network(
                  //     "${ConstantsUtils.baseUrl}${provider.articles!.data[index].image}"),
                  Image.asset("assets/s1.jpeg"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Admin",
                          style: TextStyleConstants.kHeading4,
                        ),
                      ),
                      Wrap(
                        children: [
                          Wrap(
                            children: const [
                              Icon(Icons.comment),
                              Text("4"),
                            ],
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Wrap(
                            children: const [
                              Icon(
                                Icons.favorite,
                              ),
                              Text("3"),
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  Text(
                    "Cek Location : " + "Tangerang",
                    style: TextStyleConstants.kBody2,
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NewsDetailScreen(
                  article: Article(
                    id: 1,
                    title: "Admin",
                    description: "Cek Location",
                    image:
                        "https://asset.kompas.com/crops/va1BnSmU8PmCoMNkwnnVWPuBUEs=/0x517:893x1113/750x500/data/photo/2020/05/15/5ebeafd04c75f.jpeg",
                    createdAt: DateTime(200),
                    updatedAt: DateTime(200),
                    user: User(
                      id: 1,
                      name: "renwidjaya",
                      username: "renwidjaya",
                      email: "renwidjaya@gmail.com",
                      nik: "2133231290",
                      satker: "satker",
                      role: "role",
                    ),
                  ),
                ),
              ),
            ),
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.network(
                  //     "${ConstantsUtils.baseUrl}${provider.articles!.data[index].image}"),
                  Image.asset("assets/s2.jpeg"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Admin",
                          style: TextStyleConstants.kHeading4,
                        ),
                      ),
                      Wrap(
                        children: [
                          Wrap(
                            children: const [
                              Icon(Icons.comment),
                              Text("4"),
                            ],
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Wrap(
                            children: const [
                              Icon(
                                Icons.favorite,
                              ),
                              Text("3"),
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  Text(
                    "Cek Location : " + "Tangerang",
                    style: TextStyleConstants.kBody2,
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}