import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut_delivery_shop/bloc/validate/validate_bloc.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/custom_appbar.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/big_button.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/new_big_round_button.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/round_width_height_button.dart';
import 'package:haircut_delivery_shop/src/base_components/maps/location_map.dart';
import 'package:haircut_delivery_shop/src/base_components/textfields/big_round_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<Asset> images = List<Asset>();
  List<Asset> resultList = List<Asset>();
  String error = 'No Error Dectected';

  String _shopname = "";
  String _firstname = "";
  String _lastname = "";
  String _address = "";

  File _image;
  final List<String> images2 = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSk90GuxqJW28_H-T340ZhMXyTYXKz4gg7OrcbG5GdZRfng1bUi',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSk90GuxqJW28_H-T340ZhMXyTYXKz4gg7OrcbG5GdZRfng1bUi',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSk90GuxqJW28_H-T340ZhMXyTYXKz4gg7OrcbG5GdZRfng1bUi',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSk90GuxqJW28_H-T340ZhMXyTYXKz4gg7OrcbG5GdZRfng1bUi',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSk90GuxqJW28_H-T340ZhMXyTYXKz4gg7OrcbG5GdZRfng1bUi',
  ];

  Future<void> loadAssets() async {
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: true,
        selectedAssets: images,
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  bool _check() {
    if (_shopname == "" ||
        _firstname == "" ||
        _lastname == "" ||
        _address == "") {
      return false;
    } else {
      return true;
    }
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Widget buildGridView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: images2.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 100,
            height: 100,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.all(5),
                  child: Image.network(
                    images2[index],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Image.asset('assets/images/ic_remove.png'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final ValidateBloc _bloc = context.bloc<ValidateBloc>();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 125,
                  ),
                  imageProfileContainer(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 60),
                    child: Text('ข้อมูลผู้ใช้'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    margin: EdgeInsets.only(left: 60, right: 60),
                    color: Color(0xffaaaaaa),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 60, top: 10),
                    child: Text('Upload Shop Gallery'),
                  ),
                  BigButton(callback: loadAssets, buttonText: 'pick'),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: buildGridView(),
                  ),
                  BlocBuilder<ValidateBloc, ValidateState>(
                      builder: (BuildContext context, ValidateState state) {
                    if (state is ShopnameErrorState) {
                      return BigRoundTextField(
                        marginTop: 20,
                        hintText: 'Shop Name',
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          _bloc.add(ShopnameFieldEvent(value: value));
                          setState(() {
                            _shopname = value;
                          });
                        },
                        errorText: state.errorText,
                      );
                    } else {
                      return BigRoundTextField(
                        marginTop: 20,
                        hintText: 'Shop Name',
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          _bloc.add(ShopnameFieldEvent(value: value));
                          setState(() {
                            _shopname = value;
                          });
                        },
                      );
                    }
                  }),
                  BlocBuilder<ValidateBloc, ValidateState>(
                      builder: (BuildContext context, ValidateState state) {
                    if (state is FirstErrorState) {
                      return BigRoundTextField(
                        hintText: 'First Name',
                        marginTop: 10,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          _bloc.add(FirstnameFieldEvent(value: value));
                          setState(() {
                            _firstname = value;
                          });
                        },
                        errorText: state.errorText,
                      );
                    } else {
                      return BigRoundTextField(
                        hintText: 'First Name',
                        marginTop: 10,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          _bloc.add(FirstnameFieldEvent(value: value));
                          setState(() {
                            _firstname = value;
                          });
                        },
                      );
                    }
                  }),
                  BlocBuilder<ValidateBloc, ValidateState>(
                      builder: (BuildContext context, ValidateState state) {
                    if (state is LastErrorState) {
                      return BigRoundTextField(
                        marginTop: 10,
                        hintText: 'Last Name',
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          _bloc.add(LastnameFieldEvent(value: value));
                          setState(() {
                            _lastname = value;
                          });
                        },
                        errorText: state.errorText,
                      );
                    } else {
                      return BigRoundTextField(
                        marginTop: 10,
                        hintText: 'Last Name',
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          _bloc.add(LastnameFieldEvent(value: value));
                          setState(() {
                            _lastname = value;
                          });
                        },
                      );
                    }
                  }),
                  BigRoundTextField(
                    marginTop: 10,
                    hintText: 'บ้าน',
                  ),
                  BlocBuilder<ValidateBloc, ValidateState>(
                      builder: (BuildContext context, ValidateState state) {
                    if (state is AddressErrorState) {
                      return BigRoundTextField(
                        marginTop: 10,
                        hintText: '',
                        maxLines: 4,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          _bloc.add(AddressFieldEvent(value: value));
                          setState(() {
                            _address = value;
                          });
                        },
                        errorText: state.errorText,
                      );
                    } else {
                      return BigRoundTextField(
                        marginTop: 10,
                        hintText: '',
                        maxLines: 4,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          _bloc.add(AddressFieldEvent(value: value));
                          setState(() {
                            _address = value;
                          });
                        },
                      );
                    }
                  }),
                  SizedBox(height: 20),
                  NewBigRoundButton(
                    callback: !_check() ? null : () {},
                    color: !_check() ? Colors.grey : Color(0xffdd133b),
                    textButton: 'Save',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LocationMap(
                    latitude: 18.7420085,
                    longitude: 99.0474116,
                    shopName: 'Haircut',
                    shopAddress: 'Haircut',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          CustomAppbar(
              title: 'Edit Profile',
              callback: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }

  Container buttonUpload(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoundWidthHeightButton(
            title: 'Upload File',
            callback: getImage,
            width: 150,
            height: 30,
            fontSize: 12,
            textColor: Colors.white,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: _image == null ? Text('No image selected.') : Text('image1'),
          ),
        ],
      ),
    );
  }

  Widget imageProfileContainer() {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(5),
      decoration: new BoxDecoration(
        color: Color(0xff555555),
        borderRadius: new BorderRadius.all(Radius.circular(100.0)),
      ),
      child: Card(
        color: Color(0xff555555),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/profile.png',
              width: 150,
              height: 150,
            ),
            InkWell(
              onTap: getImage,
              child: Container(
                margin: EdgeInsets.only(top: 75),
                width: 150,
                height: 75,
                color: new Color.fromRGBO(0, 0, 0, 0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    Text(
                      "Edit image",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
