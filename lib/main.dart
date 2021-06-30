import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/address.dart';
import 'package:storedelivery/class/bank.dart';
import 'package:storedelivery/class/deliveryMethod.dart';
import 'package:storedelivery/class/district.dart';
import 'package:storedelivery/class/commission.dart';
import 'package:storedelivery/class/orders.dart';
import 'package:storedelivery/class/ward.dart';
import 'package:storedelivery/controllers/store_controllers.dart';
import 'package:storedelivery/screens/langding_page.dart';

void main() {
  Get.put(StoreControllers());
  Get.put(Bank());
  Get.put(District());
  Get.put(DeliveryMethod());
  Get.put(Orders());
  Get.put(Ward());
  Get.put(Address());
  Get.put(Commission());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'StoreDelivery App',
      theme: ThemeData(
          fontFamily: 'Roboto Slab'
      ),
      home: LandingPage() ,
    );
  }
}

