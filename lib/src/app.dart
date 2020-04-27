import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut_delivery_shop/bloc/validate/validate_bloc.dart';
import 'package:haircut_delivery_shop/src/base_components/colors/haircut_colors.dart';
// import 'package:haircut_delivery_shop/src/pages/home/home_layout.dart';
import 'package:haircut_delivery_shop/src/pages/loading/loading_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ValidateBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Haircut Delivery Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: HaircutColors.PRIMARY_COLOR,
          accentColor: HaircutColors.PRIMARY_COLOR,
          fontFamily: 'Kanit',
        ),
        home: LoadingPage(),
        routes: <String, WidgetBuilder>{
          // Routes examples
          // '/splashscreen': (BuildContext context) => new SplashScreen(),
          // '/conditions': (BuildContext context) => new TermsAndConditionsPage(),
        },
      ),
    );
  }
}
