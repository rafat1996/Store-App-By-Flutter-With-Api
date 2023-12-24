import 'package:flutter/material.dart';
import 'package:storeapp/models/product-model.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'UpdateProductView',
          arguments: productModel),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 200,
            width: 230,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        productModel.title.substring(0, 17),
                        style: const TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(r'$' '${productModel.price}'),
                        const IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 80,
            bottom: 110,
            child: Image.network(
              productModel.image,
              height: 90,
              width: 90,
            ),
          )
        ],
      ),
    );
  }
}
