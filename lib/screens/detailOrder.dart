import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/orders.dart';
import 'package:storedelivery/screens/editOrder.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/showInForTracking.dart';
import 'package:storedelivery/widget/showInformation.dart';

class DetailOrder extends StatelessWidget {
  //const DetalOrder({Key? key}) : super(key: key);
  final Orders orders;

  DetailOrder({this.orders});

  List<Widget> buildOrderStatus() {
    List<Widget> listinfoStatus = [];
    orders.listAllStatusOrder.forEach((element) {
      listinfoStatus.add(GestureDetector(
        onTap: (){
          //print(element.orderName);
          //Get.to(DetailOrder(orders: element,));
        },
        child: TrackingInfo(
          orders: orders,
          detailStatus: element,
        ),
      ));
    });
    return listinfoStatus;
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
              child: const Text("Detail Order",
                  style: Contanst.titleAppBar, textAlign: TextAlign.center)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 24.0),
          child: Column(
            children: [
              Container(
                child:orders.idPresentStatus.idStatus.name != "Giao hàng thành công" ? GestureDetector(
                  onTap: (){
                    print(orders.idPresentStatus.idStatus.name);
                    Get.to(EditOrder(order: orders,));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 300
                    ),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color:Color(0xff1EC8C8) ,
                      border: Border.all(
                          color: Color(0xff1EC8C8),
                          width: 1
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(200),
                      ),
                    ),
                    child: Image.asset("assets/images/pencil.png"),
                  ),
                ) : null ,
              ),
              Container(
                margin: EdgeInsets.only(

                ),
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color:Color(0xff1EC8C8) ,
                  border: Border.all(
                      color: Color(0xff1EC8C8),
                      width: 1
                  ),
                ),
                child: Center(child: Text("Image",style: Contanst.titleAppBar,)),
              ),
              SizedBox(height: 50,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Tracking",
                    style: Contanst.titleInforProfile,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                  height: 250,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,

                  ),
                  child: SingleChildScrollView(
                      child: Column(
                        children: buildOrderStatus(),)
                  )
              ),
              SizedBox(height: 12,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "General",
                    style: Contanst.titleInforProfile,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ShowInformation(
                      titleInfor: "Name Order",
                      information: orders.orderName,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Weight",
                      information: orders.totalWeight,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Money",
                      information: orders.orderMoney,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Note",
                      information: orders.note,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Information Receiver",
                    style: Contanst.titleInforProfile,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ShowInformation(
                      titleInfor: "Receiver Name",
                      information:orders.receiverName,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Receiver Email",
                      information: orders.receiverEmail,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Phone",
                      information: orders.receiverPhone,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Receiver District",
                      information: orders.receiverIDAddress.idWard.idDistrict.name,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Receiver Ward",
                      information: orders.receiverIDAddress.idWard.name,
                    ),
                    SizedBox(height: 15,),
                    ShowInformation(
                      titleInfor: "Delivery Method",
                      information: orders.idDeliveryMethod.name,
                    ),
                    ShowInformation(
                      titleInfor: "Standard Fee",
                      information: orders.standardFee,
                    ),
                    ShowInformation(
                      titleInfor: "Sur Charge",
                      information: orders.surCharge,
                    ),
                    ShowInformation(
                      titleInfor: "Fee Change Address Delivery",
                      information: orders.feeChangeAddressDelivery,
                    ),
                    ShowInformation(
                      titleInfor: "Fee Storage Charge",
                      information: orders.feeStorageCharges,
                    ),
                    ShowInformation(
                      titleInfor: "Fee return ",
                      information: orders.feeReturn,
                    ),
                    ShowInformation(
                      titleInfor: "Total Fee",
                      information: orders.feeDelivery,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0,),


            ],
          ),
        ),
      ),
    );
  }
}
