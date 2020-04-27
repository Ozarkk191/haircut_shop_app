import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/big_round_button.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/base_components/switches/green_switch.dart';

class DefaultAppDrawer extends StatefulWidget {
  final Color bgColor;

  const DefaultAppDrawer({Key key, this.bgColor = HaircutColors.PRIMARY_COLOR})
      : super(key: key);

  @override
  _DefaultAppDrawerState createState() => _DefaultAppDrawerState();
}

class _DefaultAppDrawerState extends State<DefaultAppDrawer> {
  bool _isSwitched = false;

  void _handleChangeLanguageSwitcher(bool value) {
    setState(() {
      _isSwitched = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: widget.bgColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 25),
                  _buildCoinListTile(),
                  _buildDrawerDefaultListTile(
                    callback: () {},
                    title: 'นโยบายการใช้งาน',
                  ),
                  _buildDrawerDefaultListTile(
                    callback: () {},
                    title: 'ข้อตกลงการใช้งาน',
                  ),
                  _buildDrawerDefaultListTile(
                    callback: () {},
                    title: 'ติดต่อ',
                  ),
                  _buildLanguageListTile(),
                ],
              ),
            ),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Version 0.01',
                          style: TextStyle(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
                            width: double.infinity,
                            child: BigRoundButton(
                              backgroundColor: Colors.white,
                              textColor: HaircutColors.PRIMARY_COLOR,
                              callback: () {},
                              title: 'ออกจากระบบ',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildLanguageListTile() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'ภาษา',
            style: _drawerTextStyle(),
          ),
          Row(
            children: <Widget>[
              Text(
                'ไทย',
                style: _drawerTextStyle(),
              ),
              GreenSwitch(
                onChanged: (_isSwitched) =>
                    _handleChangeLanguageSwitcher(_isSwitched),
                value: _isSwitched,
              ),
              Text(
                'อังกฤษ',
                style: _drawerTextStyle(),
              ),
            ],
          ),
        ],
      ),
      onTap: () {},
    );
  }

  ListTile _buildCoinListTile() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'คะแนน',
            style: _drawerTextStyle(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset('assets/images/ic_bluecoin.png'),
                  SizedBox(width: 5),
                  Text(
                    '99,9999',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Text(
                'Collected in exchange for coupon',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
      onTap: () {},
    );
  }

  Widget _buildDrawerDefaultListTile({
    @required String title,
    @required VoidCallback callback,
  }) {
    return ListTile(
      title: Text(
        title,
        style: _drawerTextStyle(),
      ),
      onTap: callback,
    );
  }

  TextStyle _drawerTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w300,
    );
  }
}
