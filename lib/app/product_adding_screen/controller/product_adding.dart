import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurjart/app/product_adding_screen/model/product_model.dart';
import 'package:image_picker/image_picker.dart';

class ProductAddingScreen extends GetxController {
  String dropDownSelectedItem = 'Category';
  String dropDownSelectedItemCompany = 'Company';
  final productNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final qtyController = TextEditingController();

  final productCollection = FirebaseFirestore.instance.collection('product');
  final comapnyCollection = FirebaseFirestore.instance.collection('company');

  List<String> category = <String>[
    'Category',
    'Iphone',
    'Led tv',
    'JBL speaker',
    'Headphone',
    'Monitor'
  ];

  List<String> company = <String>[
    'Company',
    'LG',
    'Apple',
    'Boat',
    'Dell',
    'Plasma'
  ];

  dropDownValueChange(String value) {
    dropDownSelectedItem = value;
    update();
  }

  onPress() {
    final product = ProductModel(
      productName: productNameController.text,
      category: dropDownSelectedItem,
      company: dropDownSelectedItemCompany,
      description: descriptionController.text,
      price: priceController.text,
      qty: qtyController.text,
    );
    checkData(product);
  }

  checkData(ProductModel model) async {
    final json = model.toSnapshot();
    await productCollection.add(json);
  }

  String imageAvtr = '';

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    imageAvtr = base64Encode(temp);
    update();
  }

  List<DropdownMenuItem> companyItem = [];
  onda(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    for (int i = 0; i < snapshot.data!.docs.length; i++) {
      DocumentSnapshot snap = snapshot.data!.docs[i];
      companyItem.add(DropdownMenuItem(
        value: snap.id,
        child: Text(snap.id),
      ));
    }
  }

  onData(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    List<DropdownMenuItem> companyItem = [];
    for (int i = 0; i < snapshot.data!.docs.length; i++) {
      DocumentSnapshot snap = snapshot.data!.docs[i];
      companyItem.add(DropdownMenuItem(
        value: snap.id,
        child: Text(snap.id),
      ));
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton(
        value: "dropDownSelectedItem",
        items: companyItem,
        onChanged: (value) {
          dropDownValueChange(value!);
        },
      ),
    );
  }
}

enum ScreenType { add, edit }
