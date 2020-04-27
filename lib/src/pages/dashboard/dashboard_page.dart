import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/default_appbar.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/wallet_appbar.dart';
import 'package:haircut_delivery_shop/src/base_components/constants/haircut_constants.dart';
import 'package:haircut_delivery_shop/src/base_components/group_items/tab_button_group.dart';

import 'package:haircut_delivery_shop/src/pages/dashboard/itemdashboard/item_expansiontile.dart';

class DashboardPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  DashboardPage({@required this.scaffoldKey, Key key})
      : assert(scaffoldKey != null),
        super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with AutomaticKeepAliveClientMixin<DashboardPage> {
  @override
  bool get wantKeepAlive => true;
  bool value = false;
  DateTime startDate = DateTime.now().subtract(Duration(days: 90));
  DateTime endDate = DateTime.now().add(Duration(days: 90));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 90));

  ScrollController _scrollController = ScrollController();

  final List<String> listTimes = [
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
  ];

  @override
  void initState() {
    super.initState();
    // print('tag_date_time $start');
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  onSelect(data) {
    print("Selected Date -> $data");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(children: <Widget>[
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  WalletAppbar(
                      totalWallet: 4500,
                      todayIncome: 500,
                      weekIncome: 1000,
                      monthIncome: 3000),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 110,
                    child: CalendarStrip(
                      startDate: startDate,
                      endDate: endDate,
                      onDateSelected: onSelect,
                      iconColor: Colors.red,
                      addSwipeGesture: true,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TabButtonGroup(
                      title1: 'ไปหาลูกค้า',
                      title2: 'ลูกค้ามาหา',
                    ),
                  ),
                  Container(
                    height: 400,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return ItemExpansion(
                            value: false, time: listTimes[index]);
                      },
                      itemCount: listTimes.length,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        height: TOOL_BAR_HEIGHT,
        child: DefaultAppBar(
          appbarTitle: 'Dashboard',
          context: context,
          scaffoldKey: widget.scaffoldKey,
        ),
      ),
    ]);
  }
}
