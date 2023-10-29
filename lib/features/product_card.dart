import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.quantity,
    required this.costPrice,
    required this.sellingPrice,
    required this.imageUrl,
  });
  final String name;
  final int quantity;
  final double costPrice;
  final double sellingPrice;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only( left: 5.0, right: 5.0),
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
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.delete,
                    color: Color(0xFFEF & 532),
                  )
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/images/empty_box_2.svg',
              height: 75,
              width: 75,
            ),
            const SizedBox(
              height: 7.0,
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
