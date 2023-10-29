import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timart_product_app/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange.shade800),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: getRouter,
    );
  }
}
