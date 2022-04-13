abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  dynamic trucks;
  LoginSuccessState(this.trucks);
}

class LoginErrorState extends LoginStates {
  String? message;
  LoginErrorState(this.message);
}

class ChangePasswordVisibilityState extends LoginStates {}
