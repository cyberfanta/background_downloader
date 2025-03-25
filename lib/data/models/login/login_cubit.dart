import 'package:bloc/bloc.dart';

import 'login.dart';

MainObject _empty = MainObject(email: '');

class MainCubit extends Cubit<MainObject> {
  MainCubit() : super(_empty);

  bool _isLogged = false;

  bool isLogged() => _isLogged;

  void setLogin(String email, String organizationId) {
    MainObject login = MainObject(
      email: email,
    );

    emit(login);
    _isLogged = true;
  }

  void reset() {
    emit(_empty);
    _isLogged = false;
  }
}
