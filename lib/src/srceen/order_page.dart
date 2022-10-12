import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyeat_admin/src/controller/order_page_controller.dart';
import 'package:loyeat_admin/src/srceen/order_page_detail.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key}) : super(key: key);

  final controller = Get.put(OrderPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: body,
      backgroundColor: const Color.fromARGB(255, 199, 199, 198),
    );
  }

  final appbar = AppBar(
    title: const Text('Order Page'),
  );

  Widget get body{
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: controller.listStoreName.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
              height: 220,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 233, 232),
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('lib/images/logo_amazon.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text(controller.listStoreName[index], style: const TextStyle(fontWeight: FontWeight.bold))),
                  ),
                ],
              ),
            ),
          ),
          onTap: () => Get.to(() => const OrderPageDetail(), arguments: {'merchantName': controller.listStoreName[index]}),
        );
      },
    );
  }
}