abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginInputDataErrorState extends LoginStates {
  String message;
  LoginInputDataErrorState(this.message);
}

class LoginErrorState extends LoginStates {
  String message;
  LoginErrorState(this.message);
}

class ChangePasswordVisibilityState extends LoginStates {}
