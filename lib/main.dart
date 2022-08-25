import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:wifi_internet_controll/home.dart';

void main() {
   WidgetsFlutterBinding?.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static  String title=" Internet";
  static Color color=Colors.blue;
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WiFi & Internet controll',
        home: Home(title: title,color: color,),
        routes: {
          Home.id:(context)=> Home(title:title,color: color,),
        },
      ),
    );
  }
}
