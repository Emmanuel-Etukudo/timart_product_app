import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timart_product_app/database/database_model.dart';
import 'package:timart_product_app/features/empty_products_view.dart';
import 'package:timart_product_app/features/product_list_view.dart';
import 'package:timart_product_app/routes/app_router.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  List<Product> products = [];

  loadData() async {
    products = await Product().select().toList();
    setState(() {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Screen'),
      ),
      body: products.isEmpty
          ? const EmptyProductsView()
          : const ProductListView(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed('/${AppRoute.addProducts.name}');
          }),
    );
  }
}
