import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:get/get.dart';
import 'package:storedelivery/class/store.dart';

class StoreControllers extends GetxController{
  Store storeUser ;

  Future<String> loginStoreAccount(String email,String password)async{
    final String apiUrl = "http://52.142.43.138:3000/stores/login/?password=$password&email=$email";
    var response = await https.get(apiUrl);

    if(response.statusCode==200 || response.statusCode==201)
    {
      var data = jsonDecode(response.body);
      //print("toi dayyyyyyy");
      var a = Store.fromJson(jsonDecode(response.body));
      print(a);
      storeUser=Store.fromJson(data);
      print(storeUser.name);
      print(storeUser.idAddress.id);
      return "Logged in successfully";
    }
    else
      {
        return response.body;
      }

  }

  Future<String> updateStore(String idStore) async {
    final String apiUrl = "http://52.142.43.138:3000/stores/$idStore";
    var response = await https.put(apiUrl, body: storeUser.toUpdateJson() );

    if(response.statusCode==201 || response.statusCode==200) {
      var data = jsonDecode(response.body);
      //print(response.body);
      //storeUser=Store.fromJson(data);
      return "Update successfully";
    }
    else {

      return response.body;
    }
  }

}