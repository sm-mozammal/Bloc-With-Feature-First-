import 'package:bloc_practice/features/home/model/data_model.dart';
import 'package:bloc_practice/network/endpoints.dart';
import 'package:dio/dio.dart';
import '../../../network/dio/dio.dart';
import '../../../network/exception_handler/data_source.dart';

class FetchApi {
  static final FetchApi _singleton = FetchApi._internal();
  FetchApi._internal();
  static FetchApi get instance => _singleton;

  Future<NewsModel> getPost({String searchText = ''}) async {
    try {
      Response response = await getHttp(Endpoints.allNews(searchText));
      if (response.statusCode == 200) {
        NewsModel jsonData = NewsModel.fromJson(response.data);
        return jsonData;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }

  // Future<NewsModel> getPost() async {
  //   try {
  //     final dio = locator.get<Dio>();
  //     Response response = await dio.get(Endpoints.allNews());
  //     if (response.statusCode == 200) {
  //       NewsModel jsonData = NewsModel.fromJson(response.data);
  //       log(jsonData.articles!.first.content.toString());
  //       log(response.statusCode.toString());
  //       return jsonData;
  //     } else {
  //       throw Exception('Failed to load news');
  //     }
  //   } catch (error) {
  //     throw Exception(error.toString());
  //   }
  // }
}
