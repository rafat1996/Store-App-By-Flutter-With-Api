import 'package:dio/dio.dart';
import 'package:storeapp/helper/api-helper.dart';
import 'package:storeapp/models/product-model.dart';

class GetCategoryProductServices {
  final Dio dio;

  GetCategoryProductServices(this.dio);
  Future<List<ProductModel>> getCategoryProductData(
      {required String categoryName}) async {
    Response response = await ApiHelper(dio: dio).get(
        url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<dynamic> data = response.data;
    List<ProductModel> products = [];

    for (var element in data) {
      ProductModel productModel = ProductModel.fromJson(element);
      products.add(productModel);
    }
    return products;
  }
}
