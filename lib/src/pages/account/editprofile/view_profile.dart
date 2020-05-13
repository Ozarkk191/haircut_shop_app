import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/models/address_model.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/custom_appbar.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/base_components/textfields/big_round_textfield.dart';
import 'package:haircut_delivery_shop/src/pages/account/editprofile/edit_account.dart';
import 'package:haircut_delivery_shop/src/pages/account/editprofile/edit_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  String _shopName = 'Shop name';
  String _firstName = 'Fristname';
  String _lastName = 'Lastname';
  String _address = 'Address';

  _loadSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('address') ?? '';
    if (data != '') {
      var body = json.decode(data);
      AddressModel address = AddressModel.fromJson(json.decode(body));

      print('${address.firstname}');

      setState(() {
        _shopName = address.shopname;
        _firstName = address.firstname;
        _lastName = address.lastname;
        _address = address.address;
      });
    }
  }

  @override
  void initState() {
    _loadSharedPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: <Widget>[
              CustomAppbar(
                callback: () {
                  Navigator.pop(context);
                },
                title: 'View Profile',
              ),
              imageProfileContainer(),
              editProfileContainer(context, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              }),
              Container(
                height: 250,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: <Widget>[
                    buildContainer(),
                    buildContainer(),
                    buildContainer(),
                    buildContainer(),
                    buildContainer(),
                  ],
                ),
              ),
              BigRoundTextField(
                hintText: _shopName,
                marginTop: 10,
                enabled: false,
              ),
              BigRoundTextField(
                hintText: _firstName,
                marginTop: 10,
                enabled: false,
              ),
              BigRoundTextField(
                hintText: _lastName,
                marginTop: 10,
                enabled: false,
              ),
              BigRoundTextField(
                hintText: _address,
                marginTop: 10,
                enabled: false,
                maxLines: 4,
              ),
              SizedBox(height: 20),
              editProfileContainer(context, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditAccount()));
              }),
              BigRoundTextField(
                hintText: 'เบอร์โทร',
                marginTop: 20,
                enabled: false,
              ),
              BigRoundTextField(
                hintText: 'Email',
                marginTop: 10,
                enabled: false,
              ),
              BigRoundTextField(
                hintText: 'password',
                marginTop: 10,
                enabled: false,
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer() {
    return Container(
      width: 100,
      height: 100,
      child: Image.network(
        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/how-to-watch-all-the-marvel-movies-in-order-thor-ragnarok-1568309518.jpg?crop=0.423xw:1.00xh;0.119xw,0&resize=640:*',
        fit: BoxFit.fill,
      ),
    );
  }

  Container editProfileContainer(BuildContext context, Function callback) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, top: 10),
      height: 40,
      child: Stack(
        children: <Widget>[
          Container(
            child: TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: 'ข้อมูลผู้ใช้',
              ),
            ),
          ),
          InkWell(
            onTap: callback,
            child: Container(
              alignment: Alignment.centerRight,
              child: Image.asset('assets/images/ic_edit.png'),
            ),
          )
        ],
      ),
    );
  }

  Container imageProfileContainer() {
    return Container(
      width: 150,
      height: 150,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(5),
      decoration: new BoxDecoration(
        color: Color(0xff444444),
        borderRadius: new BorderRadius.all(Radius.circular(100.0)),
      ),
      child: Image.asset(
        'assets/images/profile.png',
        width: 80,
        height: 80,
      ),
    );
  }

  Container appBarCustom(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: new BoxDecoration(
        color: HaircutColors.PRIMARY_COLOR,
        borderRadius: new BorderRadius.only(
          bottomLeft: const Radius.circular(20.0),
          bottomRight: const Radius.circular(20.0),
        ),
      ),
      child: Center(
        child: Stack(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Image.asset('assets/images/ic_back.png'),
              ),
            ),
            Center(
              child: Text(
                'Account',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
