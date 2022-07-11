import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'constants/strings.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/map_screen.dart';
import 'presentation/screens/otp_screen.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: LoginScreen(),
          ),
          settings: settings,
        );
      case otpScreen:
      final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OtpScreen(phoneNumber:phoneNumber),
          ),
          settings: settings,
        );

      case mapScreen:
        return MaterialPageRoute(
          builder: (context) => const MapScreen(),
        );
    }
  }
}
