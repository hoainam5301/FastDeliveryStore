import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/deliveryMethod.dart';
import 'package:storedelivery/class/orders.dart';
import 'package:storedelivery/controllers/store_controllers.dart';
import 'package:storedelivery/screens/hom_page.dart';
import 'package:storedelivery/widget/button.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/custom_input.dart';

class CreateOrdersTranferMethod extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);
  @override
  _CreateOrdersTranferMethodState createState() =>
      _CreateOrdersTranferMethodState();
}

class _CreateOrdersTranferMethodState extends State<CreateOrdersTranferMethod> {
  //const CreateOrdersTranferMethod({Key key}) : super(key: key);
  StoreControllers userStore =Get.find<StoreControllers>();
  Orders order = Get.find<Orders>();
  DeliveryMethod _deliveryMethod=Get.find<DeliveryMethod>();
  DeliveryMethod dropDownValue;
  String totalFee="Total Fee Delivery";
  String surCharge;
  String commission;
  String standardFee="Fee Delivery";


  FocusNode deliveryMethod;
  FocusNode totalPrice;

  @override
  void initState() {
    deliveryMethod = new FocusNode();
    totalPrice = new FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    deliveryMethod.dispose();
    totalPrice.dispose();
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
                "Delivery Method",
                style: Contanst.titleInnforOrders,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 28.0),
                    child: Align(
                      child: Text(
                        "Delivery Method",
                        style: Contanst.titleCustomInput,
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            blurRadius: 7,
                            offset: Offset(0, 7),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 6),
                      child: Row(children: [
                        Image.asset("assets/images/addressIn.png",width: 40,height: 40,),
                        SizedBox(
                          width: 12,
                        ),
                        DropdownButton<DeliveryMethod>(
                          value: dropDownValue,
                          icon:  const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                          iconSize: 24,
                          elevation: 16,
                          style: Contanst.headingText,
                          underline: Container(
                            margin: const EdgeInsets.only(top: 18),
                            height: 2,
                            color: Colors.transparent,
                          ),
                          onChanged: (DeliveryMethod newValue) {
                              dropDownValue = newValue;
                              order.idDeliveryMethod=newValue;
                              order.getFee(order).then((value) {
                                setState(() {
                                  standardFee=order.standardFee1;
                                  commission=order.commission1;
                                  totalFee=order.totalFeeDelivery1;
                                  surCharge=order.surCharge1;
                                });
                              });
                              //Call getTotalFee
                          },
                          hint: Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            width: 240,
                            height: 48,
                            child: Text(
                              "Delivery Method",
                              style: Contanst.hintText,
                            ),
                          ),
                          items: _deliveryMethod.listAllDeliveryMethod.map((DeliveryMethod method) {
                            return DropdownMenuItem<DeliveryMethod>(
                              value: method,
                              child: Text(
                                method.name,
                                style: Contanst.headingText,
                              ),
                            );
                          }).toList(),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 6.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 5.0),
                      child: Align(
                        child: Text("Fee Delivery",style: Contanst.titleCustomInput,),
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              blurRadius: 7,
                              offset: Offset(0, 7),
                            )
                          ]
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset("assets/images/money.png",),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 6.0),
                            child:
                            Center(child: Text(standardFee ,style: Contanst.headingText, ))
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 6.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 5.0),
                      child: Align(
                        child: Text("Sur Charge",style: Contanst.titleCustomInput,),
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              blurRadius: 7,
                              offset: Offset(0, 7),
                            )
                          ]
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset("assets/images/money.png",),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 6.0),
                              child:
                              Center(child:Text(surCharge != null ? surCharge : "Sur charge",style: Contanst.headingText, ))
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 6.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 5.0),
                      child: Align(
                        child: Text("Commission",style: Contanst.titleCustomInput,),
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              blurRadius: 7,
                              offset: Offset(0, 7),
                            )
                          ]
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset("assets/images/money.png",),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 6.0),
                              child:
                              Center(child: Text(commission != null ? commission : "Commission",style: Contanst.headingText, ))
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 6.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 5.0),
                      child: Align(
                        child: Text("Total Fee Delivery",style: Contanst.titleCustomInput,),
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              blurRadius: 7,
                              offset: Offset(0, 7),
                            )
                          ]
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset("assets/images/money.png",),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 6.0),
                              child:
                              Center(child: Text(totalFee != null ? totalFee : "Total Fee",style: Contanst.headingText, ))
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (order != null) {
                    order.createOrder(order).then((value) {
                      setState(() {
                        order.getListOrders(userStore.storeUser.id).then((value) {
                          setState(() {
                            Get.offAll(HomePage());
                          });
                        });
                      });
                    });} else {
                    print("null cmnr");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 40),
                  child: ButtonBtn(
                    title: "Create",
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
