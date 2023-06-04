import 'package:flutter/material.dart';
import 'package:tasker/notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(color: Colors.indigo.shade900)),
      home: MyHomePage(title: 'Flutter Local Notifications'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NotificationService _notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('Show Notification'),
                    onPressed: () async {
                      await _notificationService.showNotifications();
                    },
                  ),
                  SizedBox(height: 3),
                  ElevatedButton(
                    child: Text('Schedule Notification'),
                    onPressed: () async {
                      await _notificationService.scheduleNotifications();
                    },
                  ),
                  SizedBox(height: 3),
                  ElevatedButton(
                    child: Text('Cancel Notification'),
                    onPressed: () async {
                      await _notificationService.cancelNotifications(0);
                    },
                  ),
                  SizedBox(height: 3),
                  ElevatedButton(
                    child: Text('Cancel All Notifications'),
                    onPressed: () async {
                      await _notificationService.cancelAllNotifications();
                    },
                  ),
                  SizedBox(height: 3),
                ],
              ),
            )));
  }
}
