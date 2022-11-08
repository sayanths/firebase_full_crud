import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductAddingScreen extends GetxController {
  String dropDownSelectedItem = 'Category';
    String dropDownSelectedItemCompany = 'Company';

  final productNameController = TextEditingController();
   final descriptionController = TextEditingController();
      final priceController = TextEditingController();
         final qtyController = TextEditingController();

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
}
