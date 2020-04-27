import 'package:flutter/material.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/small_button.dart';

class ItemDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Row(
          children: <Widget>[
            Image.network(
              'https://images.mover.in.th/wp-content/uploads/2019/05/19211513/%E0%B8%AB%E0%B8%A1%E0%B8%A7%E0%B8%81_190519_0001-never.jpg',
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 20,
                                  height: 20,
                                  child:
                                      Image.asset('assets/images/ic_clock.png'),
                                ),
                                Text('To day - 9.30')
                              ],
                            ),
                            Container(
                              child: Text(
                                'อีก 30 นาทีจะถึงเวลาที่นัดหมาย',
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                        SmallButton(callback: () {}, buttonText: 'เดินทาง')
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 20,
                              height: 20,
                              child:
                                  Image.asset('assets/images/ic_account.png'),
                            ),
                            Text('นิลภัคร์ ปักธงชัย')
                          ],
                        ),
                        Text('5 km')
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset('assets/images/ic_marker_2.png'),
                        ),
                        Text('ท่าแพ อ.เมือง เชียงใหม่')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
