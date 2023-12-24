import 'package:flutter/material.dart';
import 'package:storeapp/view/home-view.dart';
import 'package:storeapp/view/update-product-view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': ((context) => const HomeView()),
  'UpdateProductView': ((context) => UpdateProductView()),
};
