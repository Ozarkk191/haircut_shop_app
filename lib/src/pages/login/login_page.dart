import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut_delivery_shop/bloc/validate/validate_bloc.dart';
import 'package:haircut_delivery_shop/helpers/share_helper.dart';
import 'package:haircut_delivery_shop/src/base_components/buttons/new_big_round_button.dart';
import 'package:haircut_delivery_shop/src/base_components/textfields/big_round_textfield.dart';
import 'package:haircut_delivery_shop/src/pages/forgetpassword/forget_password_page.dart';
import 'package:haircut_delivery_shop/src/pages/home/home_layout.dart';
import 'package:haircut_delivery_shop/src/pages/register/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _phone = "";
  String _password = "";

  bool _locale = false;

  _loadSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('test') ?? "";
    print(data);
    if (data != "") {
      if (data.contains("en")) {
        setState(() {
          _locale = true;
        });
      } else {
        setState(() {
          _locale = false;
        });
      }
    }
  }

  _switchLocale(bool val) {
    setState(() {
      _locale = val;
      if (_locale) {
        setNewLocale(
          context,
          EasyLocalization.of(context).supportedLocales[0],
        );
        SharedPref().save('test', 'en');
      } else {
        setNewLocale(
          context,
          EasyLocalization.of(context).supportedLocales[1],
        );
        SharedPref().save('test', 'th');
      }
    });
  }

  setNewLocale(BuildContext context, Locale locale) {
    context.locale = locale;
  }

  bool _check() {
    if (_phone == "" || _password == "") {
      return false;
    } else if (_phone.length < 10) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    _loadSharedPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final ValidateBloc _bloc = context.bloc<ValidateBloc>();
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: <Widget>[
              switchContainer(),
              logoRed(),
              BlocBuilder<ValidateBloc, ValidateState>(
                  builder: (BuildContext context, ValidateState state) {
                if (state is PhoneErrorState) {
                  return BigRoundTextField(
                    marginTop: 20,
                    hintText: tr('login_username'),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      _bloc.add(PhoneNumberFieldEvent(value: value));
                      setState(() {
                        _phone = value;
                      });
                    },
                    errorText: state.errorText,
                  );
                } else {
                  return BigRoundTextField(
                    marginTop: 20,
                    hintText: tr('login_username'),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      _bloc.add(PhoneNumberFieldEvent(value: value));
                      setState(() {
                        _phone = value;
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
                    hintText: tr('login_password'),
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
                    hintText: tr('login_password'),
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
              textContainer(context),
              SizedBox(
                height: 20,
              ),
              NewBigRoundButton(
                callback: !_check()
                    ? null
                    : () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeLayout()));
                      },
                textButton: tr('login_log_in_button'),
                color: !_check() ? Colors.grey : Color(0xffdd133b),
              ),
              SizedBox(
                height: 20,
              ),
              NewBigRoundButton(
                callback: () {},
                textButton: tr('login_log_in_facebook_button'),
                color: Color(0xff4167B2),
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                child: Text(
                  tr('login_please_register'),
                  style: TextStyle(fontSize: 12),
                ),
              ),
              NewBigRoundButton(
                callback: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                textButton: tr('login_register_button'),
                color: Color(0xff444444),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container textContainer(context) {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.fromLTRB(0, 5, 40, 10),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForgetPasswordPage()));
        },
        child: Text(
          tr('login_forgot_password'),
          style: TextStyle(
            fontSize: 12,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Container logoRed() {
    return Container(
      width: 80,
      margin: EdgeInsets.only(top: 40),
      child: Image.asset('assets/images/logo_red.png'),
    );
  }

  Container switchContainer() {
    return Container(
        margin: EdgeInsets.only(right: 20, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'TH',
              style: TextStyle(fontSize: 12),
            ),
            Switch(
              value: _locale,
              onChanged: _switchLocale,
            ),
            Text(
              'EN',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ));
  }
}
