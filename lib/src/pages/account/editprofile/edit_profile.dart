import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:haircut_delivery_shop/bloc/validate/validate_bloc.dart';
import 'package:haircut_delivery_shop/helpers/share_helper.dart';
import 'package:haircut_delivery_shop/models/address_model.dart';
import 'package:haircut_delivery_shop/src/base_components/appbars/custom_appbar.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/big_button.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/new_big_round_button.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/round_width_height_button.dart';
import 'package:haircut_delivery_shop/src/base_components/textfields/big_round_textfield.dart';
import 'package:haircut_delivery_shop/src/pages/pinlocation/pin_location_screen.dart';
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
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set();

  String _shopname = "";
  String _firstname = "";
  String _lastname = "";
  String _address = "";

  double _latitude = 18.807268;
  double _longitude = 99.0159334;

  File _image;
  final List<String> images2 = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSk90GuxqJW28_H-T340ZhMXyTYXKz4gg7OrcbG5GdZRfng1bUi',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSk90GuxqJW28_H-T340ZhMXyTYXKz4gg7OrcbG5GdZRfng1bUi',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSk90GuxqJW28_H-T340ZhMXyTYXKz4gg7OrcbG5GdZRfng1bUi',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSk90GuxqJW28_H-T340ZhMXyTYXKz4gg7OrcbG5GdZRfng1bUi',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSk90GuxqJW28_H-T340ZhMXyTYXKz4gg7OrcbG5GdZRfng1bUi',
  ];

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        print('position :: :: $position');
        _latitude = position.latitude;
        _longitude = position.longitude;
      });
    }).catchError((e) {
      print(e);
    });
  }

  void _saveData() {
    AddressModel value = AddressModel(
        shopname: _shopname,
        firstname: _firstname,
        lastname: _lastname,
        address: _address,
        addressLat: _latitude,
        addressLon: _longitude);

    print('json_ ::  ${json.encode(value)}');
    SharedPref().save('address', json.encode(value));
  }

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

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  void updateInformation(LatLng latLng) {
    setState(() {
      _latitude = latLng.latitude;
      _longitude = latLng.longitude;
      print('value of latLng :: $_latitude , $_longitude');
    });
  }

  void moveToSecondPage() async {
    final information = await Navigator.push(
      context,
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => PinLocationScreen(
                latitude: _latitude,
                longitude: _longitude,
              )),
    );
    updateInformation(information);
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
                    callback: !_check()
                        ? null
                        : () {
                            _saveData();
                          },
                    color: !_check() ? Colors.grey : Color(0xffdd133b),
                    textButton: 'Save',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  mapsBulid(context),
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

  Widget mapsBulid(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      child: InkWell(
        onTap: () {
          moveToSecondPage();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xffdddddd)),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    shape: BoxShape.rectangle,
                  ),
                  width: double.infinity,
                  height: 300,
                  child: GoogleMap(
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      ),
                    ].toSet(),
                    mapType: MapType.normal,
                    markers: _markers,
                    initialCameraPosition: CameraPosition(
                      target: _latitude == null
                          ? LatLng(18.807268, 99.0159334)
                          : LatLng(_latitude, _longitude),
                      zoom: 16,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                Container(
                  height: 300,
                  color: Colors.black54,
                  width: double.infinity,
                ),
                Container(
                  height: 300,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Update location on map',
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
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
