import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurjart/app/product_home_view/view/home_product_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: const Color.fromARGB(255, 68, 68, 68),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {
                print("object");
                Get.to(() => const ProductView());
              },
              child: CustomContainer(size: size, title: "title"))
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String title;
  const CustomContainer({
    Key? key,
    required this.size,
    required this.title,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height / 4,
      width: size.width / 1.1,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 68, 68, 68),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      )),
    );
  }
}
