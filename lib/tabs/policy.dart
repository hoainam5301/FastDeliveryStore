import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storedelivery/class/commission.dart';
import 'package:storedelivery/controllers/store_controllers.dart';
import 'package:storedelivery/widget/contans.dart';
import 'package:storedelivery/widget/showInFormationCommission.dart';

class Policy extends StatelessWidget {
 //const Policy({Key key}) : super(key: key);
  Commission _commission = Get.find<Commission>();
  StoreControllers userStore = Get.find<StoreControllers>();

  List<Widget> buildCommission() {
    List<Widget> listinfo = [];
    _commission.listAllCommission.forEach((element) { 
      listinfo.add(ShowInformationCommission(
        commission: element,
      ));
    });
    return listinfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(220.0),
        child: AppBar(
          backgroundColor: Color(0xff1EC8C8),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Center(child: const Text("Commission Policy",style: Contanst.titleAppBar,)),
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(200),
                      ),
                      color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                            userStore.storeUser.idCommission.ratioCommission,
                            style: Contanst.textInCirclePolicy,
                          )),
                    ),
                  )
                ),
                Center(child: Text(userStore.storeUser.idCommission.name,style: Contanst.inbuttonTextFB,),)
              ],
            ),
          ),
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: buildCommission(),
          ),
        ),
      ),
    );
  }
}
