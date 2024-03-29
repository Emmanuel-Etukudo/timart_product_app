import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timart_product_app/common_widgets/primary_button.dart';
import 'package:timart_product_app/common_widgets/primary_text_field.dart';
import 'package:timart_product_app/constants/app_sizes.dart';
import 'package:timart_product_app/features/controllers/add_product_controller.dart';

class AddProductView extends StatelessWidget {
  final AddProductController controller = Get.put(AddProductController());
  final _formKey = GlobalKey<FormState>();

  AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                    // GestureDetector(
                    //   onTap: () {
                    //     getImage(ImageSource.gallery);
                    //   },
                    //   child: Align(
                    //     alignment: Alignment.center,
                    //     child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(50),
                    //       child: loadFromFile
                    //           ? Image.file(
                    //         imageFile,
                    //         fit: BoxFit.cover,
                    //         width: 100,
                    //         height: 100,
                    //       )
                    //           : SvgPicture.asset(SvgIcons.addPhotoIcon,
                    //           width: 100,
                    //           height: 100,
                    //           color: Colors.grey),
                    //     ),
                    //   ),
                    // ),
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
                      text: 'Add Products',
                      onPressed: () {
                        controller.addProduct();
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
