import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timart_product_app/database/database_model.dart';

class AddProductController extends GetxController {
  final nameController = TextEditingController();
  final costPriceController = TextEditingController();
  final sellingPriceController = TextEditingController();
  final quantityController = TextEditingController();

  RxList<Product> products = <Product>[].obs;

  void loadData() async {
    products.assignAll(await Product().select().toList());
  }

  void addProduct() async {
    final name = nameController.text;
    final costPrice = double.parse(costPriceController.text);
    final sellingPrice = double.parse(sellingPriceController.text);
    final quantity = int.parse(quantityController.text);

    Product productToAdd = Product()
      ..name = name
      ..cost_price = costPrice
      ..selling_price = sellingPrice
      ..quantity = quantity;

    await productToAdd.save();

    loadData();
    Get.back();
  }



  void editProduct(Product productToEdit) {
    // Update the product's details
    productToEdit.name = nameController.text;
    productToEdit.cost_price = double.parse(costPriceController.text);
    productToEdit.selling_price = double.parse(sellingPriceController.text);
    productToEdit.quantity = int.parse(quantityController.text);

    // Save the updated product
    productToEdit.save();

    loadData();
    Get.back();
  }

  void deleteProduct(Product product) async {
    await product.delete();
    loadData();
  }
}
