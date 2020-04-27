import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
import 'package:haircut_delivery_shop/src/base_components/constants/haircut_enum.dart';
import 'package:haircut_delivery_shop/src/base_components/constants/haircut_text.dart';
import 'package:haircut_delivery_shop/src/base_components/drawers/default_app_drawer.dart';
import 'package:haircut_delivery_shop/src/base_components/ui/curved_navigation_bar/curved_navigation_bar.dart';
import 'package:haircut_delivery_shop/src/base_components/util/ui_util.dart';
import 'package:haircut_delivery_shop/src/pages/account/home_account_page.dart';
import 'package:haircut_delivery_shop/src/pages/dashboard/dashboard_page.dart';
import 'package:haircut_delivery_shop/src/pages/marketplace/marketplace_page.dart';
import 'package:haircut_delivery_shop/src/pages/promotion/promotion_page.dart';
import 'package:haircut_delivery_shop/src/pages/wallet/wallet_report_page.dart';

class HomeLayout extends StatefulWidget {
  final HomeLayoutPage page;

  HomeLayout({this.page = HomeLayoutPage.DASHBOARD, Key key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // Global key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Const
  final List<Widget> menuIcons = [
    ImageIcon(AssetImage('assets/images/ic_listing.png')),
    ImageIcon(AssetImage('assets/images/ic_promotion.png')),
    ImageIcon(AssetImage('assets/images/ic_wallet.png')),
    ImageIcon(AssetImage('assets/images/ic_marketplace.png')),
    ImageIcon(AssetImage('assets/images/ic_account.png')),
  ];

  // Controller
  PageController _pageController;

  // Data
  var _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = _getPageIndex(widget.page);
    _pageController = PageController(initialPage: _currentPage, keepPage: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleOnTapBottomNav(int index) {
    setState(() {
      _currentPage = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    UiUtil.changeStatusColor(HaircutColors.STATUS_BAR_COLOR);

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DefaultAppDrawer(),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          children: <Widget>[
            DashboardPage(scaffoldKey: _scaffoldKey),
            PromotionPage(),
            WalletReportPage(),
            MarketPlacePage(),
            AccountPage(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: HaircutColors.PRIMARY_COLOR,
        activeColor: HaircutColors.PRIMARY_COLOR,
        inactiveColor: HaircutColors.PRIMARY_FONT,
        items: menuIcons,
        labels: _buildMenuLabels(context),
        index: _currentPage,
        onTap: _handleOnTapBottomNav,
      ),
    );
  }

  // Center _buildDemoContent({@required String pageName}) {
  //   return Center(
  //     child: Text(
  //       '$pageName',
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 40,
  //       ),
  //     ),
  //   );
  // }

  List<String> _buildMenuLabels(BuildContext context) {
    return [
      NAV_DASHBOARD,
      NAV_PROMOTION,
      NAV_WALLET_REPORT,
      NAV_MARKETPLACE,
      NAV_ACCOUNT,
    ];
  }

  /// Returns page index of [page].
  int _getPageIndex(HomeLayoutPage page) {
    switch (page) {
      case HomeLayoutPage.DASHBOARD:
        return 0;
      case HomeLayoutPage.PROMOTION:
        return 1;
      case HomeLayoutPage.WALLET_REPORT:
        return 2;
      case HomeLayoutPage.MARKETPLACE:
        return 3;
      case HomeLayoutPage.ACCOUNT:
        return 4;
      default:
        return 0;
    }
  }
}
