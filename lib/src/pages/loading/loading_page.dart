import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/pages/Login/login_page.dart';
import '../../base_components/colors/haircut_colors.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HaircutColors.PRIMARY_COLOR,
      body: Center(
        child: Image.asset('assets/images/logo_white.png'),
      ),
    );
  }
}
