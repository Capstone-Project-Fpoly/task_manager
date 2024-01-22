import 'package:flutter/material.dart';
import 'package:task_manager/base/bloc/bloc_base.dart';
import 'package:task_manager/base/bloc/bloc_provider.dart';
import 'package:task_manager/feature/login/login_bloc.dart';
import 'package:task_manager/feature/login/login_screen.dart';
import 'package:task_manager/feature/login_with_email/login_with_email_bloc.dart';
import 'package:task_manager/feature/login_with_email/login_with_email_screen.dart';
import 'package:task_manager/feature/login_with_email/login_with_other_email/login_with_other_email_bloc.dart';
import 'package:task_manager/feature/login_with_email/login_with_other_email/login_with_other_email_screen.dart';
import 'package:task_manager/feature/root/root_screen.dart';
import 'package:task_manager/feature/unknown/unknown_screen.dart';

class RouteScreen {
  static PageRoute unknownPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const UnknownScreen(),
    );
  }

  static PageRoute rootPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const RootScreen(),
    );
  }

  static PageRoute loginPageRoute(RouteSettings settings) {
    BlocProvider.login = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => LoginBloc(ref),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const LoginScreen(),
    );
  }

  static PageRoute loginEmailPageRoute(RouteSettings settings) {
    final isLogin = settings.arguments as bool;
    BlocProvider.loginWithEmail = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => LoginWithEmailBloc(ref,isLogin),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const LoginWithEmailScreen(),
    );
  }

  static PageRoute loginOtherEmailPageRoute(RouteSettings settings) {
    BlocProvider.loginWithOtherEmail = createAutoDisposeBloc(
      //Nhớ khởi tạo provider cho bloc
      (ref) => LoginWithOtherEmailBloc(ref),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => LoginWithOtherEmailScreen(),
    );
  }
}
