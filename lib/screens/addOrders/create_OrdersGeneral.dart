import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/orders.dart';
import 'package:storedelivery/class/store.dart';
import 'package:storedelivery/controllers/store_controllers.dart';
import 'package:storedelivery/screens/addOrders/create_OrdersReceiver.dart';
import 'package:storedelivery/widget/button.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/custom_input.dart';

class CreateOrderGeneral extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);
  @override
  _CreateOrderGeneralState createState() => _CreateOrderGeneralState();
}

class _CreateOrderGeneralState extends State<CreateOrderGeneral> {
  // const ({Key key}) : super(key: key);
  Orders order = Get.find<Orders>();
  StoreControllers userStore=Get.find<StoreControllers>();

  FocusNode orderName;
  FocusNode weight;
  FocusNode money;
  FocusNode note;

  @override
  void initState() {
    orderName = new FocusNode();
    weight = new FocusNode();
    money = new FocusNode();
    note = new FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    orderName.dispose();
    weight.dispose();
    money.dispose();
    note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
      appBar: AppBar(
        backgroundColor: Color(0xff1EC8C8),
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Center(
              child: const Text("Create Order",
                  style: Contanst.titleAppBar, textAlign: TextAlign.center)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Information of order",
                style: Contanst.titleInnforOrders,
              ),
              SizedBox(
                height: 20,
              ),
              CustomInput(
                title: "Order Name",
                hintText: "Clock",
                iconImages: "assets/images/ordername.png",
                onChange: (value) {
                  order.orderName = value;
                  order.idStore=userStore.storeUser;
                },
                onSubmitted: (value) {
                  weight.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              CustomInput(
                title: "Weight",
                hintText: "1kg",
                iconImages: "assets/images/weight.png",
                onChange: (value) {
                  order.totalWeight = value;
                },
                onSubmitted: (value) {
                  money.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              CustomInput(
                title: "Money",
                hintText: "300000 VNĐ",
                iconImages: "assets/images/money.png",
                onChange: (value) {
                  order.orderMoney = value;
                },
                onSubmitted: (value) {
                  note.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              CustomInput(
                title: "Note",
                hintText: "Fragile",
                iconImages: "assets/images/note.png",
                onChange: (value) {
                  order.note = value;
                },
                onSubmitted: (value) {},
                focusNode: note,
                textInputAction: TextInputAction.next,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateOrderRecevier()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 110, bottom: 40),
                  child: ButtonBtn(
                    title: "Continue",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
