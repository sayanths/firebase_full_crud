import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyAddingController extends GetxController {
  final companyAddingController = TextEditingController();

  List<String> list = [];
  onPress(String? companyName) {
    final company = FirebaseFirestore.instance
        .collection('company')
        .add({"companies": companyName});

    update();
  }

  @override
  void dispose() {
    companyAddingController.clear();
    super.dispose();
  }
}
