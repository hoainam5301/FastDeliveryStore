import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:storedelivery/class/address.dart';
import 'package:storedelivery/class/deliveryMethod.dart';
import 'package:storedelivery/class/detailStatus.dart';
import 'package:storedelivery/class/staff.dart';
import 'package:storedelivery/class/store.dart';
part 'orders.g.dart';

@JsonSerializable(explicitToJson: true)
class Orders {
  String id;
  Store idStore;
  Staff idStaff;
  String orderName;
  String totalWeight;
  String orderMoney;
  String note;
  String standardFee;
  String surCharge;
  String commission;
  String receiverName;
  String receiverPhone;
  String receiverEmail;
  String totalFeeDelivery;
  Address receiverIDAddress;
  bool isUseCommission;
  String feeDelivery;
  String feeChangeAddressDelivery;
  String feeStorageCharges;
  String feeReturn;
  DeliveryMethod idDeliveryMethod;
  DetailStatus idPresentStatus;

  Orders({
    this.orderName,
    this.id,
    this.idStore,
    this.note,
    this.receiverName,
    this.receiverEmail,
    this.receiverPhone,
    this.receiverIDAddress,
    this.totalWeight,
    this.orderMoney,
    this.feeStorageCharges,
    this.feeChangeAddressDelivery,
    this.feeReturn,
    this.feeDelivery,
    this.surCharge,
    this.totalFeeDelivery,
    this.standardFee,
    this.commission,
    this.isUseCommission,
    this.idDeliveryMethod,
    this.idStaff,
    this.idPresentStatus,
  });

  factory Orders.fromJson(Map<String, dynamic> data) => _$OrdersFromJson(data);
  Map<String, dynamic> toJson() => _$OrdersToJson(this);
  Map<String, dynamic> toJsonUpdate() => _$OrdersToJsonUpdate(this);

  List<Orders> listAllOrder=[];
  List<DetailStatus> listAllStatusOrder=[];
  List<String> listNameAllOrders=[];


  Future<Orders> createOrder(Orders order) async {
    final String apiUrl = "http://52.142.43.138:3000/orders";
    print(order.toJson());
    var response = await http.post(apiUrl, body: order.toJson());

    print(response.statusCode);
    if (response.statusCode == 200) {
      //final String storeFrom = response.body;
      //print(jsonDecode(response.body)[""]);
      //print(jsonDecode(response.body[0])['id']);
      return Orders.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Store');
    }
  }

  Future<String> updateOrder(Orders order,String idOrder) async {
    final String apiUrl = "http://52.142.43.138:3000/orders/$idOrder";

    var response = await http.put(apiUrl,body: order.toJsonUpdate());
    //print(response.statusCode);
    if (response.statusCode == 200) {
      print(order.toJsonUpdate());
      return "Done";
    } else {
      throw Exception('Failed to update orders');
    }
  }

  Future<String> deleteOrder(String idOrder) async {
    final String apiUrl = "http://52.142.43.138:3000/orders/$idOrder";

    var response = await http.delete(apiUrl);
    //print(response.statusCode);
    if (response.statusCode == 200) {
      //print(order.toJsonUpdate());
      return "Done";
    } else {
      throw Exception('Failed to update orders');
    }
  }

  String standardFee1;
  String surCharge1;
  String commission1;
  String totalFeeDelivery1;

  Future<String> getFee(Orders orders) async{
    final String apiUrl="http://52.142.43.138:3000/orders/fee?idStore=${orders.idStore.id}&orderName=${orders.orderName}"
        "&receiverName=${orders.receiverName}"
        "&receiverIdAddress=${jsonEncode(orders.receiverIDAddress)}&receiverPhone=${orders.receiverPhone}"
        "&receiverEmail=${orders.receiverEmail}&orderMoney=${orders.orderMoney}&totalWeight=${orders.totalWeight}"
        "&note=${orders.note}&idDeliveryMethod=${orders.idDeliveryMethod.id}&isUseCommission=${orders.isUseCommission}"
        "&feeDelivery=${orders.feeDelivery}&feeChangeAddressDelivery=${orders.feeChangeAddressDelivery}"
        "&feeStorageCharges=${orders.feeStorageCharges}&feeReturn=${orders.feeReturn}";
    var response = await http.get(apiUrl);

    if(response.statusCode == 200)
      {
        var data=jsonDecode(response.body);
        print(data);
        print(data['totalFee']);
        standardFee1= (data['standardFee'].toString());
        surCharge1= (data['surCharge'].toString());
        commission1= (data['commission'].toString());
        totalFeeDelivery1= (data['totalFee'].toString());
        return (data['totalFee'].toString());
      }
  }

  Future<List<Orders>> getListOrders(String idStore)async{
    List<Orders> listOrders = [];
    final String apiUrl = "http://52.142.43.138:3000/stores/$idStore/orders";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      for (var _policy in data){
        listNameAllOrders.add(_policy["name"]);
        listOrders.add(Orders.fromJson(_policy));
        print(listOrders[0]);
      }
      listAllOrder=listOrders;
      return listOrders;
    }
  }

  Future<List<DetailStatus>> getListStatusOrder(String idOrder) async {
    List<DetailStatus> listDetailStatusOrders = [];
    final String apiUrl = "http://52.142.43.138:3000/orders/$idOrder/tracking";
    var response = await http.get(apiUrl);
    print(response.statusCode);
    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      //print(data);
      for (var _policy in data){
        //listNameAllOrders.add(_policy["name"]);
        listDetailStatusOrders.add(DetailStatus.fromJson(_policy));
      }
      listAllStatusOrder=listDetailStatusOrders;
      return listDetailStatusOrders;
    }
  }

}
