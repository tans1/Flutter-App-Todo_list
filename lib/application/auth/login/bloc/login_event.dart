part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}



class LoginEmailEvent extends LoginEvent {
  final String email;
  const LoginEmailEvent(this.email);
}


class LoginPasswordEvent extends LoginEvent {
  final String password;
  const LoginPasswordEvent(this.password);
}