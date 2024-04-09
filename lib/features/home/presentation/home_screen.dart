import 'dart:developer';
import 'package:bloc_practice/features/home/data/api.dart';
import 'package:bloc_practice/features/home/model/data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import '../../../helper/di.dart';
import '../../language/screen/language_setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'.tr),
        actions: [
          InkWell(
              onTap: () {
                log('message');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LanguageSetting(),
                    ));
              },
              child: const Icon(Icons.settings))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: locator.get<FetchApi>().getPost(),
              builder: (context, snapshot) {
                // ignore: unrelated_type_equality_checks
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('No news found'),
                  );
                }
                if (snapshot.hasData) {
                  NewsModel data = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.articles!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    imageUrl: data
                                            .articles![index].urlToImage ??
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      Assets.images.image.path,
                                    ),
                                    placeholder: (context, url) => Image.asset(
                                      Assets.images.image.path,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    data.articles![index].content ??
                                        'No Content Found',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
