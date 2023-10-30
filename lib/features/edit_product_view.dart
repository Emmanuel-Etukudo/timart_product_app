import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timart_product_app/common_widgets/primary_button.dart';
import 'package:timart_product_app/common_widgets/primary_text_field.dart';
import 'package:timart_product_app/constants/app_sizes.dart';
import 'package:timart_product_app/database/database_model.dart';
import 'package:timart_product_app/features/controllers/add_product_controller.dart';

class EditProductView extends StatelessWidget {
  final AddProductController controller = Get.find<AddProductController>();

  final _formKey = GlobalKey<FormState>();

  final Product productToEdit;

  EditProductView({super.key, required this.productToEdit});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    controller.nameController.text = productToEdit.name ?? '';
    controller.costPriceController.text = productToEdit.cost_price.toString();
    controller.sellingPriceController.text =
        productToEdit.selling_price.toString();
    controller.quantityController.text = productToEdit.quantity.toString();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FocusScope(
              node: FocusScopeNode(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    gapH8,
                    Text(
                      'Upload Image',
                      style: theme.textTheme.bodyMedium,
                    ),
                    gapH16,
                    PrimaryTextField(
                      controller: controller.nameController,
                      hintText: 'Name',
                    ),
                    gapH16,
                    PrimaryTextField(
                      controller: controller.sellingPriceController,
                      hintText: 'Selling Price',
                      keyboardType: TextInputType.number,
                    ),
                    gapH16,
                    PrimaryTextField(
                      controller: controller.costPriceController,
                      hintText: 'Cost Price',
                      keyboardType: TextInputType.number,
                    ),
                    gapH16,
                    PrimaryTextField(
                      controller: controller.quantityController,
                      hintText: 'Quantity',
                      keyboardType: TextInputType.number,
                    ),
                    gapH24,
                    PrimaryButton(
                      text: 'Edit Product',
                      onPressed: () {
                        controller.editProduct(productToEdit);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
