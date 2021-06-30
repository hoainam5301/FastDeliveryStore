import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/orders.dart';
import 'package:storedelivery/controllers/store_controllers.dart';
import 'package:storedelivery/screens/addOrders/create_OrdersGeneral.dart';
import 'package:storedelivery/tabs/cashFlow.dart';
import 'package:storedelivery/tabs/listOrders.dart';
import 'package:storedelivery/tabs/policy.dart';
import 'package:storedelivery/tabs/profile.dart';
import 'package:storedelivery/widget/home_tabButton.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);
  StoreControllers userStore = Get.find<StoreControllers>();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _tabController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: PageView(
            controller: _tabController,
            onPageChanged: (num) {
              setState(() {
                _selectedTab = num;
              });
            },
            children: [
              ListOrder(),
              CashFlow(),
              Policy(),
              Profile(),
            ],
          )),
          BottomTabButton(
            selectTab: _selectedTab,
            tabPressed: (num) {
              _tabController.animateToPage(num,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic);
            },
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: FloatingActionButton(
          backgroundColor: Color(0xff1EC8C8),
          child: Icon(
            Icons.add,
            size: 48.0,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateOrderGeneral()));
            Get.put(Orders());
          },
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
