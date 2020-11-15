import 'dart:async';

import 'package:flutter/material.dart';
import 'package:m2p_test/dashboard.dart';
import 'package:m2p_test/dismissible.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final navigator = GlobalKey<NavigatorState>();


  @override
  void initState() {
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  showSplash() {
    return Scaffold(body: SplashView());
  }

  Widget SplashView() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/client.png"),
          SizedBox(
            height: 20,
          ),
          Text(
            "Client Name",
            style: TextStyle(
                fontFamily: "Ubuntu", color: Color(0xff003A63), fontSize: 18),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator,
      routes: <String, WidgetBuilder>{
        DashboardScreen.ROUTE: (BuildContext context) => DashboardScreen()
      },
      home: showSplash(),
    );
  }

  route() {
    // navigator.currentState.push(MaterialPageRoute(builder: (context) => ScrollPage()),
    // );
    navigator.currentState.pushNamedAndRemoveUntil(
        DashboardScreen.ROUTE, ModalRoute.withName(DashboardScreen.ROUTE));
  }
}
