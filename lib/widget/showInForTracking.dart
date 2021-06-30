import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:storedelivery/class/detailStatus.dart';
import 'package:storedelivery/class/orders.dart';
import 'package:storedelivery/widget/contans.dart';

class TrackingInfo extends StatelessWidget {
  //const TrackingInfo({Key? key}) : super(key: key);
  DetailStatus detailStatus;
  Orders orders;
  TrackingInfo({this.detailStatus,this.orders});

  @override
  Widget build(BuildContext context) {
    var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(detailStatus.datetime, true);
    var dateLocal = dateTime.toLocal();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
      height: 120,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset("assets/images/bill.png",width: 25,height: 25,),
          ),
          SizedBox(width: 12,),
          Container(
            width: 270,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6,),
                Text("${dateLocal.hour}:${dateLocal.minute} ${dateLocal.day}-${dateLocal.month}-${dateLocal.year}",style:TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Roboto Slab',
                    fontWeight: FontWeight.w800,
                    color: Color(0xff1EC8C8),
                    fontStyle: FontStyle.normal,
                    decoration: TextDecoration.none
                ),),
                Text("Name status: ${detailStatus.idStatus.name}",style: Contanst.informationText,),
                Text("Note: ${detailStatus.idStatus.note}",style: Contanst.informationText,),
                Divider(color: Colors.black,thickness: 1,)
              ],
            ),
          ),


        ],
      ),
    );
  }
}