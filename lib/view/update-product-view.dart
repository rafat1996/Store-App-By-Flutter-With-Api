import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product-model.dart';
import 'package:storeapp/services/update-products-services.dart';
import 'package:storeapp/widget/custom-button-widget.dart';
import 'package:storeapp/widget/custom-text-form-field-widget.dart';

// ignore: must_be_immutable
class UpdateProductView extends StatefulWidget {
  UpdateProductView({super.key});

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  String? productName, description, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings as ProductModel ;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextFormFieldWidget(
                hint: 'Product Name',
                onChanged: (data) {
                  productName = data;
                },
              ),
              CustomTextFormFieldWidget(
                hint: 'price',
                onChanged: (data) {
                  price = data;
                },
                textInputType: TextInputType.number,
              ),
              CustomTextFormFieldWidget(
                hint: 'description',
                onChanged: (data) {
                  description = data;
                },
              ),
              CustomTextFormFieldWidget(
                hint: 'image',
                onChanged: (data) {
                  image = data;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButtonWidget(
                  text: 'Update',
                  onTap: () {
                    isLoading = true;
                    setState(() {});
                    try {
                      updateMethod(productModel);
                      print('Success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  })
            ],
          ),
        ),
      ),
    );
  }

  void updateMethod(ProductModel productModel) {
    UpdateProductsServices(Dio()).updateProductsData(
        title: productName == null ? productModel.title : productName!,
        price: price == null ? productModel.price.toString() : price!,
        description:
            description == null ? productModel.description : description!,
        image: image == null ? productModel.image : image!,
        category: productModel.category);
  }
}
