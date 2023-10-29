import 'package:get/get.dart';
import 'package:timart_product_app/features/add_product_view.dart';
import 'package:timart_product_app/features/products_view.dart';

enum AppRoute {
  addProducts,
}

final getRouter = [
  GetPage(name: '/', page: () => const ProductsView()),
  GetPage(
      name: '/${AppRoute.addProducts.name}', page: () => const AddProductView())
];
