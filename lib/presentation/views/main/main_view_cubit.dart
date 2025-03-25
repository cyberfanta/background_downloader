import 'package:bloc/bloc.dart';

import '../../../utils/validators.dart';

enum MainViewStates {
  init,
  emailEmpty,
  passEmpty,
  noInternet,
  accessNotAllowed,
}

class MainViewData {
  final bool emailHasError;
  final String emailText;
  final bool passHasError;
  final String passText;
  final bool repositoryHasError;
  final String repositoryText;
  final bool buttonAllowed;

  MainViewData({
    required this.emailHasError,
    required this.emailText,
    required this.passHasError,
    required this.passText,
    required this.repositoryHasError,
    required this.repositoryText,
    required this.buttonAllowed,
  });

  @override
  String toString() {
    return "\"MainViewData\":"
        "{"
        "\"emailHasError\":$emailHasError,"
        "\"emailText\":\"$emailText\","
        "\"passHasError\":$passHasError,"
        "\"passText\":\"$passText\","
        "\"repositoryHasError\":$repositoryHasError,"
        "\"repositoryText\":\"$repositoryText\","
        "\"buttonAllowed\":$buttonAllowed"
        "}";
  }
}

MainViewData _default = MainViewData(
  emailHasError: false,
  emailText: "",
  passHasError: false,
  passText: "",
  repositoryHasError: false,
  repositoryText: "",
  buttonAllowed: false,
);

class MainViewCubit extends Cubit<MainViewData> {
  MainViewCubit() : super(_default);

  bool validateEmail(String value) {
    emit(MainViewData(
      emailHasError: false,
      emailText: value,
      passHasError: state.passHasError,
      passText: state.passText,
      repositoryHasError: state.repositoryHasError,
      repositoryText: state.repositoryText,
      buttonAllowed: false,
    ));

    if (!isValidEmail(value)) {
      emit(MainViewData(
        emailHasError: true,
        emailText: state.emailText,
        passHasError: state.passHasError,
        passText: state.passText,
        repositoryHasError: state.repositoryHasError,
        repositoryText: state.repositoryText,
        buttonAllowed: false,
      ));

      return false;
    }

    if (state.passHasError || state.passText.isEmpty) {
      emit(MainViewData(
        emailHasError: false,
        emailText: state.emailText,
        passHasError: state.passHasError,
        passText: state.passText,
        repositoryHasError: state.repositoryHasError,
        repositoryText: state.repositoryText,
        buttonAllowed: false,
      ));

      return false;
    }

    _allOk();
    return true;
  }

  bool validatePass(String value) {
    emit(MainViewData(
      emailHasError: state.emailHasError,
      emailText: state.emailText,
      passHasError: false,
      passText: value,
      repositoryHasError: state.repositoryHasError,
      repositoryText: state.repositoryText,
      buttonAllowed: false,
    ));

    if (value.length < 6) {
      emit(MainViewData(
        emailHasError: state.emailHasError,
        emailText: state.emailText,
        passHasError: true,
        passText: state.passText,
        repositoryHasError: state.repositoryHasError,
        repositoryText: state.repositoryText,
        buttonAllowed: false,
      ));

      return false;
    }

    if (state.emailHasError || state.emailText.isEmpty) {
      emit(MainViewData(
        emailHasError: state.emailHasError,
        emailText: state.emailText,
        passHasError: false,
        passText: state.passText,
        repositoryHasError: state.repositoryHasError,
        repositoryText: state.repositoryText,
        buttonAllowed: false,
      ));

      return false;
    }

    _allOk();
    return true;
  }

  void _allOk() {
    emit(MainViewData(
      emailHasError: false,
      emailText: state.emailText,
      passHasError: false,
      passText: state.passText,
      repositoryHasError: false,
      repositoryText: state.passText,
      buttonAllowed: true,
    ));
  }

  void reset() {
    emit(_default);
  }
}
