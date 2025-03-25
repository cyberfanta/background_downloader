import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/ui_colors.dart';
import '../../../data/models/login/login.dart';
import '../../../data/models/login/login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routeName = '/';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String tag = LoginView.routeName.substring(1, LoginView.routeName.length);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (value, _) async {
        if (value) {
          return;
        }
      },
      child: Scaffold(
        backgroundColor: cGold,
        body: BlocBuilder<LoginCubit, Login>(
          builder: (context, _) {
            return SizedBox();
          },
        ),
      ),
    );
  }
}
