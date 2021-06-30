import 'package:flutter/material.dart';
import 'package:storedelivery/widget/contans.dart';


class EditInfo extends StatelessWidget {
  final String titleInfor;
  final String infomation;
  final Function(String) onChange;


  EditInfo({this.infomation,this.titleInfor,this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 0.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(titleInfor,style: Contanst.titleInfor,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 0.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: TextEditingController()..text=infomation,
                  style: Contanst.headingText,
                  onChanged:onChange ,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
