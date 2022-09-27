import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_notif/notification_control.dart';
import 'package:local_notif/page.dart';
import 'notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotifControll controller = Get.put(NotifControll());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var service = LocalNotificationService();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      LocalNotificationService().showNotification(
                          id: 0, title: "title", body: "long body");
                    },
                    child: Text("Show Normal Notification")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      LocalNotificationService().showNotificationWithPayload(
                          id: 0,
                          title: 'Snackbar Action',
                          body: 'You wanna some snackbar?',
                          payload: 'its get snackbar');
                    },
                    child: Text("Custom Notification")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      LocalNotificationService().showNotificationWithPayload(
                          id: 0,
                          title: 'Notification Route',
                          body: 'Its forward to other page',
                          payload: 'test');
                    },
                    child: Text("Routing Notification")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNoticationListener);

  void onNoticationListener(String? payload) {
    print('payload from main $payload');
  }
}
