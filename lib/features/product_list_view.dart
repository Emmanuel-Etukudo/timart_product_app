import 'package:flutter/material.dart';
import 'package:timart_product_app/database/database_model.dart';
import 'package:timart_product_app/features/product_card.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  List<Product> products = [];

  loadData() async {
    products = await Product().select().toList();
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                    name: products[index].name!,
                    quantity: products[index].quantity!,
                    costPrice: products[index].cost_price!,
                    sellingPrice: products[index].selling_price!,
                    imageUrl: 'imageUrl');
              },
            ),
          )
        ],

    );
  }
}
