import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurjart/app/product_adding_screen/controller/product_adding.dart';
import 'package:gurjart/app/utiles/colors.dart';

class ProductAddingImage extends StatelessWidget {
  const ProductAddingImage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final data = Get.put(ProductAddingScreen());
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
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomTextformField(
            controller: data.productNameController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text("Product Name")),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: data.comapnyCollection.snapshots(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? data.onData(snapshot)
                  : const Text("Loading");
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              value: data.dropDownSelectedItemCompany,
              items: data.company.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                data.dropDownValueChange(value!);
              },
            ),
          ),
          CustomTextformField(
            maxLine: 5,
            controller: data.descriptionController,
            decoration: const InputDecoration(
              hintText: "Description",
              border: OutlineInputBorder(),
            ),
          ),
          CustomTextformField(
            controller: data.priceController,
            decoration: const InputDecoration(
              hintText: "Price",
              border: OutlineInputBorder(),
            ),
          ),
          CustomTextformField(
            controller: data.qtyController,
            decoration: const InputDecoration(
              hintText: "Qty",
              border: OutlineInputBorder(),
            ),
          ),
          const Text("Upload Image :"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImagePicerCustom(data: data),
              // ImagePicerCustom(),
              // ImagePicerCustom(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  data.onPress();
                },
                child: const Text("Save")),
          )
        ],
      ),
    );
  }
}

class ImagePicerCustom extends StatelessWidget {
  final ProductAddingScreen data;
  const ImagePicerCustom({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        data.pickImage();
      },
      child: Container(
        height: 50,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 7, 7, 7),
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomTextformField extends StatelessWidget {
  final InputDecoration? decoration;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final int? maxLine;
  const CustomTextformField({
    Key? key,
    this.decoration,
    required this.controller,
    this.validate,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        maxLines: maxLine,
        validator: validate,
        controller: controller,
        decoration: decoration,
      ),
    );
  }
}
