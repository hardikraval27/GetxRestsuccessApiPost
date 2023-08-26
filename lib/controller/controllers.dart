import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/model_postsc.dart';

class HomeController extends GetxController {
  var postMap = mypostsuccess().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchpost();
  }

  Future<void> fetchpost() async {
    isLoading.value = true;
    Map body = {
      "email": "eve.holt@reqres.in",
      "password": "pistol",
    };
    final response = await http
        .post(Uri.parse('https://reqres.in/api/register'), body: body);
    final resonsed = jsonDecode(response.body);

    if (response.statusCode == 200) {
      postMap.value = mypostsuccess.fromJson(resonsed);
      isLoading.value = false;
      update();
    } else {
      Get.snackbar("title", "message");
    }
  }
}
