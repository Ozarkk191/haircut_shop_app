import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut_delivery_shop/bloc/validate/validate_bloc.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/new_big_round_button.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/text_back.dart';
import 'package:haircut_delivery_shop/src/base_components/textfields/big_round_textfield.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _firstname = "";
  String _lastname = "";
  String _phonenumber = "";
  String _email = "";
  String _password = "";
  String _passwordRepeat = "";

  bool _check() {
    if (_firstname == "" ||
        _lastname == "" ||
        _phonenumber == "" ||
        _email == "" ||
        _password == "" ||
        _passwordRepeat == "") {
      return false;
    } else if (_phonenumber.length < 10) {
      return false;
    } else if (_passwordRepeat != _password) {
      return false;
    } else if (!_email.contains("@") || !_email.contains(".com")) {
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextBack(),
            Container(
              child: Text(
                tr('register_title'),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.red),
              ),
            ),
            BlocBuilder<ValidateBloc, ValidateState>(
                builder: (BuildContext context, ValidateState state) {
              if (state is FirstErrorState) {
                return BigRoundTextField(
                  hintText: tr('register_first_name'),
                  marginTop: 20,
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
                  hintText: tr('register_first_name'),
                  marginTop: 20,
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
                  marginTop: 20,
                  hintText: tr('register_last_name'),
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
                  marginTop: 20,
                  hintText: tr('register_last_name'),
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
              if (state is PhoneErrorState) {
                return BigRoundTextField(
                  marginTop: 20,
                  hintText: tr('register_phone'),
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
                  hintText: tr('register_phone'),
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
                  hintText: tr('register_email'),
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
                  hintText: tr('register_email'),
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
            BlocBuilder<ValidateBloc, ValidateState>(
                builder: (BuildContext context, ValidateState state) {
              if (state is PasswordErrorState) {
                return BigRoundTextField(
                  marginTop: 20,
                  hintText: tr('register_password'),
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
                  hintText: tr('register_password'),
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
                  hintText: tr('register_repeat_password'),
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
                  hintText: tr('register_repeat_password'),
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
              height: 20,
            ),
            NewBigRoundButton(
              callback: !_check()
                  ? null
                  : () {
                      Navigator.pop(context);
                    },
              textButton: tr('register_submit_button'),
              color: !_check() ? Colors.grey : Color(0xffdd133b),
            ),
          ],
        ),
      ),
    );
  }
}
