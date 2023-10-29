import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timart_product_app/common_widgets/primary_button.dart';
import 'package:timart_product_app/common_widgets/primary_text_field.dart';
import 'package:timart_product_app/constants/app_sizes.dart';
import 'package:timart_product_app/database/database_model.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _nameController = TextEditingController();
  final _costPriceController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _quantityPriceController = TextEditingController();

  String get name => _nameController.text;
  String get costPrice => _costPriceController.text;
  String get sellingPrice => _sellingPriceController.text;
  String get quantity => _quantityPriceController.text;

  List<Product> products = [];

  loadData() async {
    products = await Product().select().toList();
    setState(() {});
  }

  productAdd(
      String name, double costPrice, double sellingPrice, int quantity) async {
    Product productToAdd = Product();
    productToAdd.name = name;
    productToAdd.cost_price = costPrice;
    productToAdd.selling_price = sellingPrice;
    productToAdd.quantity = quantity;
    await productToAdd.save();

    loadData();

  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   init();
    // });
  }

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _node.dispose();
    _nameController.dispose();
    _costPriceController.dispose();
    _sellingPriceController.dispose();
    _quantityPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: FocusScope(
              node: _node,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    gapH8,
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
                      controller: _nameController,
                      hintText: 'Name',
                    ),
                    gapH16,
                    PrimaryTextField(
                      controller: _sellingPriceController,
                      hintText: 'Selling Price',
                      keyboardType: TextInputType.number,
                    ),
                    gapH16,
                    PrimaryTextField(
                      controller: _costPriceController,
                      hintText: 'Cost Price',
                      keyboardType: TextInputType.number,
                    ),
                    gapH16,
                    PrimaryTextField(
                      controller: _quantityPriceController,
                      hintText: 'Quantity',
                      keyboardType: TextInputType.number,
                    ),
                    gapH24,
                    PrimaryButton(
                      text: 'Add Products',
                      onPressed: () {
                        productAdd(name, double.parse(costPrice),
                            double.parse(sellingPrice), int.parse(quantity));
                        Get.back();
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
    //   Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Add Products Screen'),
    //   ),
    //   body: Center(
    //     child: ElevatedButton(
    //       onPressed: () {
    //         Get.back();
    //       },
    //       child: const Text('Back to Home'),
    //     ),
    //   ),
    // );
  }
}
