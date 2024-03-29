import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timart_product_app/constants/app_sizes.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.name,
      required this.quantity,
      required this.costPrice,
      required this.sellingPrice,
      required this.imageUrl,
      required this.onDelete,
      required this.onEdit});
  final String name;
  final int quantity;
  final double costPrice;
  final double sellingPrice;
  final String imageUrl;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0),
            ],
            color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: onDelete,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.deepOrange,
                    ),
                  ),
                  gapW16,
                  GestureDetector(
                    onTap: onEdit,
                    child: const Icon(
                      Icons.edit,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/images/empty_box_2.svg',
              height: 75,
              width: 75,
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(sellingPrice.toString()),
            Text(name),
            const Divider(
              height: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('Quantity: $quantity')],
              ),
            )
          ],
        ),
      ),
    );
  }
}
