import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/base_components/constants/haircut_constants.dart';

class DefaultAppBar extends PreferredSize {
  final BuildContext context;
  final bool isBack;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback onPressedBackBtn;
  final VoidCallback onPressedCartBtn;
  final String appbarTitle;

  DefaultAppBar({
    @required this.context,
    this.isBack = false,
    this.onPressedBackBtn,
    this.onPressedCartBtn,
    Key key,
    Widget title,
    bool isShowCart = true,
    @required this.appbarTitle,
    this.scaffoldKey,
  })  : assert(context != null),
        assert(appbarTitle != null),
        super(
          key: key,
          preferredSize: Size.fromHeight(TOOL_BAR_HEIGHT),
          child: Container(
            height: TOOL_BAR_HEIGHT,
            child: AppBar(
              actions: <Widget>[
                Container(),
              ],
              backgroundColor: HaircutColors.PRIMARY_COLOR,
              leading: Container(),
              elevation: 20,
              flexibleSpace: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _buildTopAppbarItems(
                  context: context,
                  isShowCart: isShowCart,
                  scaffoldKey: scaffoldKey,
                  isBack: isBack,
                  onPressedBackBtn: onPressedBackBtn,
                  appbarTitle: appbarTitle,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(APPBAR_ROUND_CORNER),
                  bottomRight: Radius.circular(APPBAR_ROUND_CORNER),
                ),
              ),
            ),
          ),
        );

  static Widget _buildTopAppbarItems({
    @required BuildContext context,
    bool isShowCart,
    bool isBack = false,
    GlobalKey<ScaffoldState> scaffoldKey,
    VoidCallback onPressedBackBtn,
    VoidCallback onPressedCartBtn,
    @required String appbarTitle,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: [
          Opacity(
            opacity: isBack ? 1 : 0,
            child: IconButton(
              icon: Image.asset('assets/images/ic_back.png'),
              onPressed: onPressedBackBtn,
            ),
          ),
          Opacity(
            opacity: 0,
            child: IconButton(
              icon: Image.asset('assets/images/ic_hamburger.png'),
              onPressed: null,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                appbarTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Badge(
                position: BadgePosition.topRight(top: 0, right: 3),
                badgeColor: Colors.yellow,
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                showBadge: true,
                padding: EdgeInsets.all(2),
                badgeContent: Text(
                  '20',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
                child: IconButton(
                  icon: Image.asset('assets/images/ic_cart.png'),
                  onPressed: onPressedCartBtn,
                ),
              ),
              Badge(
                position: BadgePosition.topRight(top: 0, right: 3),
                badgeColor: Colors.yellow,
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                showBadge: true,
                padding: EdgeInsets.all(2),
                badgeContent: Text(
                  '10',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
                child: IconButton(
                  icon: Image.asset('assets/images/ic_hamburger.png'),
                  onPressed: () => scaffoldKey.currentState.openEndDrawer(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
