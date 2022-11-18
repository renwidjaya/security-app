import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_app/providers/articles_provider.dart';
import 'package:security_app/repositories/model/articles_model.dart';
import 'package:security_app/ui/screen/news_detail_screen.dart';
import 'package:security_app/ui/style/app_colors.dart';
import 'package:security_app/ui/style/text_tyle_constants.dart';
import 'package:security_app/ui/widget/custom_drawer.dart';
import 'package:security_app/utils/constants_utils.dart';
import 'package:security_app/utils/state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Berita Terkini",
              style: TextStyleConstants.kHeading3,
            ),
            const SizedBox(
              height: 16.0,
            ),
            carouselBerita(),
            Text(
              "Kegiatan",
              style: TextStyleConstants.kHeading3,
            ),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewsDetailScreen(
                        article: Article(
                          id: 1,
                          title: "3",
                          description: "test",
                          image:
                              "https://asset.kompas.com/crops/va1BnSmU8PmCoMNkwnnVWPuBUEs=/0x517:893x1113/750x500/data/photo/2020/05/15/5ebeafd04c75f.jpeg",
                          createdAt: DateTime(200),
                          updatedAt: DateTime(200),
                          user: User(
                            id: 1,
                            name: "name",
                            username: "username",
                            email: "email",
                            nik: "nik",
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
                                "InI Judul",
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
                          "Ini daftar kegiatan adalah..",
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
          ],
        ),
      ),
    );
  }

  CarouselSlider carouselBerita() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              child: Image.asset(
                "assets/s1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text(
                "Pencurian ATM Di Indonesia",
                style: TextStyleConstants.kHeading4
                    .copyWith(color: AppColors.white),
              ),
            )
          ],
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              child: Image.asset(
                "assets/s2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text(
                "Pencurian ATM Di Indonesia",
                style: TextStyleConstants.kHeading4
                    .copyWith(color: AppColors.white),
              ),
            )
          ],
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              child: Image.asset(
                "assets/s3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text(
                "Pencurian ATM Di Indonesia",
                style: TextStyleConstants.kHeading4
                    .copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


 // Consumer<ArticlesProvider>(
            //   builder: (context, provider, child) {
            //     if (provider.state == ViewState.loading) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else if (provider.state == ViewState.noData) {
            //       return const Center(
            //         child: Text("Data belum tersedia"),
            //       );
            //     } else if (provider.state == ViewState.hasData) {
                  // return ListView.builder(
                  //   itemCount: provider.articles!.data.length,
                  //   shrinkWrap: true,
                  //   primary: false,
                  //   itemBuilder: (context, index) {
                  //     return InkWell(
                  //       onTap: () => Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (_) => NewsDetailScreen(
                  //             article: provider.articles!.data[index],
                  //           ),
                  //         ),
                  //       ),
                  //       child: Card(
                  //         elevation: 0,
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Image.network(
                  //                 "${ConstantsUtils.baseUrl}${provider.articles!.data[index].image}"),
                  //             Text(
                  //               provider.articles!.data[index].title,
                  //               style: TextStyleConstants.kHeading4,
                  //             ),
                  //             Text(
                  //               provider.articles!.data[index].title,
                  //               style: TextStyleConstants.kBody2,
                  //             ),
                  //             const SizedBox(
                  //               height: 20.0,
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );
            //     } else {
            //       return Text(provider.articles!.message);
            //     }
            //   },
            // )