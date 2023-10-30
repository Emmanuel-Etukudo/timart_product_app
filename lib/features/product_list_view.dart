import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timart_product_app/features/controllers/add_product_controller.dart';
import 'package:timart_product_app/features/edit_product_view.dart';
import 'package:timart_product_app/features/product_card.dart';

class ProductListView extends StatelessWidget {
  final AddProductController controller = Get.put(AddProductController());

  ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loadData();
    //return Once()
    return Obx(() {
      return ListView(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 50,
            child: GridView.builder(
              primary: false,
              itemCount: controller.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                final product = controller.products[index];
                return ProductCard(
                  name: product.name!,
                  quantity: product.quantity!,
                  costPrice: product.cost_price!,
                  sellingPrice: product.selling_price!,
                  imageUrl: 'imageUrl',
                  onDelete: () {
                    controller.deleteProduct(product);
                  },
                  onEdit: () {
                    Get.to(EditProductView(productToEdit: product));
                  },
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
