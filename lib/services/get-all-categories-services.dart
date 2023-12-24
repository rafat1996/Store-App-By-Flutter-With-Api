import 'package:dio/dio.dart';
import 'package:storeapp/helper/api-helper.dart';

class GetAllCategoriesServices {
  final Dio dio;

  GetAllCategoriesServices(this.dio);
  Future<List> getAllCategoryData() async {
    Response response = await ApiHelper(dio: dio)
        .get(url:'https://fakestoreapi.com/products/categories');

    List<dynamic> categoryData = response.data;
    return categoryData;
  }
}
