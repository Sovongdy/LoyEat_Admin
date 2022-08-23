// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loyeat_admin/src/widget/bottom_app_bar_widget.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final customerName = TextEditingController();
  final customerId = TextEditingController();
  final gender = TextEditingController();
  final tel = TextEditingController();
  final createAt = TextEditingController();
  final createTime = TextEditingController();
  final image = TextEditingController();
  final location = TextEditingController();
  final latitude = TextEditingController();
  final longitude = TextEditingController();

  CollectionReference customers = FirebaseFirestore.instance.collection('customers');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: body,
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }

  final appbar = AppBar(
    title: const Text('Customer Page'),
  );

  Widget get body {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      children: [
        textEditingController(controller: customerId, labletext: 'Customer ID'),
        textEditingController(controller: customerName, labletext: 'Customer Name'),
        textEditingController(controller: gender, labletext: 'Gender'),
        textEditingController(controller: tel, labletext: 'Telephone'),
        textEditingController(controller: createAt, labletext: 'Create Date'),
        textEditingController(controller: createTime, labletext: 'Create Time'),
        textEditingController(controller: location, labletext: 'Location'),
        textEditingController(controller: latitude, labletext: 'Latitude'),
        textEditingController(controller: longitude, labletext: 'Longitude'),
        textEditingController(controller: image, labletext: 'Image'),
        buttonSubmit,
      ],
    );
  }

  Widget textEditingController(
      {required TextEditingController controller, required String labletext}) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: TextField(
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labletext,
          ),
          onSubmitted: (value) {
            controller.text = value;
          },
        ),
      ),
    ]);
  }

  Widget get buttonSubmit {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 400,
              child: RaisedButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                onPressed: () async {
                  await customers.add({
                    'customer_name': customerName.text,
                    'customer_id': customerId.text,
                    'create_at': createAt.text,
                    'create_time': createTime.text,
                    'gender': gender.text,
                    'tel': tel.text,
                    'position': GeoPoint(double.parse(latitude.text),double.parse(longitude.text)),
                    'location': location.text,
                    'image': image.text,
                  }).then((value) => print('Customer Added'));
                  customerId.clear();
                  customerName.clear();
                  gender.clear();
                  tel.clear();
                  createAt.clear();
                  createTime.clear();
                  location.clear();
                  latitude.clear();
                  longitude.clear();
                  image.clear();
                },
                color: Colors.blue,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Text(
                  "Submit Data",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}