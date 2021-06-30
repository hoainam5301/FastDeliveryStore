import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/orders.dart';
import 'package:storedelivery/screens/detailOrder.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/showInForOrders.dart';
import 'package:storedelivery/widget/showInFormationCommission.dart';

class ListOrder extends StatefulWidget {
  //const ListOrder({Key key}) : super(key: key);
  @override
  _ListOrderState createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  Orders _orders= Get.find<Orders>();

  List<Widget> buildOrder() {
    int i=0;
    List<Widget> listinfo = [];
    _orders.listAllOrder.forEach((element) {
      listinfo.add(GestureDetector(
        onTap: (){
          print(element.totalFeeDelivery);
          element.getListStatusOrder(element.id).then((value) {if(value!=null){
            Get.to(DetailOrder(
              orders: element,
            ));
          }});
        },
        child: ShowInformationOrder(
          index: i.toString(),
          orders: element,
        ),
      ));
      i++;
    });
    return listinfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1EC8C8),
        title: Center(child: const Text("List Orders",style: Contanst.titleAppBar,)),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: buildOrder()
          ),
        ),
      ),
    );
  }
}
