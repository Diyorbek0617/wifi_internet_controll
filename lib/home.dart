import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:wifi_internet_controll/shows.dart';
import 'package:wifi_internet_controll/utills.dart';

class Home extends StatefulWidget {
  final String title;
  final Color color;
  const Home({required this.title,required this.color});
  static const String id="Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: widget.color,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            final result=await Connectivity().checkConnectivity();
            showConnetivitySnackBar(result);
          },
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(12)),
          child: const Text("Check Connection",style: TextStyle(fontSize: 20.0),),
        ),
      ),
    );
  }

  void showConnetivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet?"You have again ${result.toString()}":
        "You have no Internet";
    final color = hasInternet?Colors.blue:Colors.red;
    Utils.showTopSnackBar(context, message, color);
    fireToast(context,"by Nizomiddinov",color);
  }
}
