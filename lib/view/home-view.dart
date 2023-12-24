import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/models/product-model.dart';
import 'package:storeapp/services/get-all-products-services.dart';
import 'package:storeapp/widget/custom-card-widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Trend'),
          actions: const [
            IconButton(
                onPressed: null,
                icon: FaIcon(
                  FontAwesomeIcons.cartArrowDown,
                  color: Colors.black,
                ))
          ],
        ),
        body: FutureBuilder<List<ProductModel>>(
            future: GetAllProductsServices(Dio()).getAllProductData(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> productModel = snapshot.data!;
                return GridView.builder(
                  itemCount: productModel.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) =>
                      CustomCardWidget(
                    productModel: productModel[index],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })));
  }
}
