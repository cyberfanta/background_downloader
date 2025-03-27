import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

import '../../../core/theme/ui_colors.dart';
import '../../../data/models/login/login.dart';
import '../../../data/models/login/login_cubit.dart';
import '../../../data/repository/app_repository.dart';
import '../../../data/repository/repository.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = '/';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  String tag = MainView.routeName.substring(1, MainView.routeName.length);

  @override
  void initState() {
    super.initState();

    Repository repository = AppRepository();
    repository.init();
  }

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
        body: BlocBuilder<MainCubit, MainObject>(
          builder: (context, _) {
            return Expanded(
              child: BlurHash(hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I"),
            );
          },
        ),
      ),
    );
  }
}
