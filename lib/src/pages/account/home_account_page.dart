import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/pages/account/editprofile/edit_open_time.dart';
import 'package:haircut_delivery_shop/src/pages/account/editprofile/edit_outside.dart';
import 'package:haircut_delivery_shop/src/pages/account/editprofile/edit_service.dart';
import 'package:haircut_delivery_shop/src/pages/account/editprofile/view_profile.dart';
import 'package:haircut_delivery_shop/src/pages/account/item_listview/detail_service.dart';
import 'package:haircut_delivery_shop/src/pages/account/item_listview/item.dart';
import 'package:haircut_delivery_shop/src/pages/history/history_page.dart';

import '../../base_components/appbars/custom_appbar.dart';
import '../../base_components/buttons/dialog_button.dart';
import '../../base_components/buttons/round_width_height_button.dart';
import '../../base_components/colors/haircut_colors.dart';
import '../../base_components/constants/haircut_constants.dart';
import '../../base_components/switches/green_switch.dart';
import 'item_listview/detail_service.dart';

class AccountPage extends StatelessWidget {
  final List<String> items = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  final List<String> itemsKm = [
    'ค่าเดินทาง 0 - 3 km',
    'ค่าเดินทาง 3.1 - 5 km',
    'ค่าเดินทาง 5.1 - 10 km',
    'ค่าเดินทาง 10.1 - 20 km',
    'ค่าเดินทาง 20 km +',
  ];
  final List<String> itemsHead = [
    'ตัดผมชาย',
    'ตัดผมหญิง',
    'ทำเล็บ',
  ];

  final List<String> itemsSubHead = [
    'รองทรง',
    'ทำสีผม',
    'ทาสีเล็บ',
  ];
  final List<String> itemsPrice = [
    '100',
    '300',
    '60',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Stack(
                      children: <Widget>[
                        profileColumnLeft(context),
                        profileColumnCenter(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HistoryPage()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            alignment: Alignment.topRight,
                            child: Image.asset(
                                'assets/images/ic_history_shop.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsetsDirectional.only(top: 20),
                          width: MediaQuery.of(context).size.width,
                          color: HaircutColors.PRIMARY_COLOR,
                          child: Column(
                            children: <Widget>[
                              headerContainer(
                                  context, 'Open Time', Colors.white, () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditOpenTime()));
                              }),
                              openTimeContainer(
                                  items, '10.00-20.00', Colors.white),
                            ],
                          ),
                        ),
                        statusContainer(context),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        headerContainer(
                            context, 'Service', HaircutColors.PRIMARY_COLOR,
                            () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditService()));
                        }),
                        ServiceItem(
                          headText: 'ตัดผมชาย',
                          leftText: 'โกนหัว',
                          rightText: '฿50',
                          count: 5,
                        ),
                        ServiceItem(
                          headText: 'ตัดผมหญิง',
                          leftText: 'โกนหัว',
                          rightText: '฿80',
                          count: 5,
                        ),
                        ServiceItem(
                          headText: 'ทำเล็บ',
                          leftText: 'ทาสีเล็บ',
                          rightText: '฿100',
                          count: 5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 1,
                    color: Colors.red,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        headerContainer(context, 'การในบริการนอกสถานที่',
                            HaircutColors.PRIMARY_COLOR, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditOutside()));
                        }),
                        openTimeContainer(itemsKm, '0', Colors.red),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomAppbar(
            title: 'Account',
            callback: () {},
            height: TOOL_BAR_HEIGHT,
          )
        ],
      ),
    );
  }

  Container openTimeContainer(List item, String entText, Color color) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 10, bottom: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ItemListView(
            title: item[index],
            time: '10.00 - 20.00',
            color: color,
          );
        },
        itemCount: item.length,
      ),
    );
  }

  Container headerContainer(
      BuildContext context, String text, Color color, Function callback) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 30, start: 20, end: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$text',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          DialogButton(
            title: 'แก้ไข',
            callback: callback,
          ),
        ],
      ),
    );
  }

  Widget statusContainer(BuildContext context) {
    return Card(
      margin: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      color: HaircutColors.PRIMARY_COLOR,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: <Widget>[
            Container(
              height: 40,
              alignment: Alignment.centerLeft,
              margin: EdgeInsetsDirectional.only(start: 20),
              child: Text(
                'Status',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(end: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Open',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  GreenSwitch(value: false, onChanged: (value) {}),
                  Text(
                    'Close',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileColumnCenter() {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 40),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Shop name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Firstname Lastname',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            'Phone : 089-889-8808',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            'Email :  Email@gmail.com',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget profileColumnLeft(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 30),
      child: Column(
        children: <Widget>[
          Container(
            width: 75,
            height: 75,
            padding: EdgeInsets.all(5),
            decoration: new BoxDecoration(
              color: Color(0xff444444),
              borderRadius: new BorderRadius.all(Radius.circular(50.0)),
            ),
            child: Image.asset(
              'assets/images/profile.png',
              width: 80,
              height: 80,
            ),
          ),
          RoundWidthHeightButton(
            title: 'Edit Profile',
            callback: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ViewProfile()));
            },
            height: 20,
            width: 80,
            fontSize: 8,
            radius: 10,
            backgroundColor: Color(0xff444444),
            textColor: Colors.white,
            marginTop: 5,
          ),
        ],
      ),
    );
  }
}
