import 'package:dio/dio.dart';
import 'package:storeapp/helper/api-helper.dart';
import 'package:storeapp/models/product-model.dart';

class GetAllProductsServices {
  final Dio dio;

  GetAllProductsServices(this.dio);

  Future<List<ProductModel>> getAllProductData() async {
    Response response =
        await ApiHelper(dio: dio).get(url: 'https://fakestoreapi.com/products');

    List<dynamic> data = response.data;
    List<ProductModel> products = [];

    for (var element in data) {
      ProductModel productModel = ProductModel.fromJson(element);
      products.add(productModel);
    }

    return products;
  }
}
