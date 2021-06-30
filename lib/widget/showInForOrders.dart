import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/orders.dart';
import 'package:storedelivery/controllers/store_controllers.dart';
import 'package:storedelivery/screens/hom_page.dart';
import 'package:storedelivery/widget/contans.dart';

class ShowInformationOrder extends StatelessWidget {
  //const ShowInformationOrder({Key key}) : super(key: key);
  final Orders orders;
  final String index;

  ShowInformationOrder({this.orders, this.index});

  Orders order = Get.find<Orders>();
  StoreControllers userStore = Get.find<StoreControllers>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 12.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              blurRadius: 7,
              offset: Offset(0, 7),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color(0xff1EC8C8),
                border: Border.all(color: Color(0xffA1A1A1), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  index,
                  style: Contanst.inbuttonTextFB,
                )),
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/nameOrder.png",
                      height: 30,
                      width: 30,
                    ),
                    Container(
                      width: 225,
                      child: Text(
                        orders.orderName,
                        style: Contanst.regularText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child:
                          orders.idPresentStatus.idStatus.name == "Chưa xử lý"
                              ? GestureDetector(
                                  onTap: () {
                                    orders.deleteOrder(orders.id).then((value) {
                                      print("Doneeeeeeeeeeeeeeeee");
                                      order
                                          .getListOrders(userStore.storeUser.id)
                                          .then((value) {
                                        Get.offAll(HomePage());
                                      });
                                    });
                                  },
                                  child: Image.asset(
                                    "assets/images/delete.png",color: Colors.red,
                                    width: 30,
                                    height: 30,
                                  ))
                              : null,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/dola.png",
                          height: 30,
                          width: 30,
                        ),
                        Text(
                          "${orders.feeDelivery} VNĐ",
                          style: Contanst.informationOrders,
                          textAlign: TextAlign.left,
                          maxLines: 100,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/nameperson.png",
                          height: 30,
                          width: 30,
                        ),
                        Text(
                          "${orders.receiverName}",
                          style: Contanst.informationOrders,
                          textAlign: TextAlign.left,
                          maxLines: 100,
                        ),
                      ],
                    ),
                    Container(
                      width: 280,
                      height: 50,
                      margin: const EdgeInsets.only(top: 3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/addressIn.png",
                            height: 30,
                            width: 30,
                          ),
                          Container(
                            width: 230,
                            child: Text(
                              "${orders.receiverIDAddress.fullAddress}",
                              style: Contanst.informationOrders,
                              textAlign: TextAlign.left,
                              maxLines: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
