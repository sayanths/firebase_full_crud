import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurjart/app/manage_category/controller/category_page_controller.dart';
import 'package:gurjart/app/product_adding_screen/view/product_adding.dart';
import 'package:gurjart/app/utiles/colors.dart';

class ManageCategory extends StatelessWidget {
  const ManageCategory({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final category = Get.put(CategoryAddingController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey,
        centerTitle: true,
        title: const Text(
          "Category",
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
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomTextformField(
            controller: category.categoryAddingController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text("Category Name")),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(onPressed: () {}, child: const Text("Add")),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "List of Categories",
            style: TextStyle(
                color: grey, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height / 15,
              width: size.width / 1,
              decoration: BoxDecoration(
                  color: grey, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "application",
                      style: TextStyle(color: white, fontSize: 20),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: white,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
