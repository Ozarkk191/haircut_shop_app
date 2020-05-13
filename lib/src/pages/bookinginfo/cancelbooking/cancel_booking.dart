import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../base_components/appbars/custom_appbar.dart';
import '../../../base_components/buttons/round_width_height_button.dart';
import '../../../base_components/colors/haircut_colors.dart';

class CancelBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 800,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        tr('booking_canael_reason'),
                        style: TextStyle(
                            fontSize: 18, color: HaircutColors.PRIMARY_COLOR),
                      ),
                    ),
                    DropdownButton(
                      hint: Text(tr('booking_service_not_available')),
                      focusColor: Colors.grey,
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down),
                      items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValue) {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        tr('booking_other_description'),
                        style: TextStyle(
                            fontSize: 18, color: HaircutColors.PRIMARY_COLOR),
                      ),
                    ),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                    RoundWidthHeightButton(
                      title: tr('btn_confirm'),
                      callback: () {},
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 40,
                      textColor: Colors.white,
                      marginTop: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
          CustomAppbar(
              title: tr('booking_canael'),
              callback: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
