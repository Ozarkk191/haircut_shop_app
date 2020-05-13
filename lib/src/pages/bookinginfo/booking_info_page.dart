import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/cards/card_coupon.dart';
import 'package:haircut_delivery_shop/src/pages/bookinginfo/cancelbooking/cancel_booking.dart';
import 'package:haircut_delivery_shop/src/pages/bookinginfo/itembooking/item_booking_service.dart';

import '../../base_components/appbars/custom_appbar.dart';
import '../../base_components/buttons/round_width_height_button.dart';
import '../../base_components/colors/haircut_colors.dart';

class BookingInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              width: _getWidth(context),
              child: Column(
                children: <Widget>[
                  header(context),
                  Container(
                    width: _getWidth(context),
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      tr('booking_your_service'),
                      style: TextStyle(
                        fontSize: 16,
                        color: HaircutColors.PRIMARY_COLOR,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return ItemBookingService(
                            title: 'Service Name', price: '200');
                      },
                      itemCount: 3,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    width: _getWidth(context),
                    child: Text(
                      tr('client_app_booking_time'),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: HaircutColors.PRIMARY_COLOR),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      dateTime(tr('client_app_date'), '11 March 2020'),
                      dateTime(tr('client_app_time'), '10:00'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: _getWidth(context),
                    height: 5,
                    color: Colors.grey[400],
                  ),
                  Container(
                    width: _getWidth(context),
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      tr('add_my_place_coupons'),
                      style: TextStyle(
                        fontSize: 16,
                        color: HaircutColors.PRIMARY_COLOR,
                      ),
                    ),
                  ),
                  CardCoupon(
                    couponImageUrl:
                        'https://promotions.co.th/wp-content/uploads/2018/11/central11.11-2.jpg',
                    couponTitle: 'ส่วนลด',
                    couponContent: 'ยกเว้นบริการที่มีโปรโมชั่น',
                    couponPrice: 10,
                  ),
                  // CouponCard(
                  //   couponImageUrl:
                  //       'https://promotions.co.th/wp-content/uploads/2018/11/central11.11-2.jpg',
                  //   couponTitle: 'ส่วนลด',
                  //   couponContent: 'ยกเว้นบริการที่มีโปรโมชั่น',
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: _getWidth(context),
                    height: 5,
                    color: Colors.grey[400],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    width: _getWidth(context),
                    child: Text(
                      tr('client_app_total_price'),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: HaircutColors.PRIMARY_COLOR),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              tr('account_service'),
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '฿450',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              tr('client_app_onsite_Charge'),
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '฿100',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                tr('client_app_discount'),
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                '-฿270',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                tr('client_app_total'),
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                '฿280',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: HaircutColors.PRIMARY_COLOR,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RoundWidthHeightButton(
                          title: tr('delivery_go'),
                          callback: () {},
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 40,
                          textColor: Colors.white,
                          backgroundColor: Color(0xff009900),
                          marginTop: 10,
                        ),
                        RoundWidthHeightButton(
                          title: tr('booking_canael'),
                          callback: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CancelBooking()));
                          },
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 40,
                          textColor: Colors.white,
                          backgroundColor: HaircutColors.DARK_GREY_BUTTON,
                          marginTop: 10,
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomAppbar(
              title: 'Delivery',
              callback: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

  Container dateTime(String title, String dateTime) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$title',
            style: TextStyle(color: HaircutColors.PRIMARY_COLOR),
          ),
          Text(
            '$dateTime',
            style: TextStyle(
              color: HaircutColors.PRIMARY_COLOR,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Container header(BuildContext context) {
    return Container(
      width: _getWidth(context),
      height: 280,
      padding: EdgeInsets.all(20),
      decoration: new BoxDecoration(
        color: HaircutColors.PRIMARY_COLOR,
        borderRadius: new BorderRadius.only(
          bottomLeft: const Radius.circular(40.0),
          bottomRight: const Radius.circular(40.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: _getWidth(context),
            child: Text(
              tr('booking_find_customer'),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            width: _getWidth(context),
            height: 120,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.only(right: 10),
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.cover,
                    ),
                    // child: LocationMap(
                    //   latitude: 18.7420085,
                    //   longitude: 99.0474116,
                    //   shopName: 'Haircut',
                    //   shopAddress: 'Haircut',
                    // ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'บ้าน',
                          style: TextStyle(
                              color: HaircutColors.PRIMARY_COLOR, fontSize: 18),
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset('assets/images/ic_marker_2.png'),
                            Text('ท่าแพ อ.เมือง จ.เชียงใหม่')
                          ],
                        ),
                        Text('บ้านเลขที่/หมายเหตุถึงช่าง')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getWidth(BuildContext context) {
    var x = MediaQuery.of(context).size.width;
    return x;
  }
}
