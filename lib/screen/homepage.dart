import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:restsuccesspost/controller/controllers.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: controller.isLoading.value
                ? CircularProgressIndicator()
                : Card(
                    child: Container(
                      color: Colors.deepOrange,
                      child: ListTile(
                        title: Text("ID:${controller.postMap.value.id}"),
                        subtitle:
                            Text("TOKEN:${controller.postMap.value.token}"),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
