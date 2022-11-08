import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurjart/app/utiles/colors.dart';

class ProductAddingImage extends StatelessWidget {
  const ProductAddingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            )),
        centerTitle: true,
        title: const Text(
          "Add Products",
          style: TextStyle(color: white),
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            
          ),
        ],
      ),
    );
  }
}
