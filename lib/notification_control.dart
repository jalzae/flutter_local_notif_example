import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_notif/notification_service.dart';
import 'package:local_notif/page.dart';

class NotifControll extends GetxController {
  var service = LocalNotificationService();
  @override
  void onInit() async {
    print("start listening");
    var service = LocalNotificationService();
    service.intialize();
    super.onInit();
  }

 
}
