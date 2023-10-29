import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyProductsView extends StatelessWidget {
  const EmptyProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'No Products',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      SvgPicture.asset(
                        'assets/images/empty_box_2.svg',
                      ),
                      // const Spacer(),
                      const Text(
                        'Oops! Looks like there are no products here yet. Why not add one?',
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(
                        flex: 2,
                      )
                    ],
                  )))),
    );
  }
}
