import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Notification',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  void initState(){
    super.initState();  
      flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
      var android = AndroidInitializationSettings("@mipmap/launch_image");
      var ios     = IOSInitializationSettings();
      var initSettings = new InitializationSettings(android,ios);
      FlutterLocalNotificationsPlugin().initialize(initSettings);
  }
 
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
       
  title: Text("App Notification")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          //  RaisedButton(
          //    onPressed: marcarnotificacao ,
          //    child: Text("Marcar sua Notificação"),
          //  ),
           RaisedButton(
             child: Text("Demonstrar notificação"),
             onPressed:  
              demonstrarnotificacao,
           ),
          ],
        ),
      ),
    );
  }
    // marcarnotificacao() async {
    //   var time = new Time(14, 0, 0);
    //   var android   = new AndroidNotificationDetails('repeatDailyAtTime channel id','repeatDailyAtTime channel name', 'repeatDailyAtTime description');
    //   var iOS       = new IOSNotificationDetails();
    //   var platforma = new NotificationDetails(android, iOS);
    //   await flutterLocalNotificationsPlugin.showDailyAtTime(
    //       0,
    //       'Sua notificação diária',
    //       'para lembrar de se exercitar, hidratar e cuidar da saúde mental também!!'+ 'são ' + '${time.hour}' + '${time.minute}',
    //       time,
    //       platforma); 
    //       }
    demonstrarnotificacao() async {
       var android   = new AndroidNotificationDetails('repeatDailyAtTime channel id','repeatDailyAtTime channel name', 'repeatDailyAtTime description');
      var iOS       = new IOSNotificationDetails();
      var platforma = new NotificationDetails(android, iOS);
      await flutterLocalNotificationsPlugin.show(
          0,
          'Sua notificação diária',
          'para lembrar de se exercitar, hidratar e cuidar da saúde mental também!! ',
          platforma); 

    }
}