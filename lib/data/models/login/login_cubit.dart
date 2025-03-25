import 'package:bloc/bloc.dart';

import 'login.dart';

Login _empty = Login(email: '', organizationId: '');

class LoginCubit extends Cubit<Login> {
  LoginCubit() : super(_empty);

  bool _isLogged = false;

  bool isLogged() => _isLogged;

  void setLogin(String email, String organizationId) {
    Login login = Login(
      email: email,
      organizationId: organizationId,
    );

    emit(login);
    _isLogged = true;
  }

  void reset() {
    emit(_empty);
    _isLogged = false;
  }
}
