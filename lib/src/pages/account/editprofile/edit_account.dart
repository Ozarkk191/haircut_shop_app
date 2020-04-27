import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut_delivery_shop/bloc/validate/validate_bloc.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/new_big_round_button.dart';
import 'package:haircut_delivery_shop/src/base_components/line/text_line.dart';
import 'package:haircut_delivery_shop/src/base_components/textfields/big_round_textfield.dart';
import '../../../base_components/appbars/custom_appbar.dart';
import '../../../base_components/textfields/textfield.dart';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  String _phonenumber = "";
  String _email = "";
  String _password = "";
  String _passwordRepeat = "";

  bool _check() {
    if (_phonenumber == "" ||
        _email == "" ||
        _password == "" ||
        _passwordRepeat == "") {
      return false;
    } else if (_password != _passwordRepeat) {
      return false;
    } else if (!_email.contains('@')) {
      return false;
    } else {
      return true;
    }
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
              margin: EdgeInsets.only(left: 0, right: 0, top: 130),
              width: _getWidth(context),
              child: Column(
                children: <Widget>[
                  TextLine(title: 'บัญชีผู้ใช้'),
                  BlocBuilder<ValidateBloc, ValidateState>(
                      builder: (BuildContext context, ValidateState state) {
                    if (state is PhoneErrorState) {
                      return BigRoundTextField(
                        marginTop: 20,
                        hintText: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          _bloc.add(PhoneNumberFieldEvent(value: value));
                          setState(() {
                            _phonenumber = value;
                          });
                        },
                        errorText: state.errorText,
                      );
                    } else {
                      return BigRoundTextField(
                        marginTop: 20,
                        hintText: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          _bloc.add(PhoneNumberFieldEvent(value: value));
                          setState(() {
                            _phonenumber = value;
                          });
                        },
                      );
                    }
                  }),
                  BlocBuilder<ValidateBloc, ValidateState>(
                      builder: (BuildContext context, ValidateState state) {
                    if (state is EmailErrorState) {
                      return BigRoundTextField(
                        marginTop: 20,
                        hintText: 'Email',
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          _bloc.add(EmailFieldEvent(value: value));
                          setState(() {
                            _email = value;
                          });
                        },
                        errorText: state.errorText,
                      );
                    } else {
                      return BigRoundTextField(
                        marginTop: 20,
                        hintText: 'Email',
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          _bloc.add(EmailFieldEvent(value: value));
                          setState(() {
                            _email = value;
                          });
                        },
                      );
                    }
                  }),
                  SizedBox(
                    height: 50,
                  ),
                  TextLine(title: 'Password'),
                  BlocBuilder<ValidateBloc, ValidateState>(
                      builder: (BuildContext context, ValidateState state) {
                    if (state is PasswordErrorState) {
                      return BigRoundTextField(
                        marginTop: 20,
                        hintText: 'Password',
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onChanged: (value) {
                          _bloc.add(PasswordFieldEvent(value: value));
                          setState(() {
                            _password = value;
                          });
                        },
                        errorText: state.errorText,
                      );
                    } else {
                      return BigRoundTextField(
                        marginTop: 20,
                        hintText: 'Password',
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onChanged: (value) {
                          _bloc.add(PasswordFieldEvent(value: value));
                          setState(() {
                            _password = value;
                          });
                        },
                      );
                    }
                  }),
                  BlocBuilder<ValidateBloc, ValidateState>(
                      builder: (BuildContext context, ValidateState state) {
                    if (state is RepeatPasswordErrorState) {
                      return BigRoundTextField(
                        marginTop: 20,
                        hintText: 'Password(Repeat)',
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onChanged: (value) {
                          _bloc.add(RepeatPasswordFieldEvent(
                            repeat: value,
                            password: _password,
                          ));
                          setState(() {
                            _passwordRepeat = value;
                          });
                        },
                        errorText: state.errorText,
                      );
                    } else {
                      return BigRoundTextField(
                        marginTop: 20,
                        hintText: 'Password(Repeat)',
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onChanged: (value) {
                          _bloc.add(RepeatPasswordFieldEvent(
                            repeat: value,
                            password: _password,
                          ));
                          setState(() {
                            _passwordRepeat = value;
                          });
                        },
                      );
                    }
                  }),
                  SizedBox(
                    height: 40,
                  ),
                  NewBigRoundButton(
                    callback: !_check() ? null : () {},
                    color: !_check() ? Colors.grey : Color(0xffdd133b),
                    textButton: 'Save',
                  ),
                ],
              ),
            ),
          ),
          CustomAppbar(
            title: 'Edit Account',
            callback: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Container from(
      BuildContext context, String textHead, String hint1, String hint2) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: _getWidth(context),
            child: Text('$textHead'),
          ),
          line(context),
          TextFieldCustom(
            hint: '$hint1',
            width: _getWidth(context),
            height: 40,
            marginTop: 20,
          ),
          TextFieldCustom(
            hint: '$hint2',
            width: _getWidth(context),
            height: 40,
            marginTop: 20,
          ),
        ],
      ),
    );
  }

  Container line(BuildContext context) {
    return Container(
      width: _getWidth(context),
      height: 1,
      color: Colors.grey,
    );
  }

  _getWidth(BuildContext context) {
    var x = MediaQuery.of(context).size.width;
    return x;
  }
}
