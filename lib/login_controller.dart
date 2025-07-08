import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{
  var datalist=[].obs;
  var isLoading = false.obs;

  Future<void> fetchPost(String email, String password) async {
    isLoading.value=true;
    var url= Uri.parse("https://reqres.in/api/login");
    var body=jsonEncode({
      "email":email,
      "password":password

    });

    try{
var response= await http.post(
  url,
  body: body,
  headers: {"Content-Type": "application/json","x-api-key":" reqres-free-v1"},

);
if(response.statusCode==200){
  var parse=jsonDecode(response.body);
  Get.snackbar("Login", 'Login is Successful');
print(parse);
}else{
  Get.snackbar('Error', 'Something went wrong');
}
    }catch(e){
      Get.snackbar('Error', 'Something went wrong catch');
    }finally{
      isLoading.value=false;
    }
  }

}