import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryAddingController extends GetxController {
  final categoryAddingController = TextEditingController();
  onPress(String? categoryName) {
    final category = FirebaseFirestore.instance
        .collection('category')
        .add({"categories": categoryName});

    update();
  }

  onDeleteName(String id) {
    FirebaseFirestore.instance.collection('category').doc(id).delete();
  }

  @override
  void dispose() {
    categoryAddingController.clear();
    super.dispose();
  }
}
