import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/default_appbar.dart';
import 'package:haircut_delivery_shop/src/base_components/constants/haircut_constants.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  HomePage({@required this.scaffoldKey, Key key})
      : assert(scaffoldKey != null),
        super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  bool get wantKeepAlive => true;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(children: <Widget>[
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 40), // top margin. do not remove
            Container(
              height: 800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Page With Nav Child'),
                  RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Back'),
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
