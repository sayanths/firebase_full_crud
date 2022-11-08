import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurjart/app/manage_company/controller/company_adding_controller.dart';
import 'package:gurjart/app/product_adding_screen/view/product_adding.dart';
import 'package:gurjart/app/utiles/colors.dart';

class ManageCompany extends StatelessWidget {
  const ManageCompany({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final category = Get.put(CompanyAddingController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey,
        centerTitle: true,
        title: const Text(
          "Company",
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
      body: GetBuilder<CompanyAddingController>(builder: (context) {
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomTextformField(
              controller: context.companyAddingController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Category Name")),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    category.onPress(context.companyAddingController.text);
                  },
                  child: const Text("Add")),
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "List of Companies",
                  style: TextStyle(
                      color: grey, fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('company').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView(
                      children: snapshot.data!.docs.map((e) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ColoredBox(
                            color: grey,
                            child: ListTile(
                              title: Text(
                                e["companies"],
                                style:
                                    const TextStyle(color: white, fontSize: 20),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    category.onDeleteName(e.id);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: white,
                                  )),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                } else {
                  return const CupertinoActivityIndicator();
                }
              },
            )
          ],
        );
      }),
    );
  }
}

// class CompanyListTileCustom extends StatelessWidget {
//   final String data;
//   const CompanyListTileCustom({
//     Key? key,
//     required this.size,
//     required this.data,
//   }) : super(key: key);

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: size.height / 15,
//         width: size.width / 1,
//         decoration:
//             BoxDecoration(color: grey, borderRadius: BorderRadius.circular(5)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 data,
//                 style: const TextStyle(color: white, fontSize: 20),
//               ),
//             ),
//             IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.delete,
//                   color: white,
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
