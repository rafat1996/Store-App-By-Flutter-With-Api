import 'package:dio/dio.dart';
import 'package:storeapp/helper/api-helper.dart';
import 'package:storeapp/models/product-model.dart';

class UpdateProductsServices {
  Dio dio;
  UpdateProductsServices(this.dio);

  Future<ProductModel> updateProductsData(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Response response = await ApiHelper(dio: dio)
        .put(url: 'https://fakestoreapi.com/products', data: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    Map<String, dynamic> data = response.data;
    return ProductModel.fromJson(data);
  }
}
