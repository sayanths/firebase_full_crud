import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurjart/app/product_adding_screen/view/product_adding.dart';
import 'package:gurjart/app/utiles/colors.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey,
        centerTitle: true,
        title: const Text(
          "Products",
          style: TextStyle(color: white),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => ProductAddingImage());
              },
              icon: const Icon(
                Icons.add,
                color: white,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          CustomTextTile(size: size),
        ],
      ),
    );
  }
}

class CustomTextTile extends StatelessWidget {
  const CustomTextTile({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: size.height / 6,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: grey),
                child: const Center(
                    child: Text(
                  "Image",
                  style: TextStyle(color: white),
                )),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("sds"),
                    Text("sds"),
                    Text("dsds"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                width: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text("Edit")),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Delete")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
