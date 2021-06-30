import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:storedelivery/controllers/store_controllers.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/showInformation.dart';

class CashFlow extends StatefulWidget {
  //const CashFlow({Key key}) : super(key: key);
  @override
  _CashFlowState createState() => _CashFlowState();
}

class _CashFlowState extends State<CashFlow> {
  StoreControllers userStore = Get.find<StoreControllers>();

  PageController _tabController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabController = PageController();
    GetData(userStore.storeUser.id).then((value) {if(value!=null)
    {
      print("Done");
    }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  var now = DateTime.now();

  Delivered delivered=new Delivered();

  Delivering delivering=new Delivering();

  Future<String> GetData(String idstore) async {
    final String apiUrl = "http://52.142.43.138:3000/stores/$idstore/statistics";
    var response = await http.get(apiUrl);

    if(response.statusCode==201 || response.statusCode==200) {
      final String storeFrom=response.body;
      setState(() {
        delivered.orderMoney = jsonDecode(response.body)['delivered']['orderMoney'];
        delivered.commission = jsonDecode(response.body)['delivered']['commission'];
        delivered.surCharge = jsonDecode(response.body)['delivered']['surCharge'];
        delivered.standardFee = jsonDecode(response.body)['delivered']['standardFee'];
        delivered.feeChangeAddressDelivery = jsonDecode(response.body)['delivered']['feeChangeAddressDelivery'];
        delivered.feeStorageCharges = jsonDecode(response.body)['delivered']['feeStorageCharges'];
        delivered.feeReturn = jsonDecode(response.body)['delivered']['feeReturn'];
        delivered.totalFee = jsonDecode(response.body)['delivered']['totalFee'];

        delivering.orderMoney = jsonDecode(response.body)['delivering']['orderMoney'];
        delivering.commission = jsonDecode(response.body)['delivering']['commission'];
        delivering.surCharge = jsonDecode(response.body)['delivering']['surCharge'];
        delivering.standardFee = jsonDecode(response.body)['delivering']['standardFee'];
        delivering.feeChangeAddressDelivery = jsonDecode(response.body)['delivering']['feeChangeAddressDelivery'];
        delivering.feeStorageCharges = jsonDecode(response.body)['delivering']['feeStorageCharges'];
        delivering.feeReturn = jsonDecode(response.body)['delivering']['feeReturn'];
        delivering.totalFee = jsonDecode(response.body)['delivering']['totalFee'];
      });
    }
    else {
      throw Exception(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1EC8C8),
        title: Center(child: const Text("Casht Flow Management",style: Contanst.titleAppBar,)),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color:_selectedTab == 0 ? Color(0xff1EC8C8) : Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:_selectedTab == 1 ? Color(0xff1EC8C8) : Colors.transparent,
                  ),
                ),
              ],
            ),
            Expanded(
                child: PageView(
                  controller: _tabController,
                  onPageChanged: (num) {
                    setState(() {
                      _selectedTab = num;
                    });
                  },
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 6),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Statistic Delivered", style: Contanst.headingText,),
                                  Text("Cash flow control of completed orders",style: Contanst.specialText,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: GestureDetector(
                              onTap: (){
                                GetData(userStore.storeUser.id);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                       Text("This Month", style: Contanst.headingText,),
                                       Text("01/${now.month}/${now.year} - ${now.day}/${now.month}/${now.year}"),
                                      ],
                                    ),
                                  ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "COD money",
                              information: delivered.orderMoney.toString(),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "Standard Fee",
                              information: delivered.standardFee.toString(),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "SurCharge",
                              information: delivered.surCharge.toString(),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "Commission",
                              information: delivered.commission.toString(),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "Fee Change Address Delivery",
                              information: delivered.feeChangeAddressDelivery.toString(),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "Fee Return",
                              information: delivered.feeReturn.toString(),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "Total Fee",
                              information: delivered.totalFee.toString(),
                            ),
                          ),
                          SizedBox(height: 100,),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 6),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Statistic Delivering", style: Contanst.headingText,),
                                  Text("Control cash flow of on-going orders",style: Contanst.specialText,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: GestureDetector(
                              onTap: (){
                                GetData(userStore.storeUser.id);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("This Month", style: Contanst.headingText,),
                                      Text("01/${now.month}/${now.year} - ${now.day}/${now.month}/${now.year}"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "COD money",
                              information: delivering.orderMoney.toString(),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "Standard Fee",
                              information: delivering.standardFee.toString(),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "SurCharge",
                              information: delivering.surCharge.toString(),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "Commission",
                              information: delivering.commission.toString(),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "Fee Change Address Delivery",
                              information: delivering.feeChangeAddressDelivery.toString(),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "Fee Return",
                              information: delivering.feeReturn.toString(),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: ShowInformation(
                              titleInfor: "Total Fee",
                              information: delivering.totalFee.toString(),
                            ),
                          ),
                          SizedBox(height: 100,),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class Delivered {
  int orderMoney;
  int standardFee;
  int surCharge;
  int commission;
  int feeChangeAddressDelivery;
  int feeStorageCharges;
  int feeReturn;
  int totalFee;
}

class Delivering{
  int orderMoney;
  int standardFee;
  int surCharge;
  int commission;
  int feeChangeAddressDelivery;
  int feeStorageCharges;
  int feeReturn;
  int totalFee;
}
