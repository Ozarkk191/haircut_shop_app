import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/constants/haircut_constants.dart';

class SearchAppBar extends PreferredSize {
  final BuildContext context;
  final VoidCallback navigatorCallback;
  final VoidCallback changeCallback;

  SearchAppBar({
    @required this.context,
    @required this.navigatorCallback,
    @required this.changeCallback,
    Key key,
    Widget title,
  })  : assert(context != null),
        assert(navigatorCallback != null),
        assert(changeCallback != null),
        super(
          key: key,
          preferredSize: Size.fromHeight(TOOL_BAR_HEIGHT),
          child: Container(
            height: TOOL_BAR_HEIGHT,
            child: AppBar(
              actions: <Widget>[
                Container(),
              ],
              backgroundColor: Theme.of(context).primaryColor,
              leading: Container(),
              elevation: 20,
              flexibleSpace: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: _buildTopAppbarItems(
                  context: context,
                  navigatorCallback: navigatorCallback,
                  changeCallback: changeCallback,
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
    VoidCallback navigatorCallback,
    final VoidCallback changeCallback,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              SizedBox(width: 10),
              Expanded(
                child: _buildSearchLocationTextField(
                  context: context,
                  callback: navigatorCallback,
                ),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/images/ic_listing.png'),
                    onPressed: navigatorCallback,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildSearchLocationTextField(
      {@required BuildContext context, VoidCallback callback}) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: <Widget>[
            Image.asset('assets/images/ic_marker_2.png'),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'ปักหมุดตำแหน่งใช้บริการ',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
