import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storedelivery/class/commission.dart';
import 'package:storedelivery/widget/contans.dart';

class ShowInformationCommission extends StatelessWidget {
  //const ShowInformationOrder({Key key}) : super(key: key);
  final Commission commission;

  ShowInformationCommission({this.commission});

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
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:12.0 ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffA1A1A1),
                    width: 1
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  commission.ratioCommission,
                  style: Contanst.textInCircle,
                )),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                      child: Container(
                          child: Text(commission.name,
                            style: Contanst.regularText,
                            textAlign: TextAlign.left,
                          )
                      )
                ),
                Container(
                  width: 288,
                  height: 80,
                    child: Text(commission.note,
                      style: Contanst.informationOrders,
                      textAlign: TextAlign.left,
                      maxLines: 100,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
