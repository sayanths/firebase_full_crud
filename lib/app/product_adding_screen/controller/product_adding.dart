import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gurjart/app/product_adding_screen/model/product_model.dart';

class ProductAddingScreen extends GetxController {
  String dropDownSelectedItem = 'Category';
  String dropDownSelectedItemCompany = 'Company';
  final productNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final qtyController = TextEditingController();

  final productCollection = FirebaseFirestore.instance
      .collection('product')
      .doc('eEFYfTfPQx8O7GbxGmNR');

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
    await productCollection.set(json);
  }
}

enum ScreenType { add, edit }
