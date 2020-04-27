import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  final String addressTitle;
  final String address;
  final Function callback;
  final bool isEdit;

  const AddressItem({
    Key key,
    @required this.addressTitle,
    @required this.address,
    this.callback,
    this.isEdit = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/ic_home_2.png'),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('$addressTitle'),
                  Text('$address'),
                ],
              ),
            ),
          ),
          isEdit
              ? InkWell(
                  onTap: callback,
                  child: Image.asset('assets/images/ic_edit.png'),
                )
              : Container(
                  height: 0,
                  width: 0,
                ),
        ],
      ),
    );
  }
}
