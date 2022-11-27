import 'package:flutter/material.dart';
import 'package:security_app/utils/constants_utils.dart';
import '../../repositories/model/articles_model.dart';
import '../../repositories/service/api_services.dart';
import '../style/app_colors.dart';

class CaptureKegiatanScreen extends StatefulWidget {
  const CaptureKegiatanScreen({super.key});

  @override
  State<CaptureKegiatanScreen> createState() => _CaptureKegiatanScreenState();
}

class _CaptureKegiatanScreenState extends State<CaptureKegiatanScreen> {
  Service serviceAPI = Service();  
   late Future<List<Article>> listArticle;

  @override
  void initState() {
    super.initState();
    listArticle = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture Kegiatan'),
        backgroundColor: AppColors.softBlue,
      ),
      body: FutureBuilder<List<Article>>(
        future: listArticle,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<Article> isiArticle = snapshot.data!;
            return ListView.builder(
              itemCount: isiArticle.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(image: 
                          NetworkImage(ConstantsUtils.baseUrl+isiArticle[index].image),
                          fit: BoxFit.cover
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Text(isiArticle[index].title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Text(isiArticle[index].description),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                        child: Text("create by : ${isiArticle[index].user.name}"),
                      ),
                      Divider(color: Colors.grey[400]),
                    ],
                  ),
                );
              },
            );
          }else if(snapshot.hasError){
            return Text("${snapshot.hasError}");
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}