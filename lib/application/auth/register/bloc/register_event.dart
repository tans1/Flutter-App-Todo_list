part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {
  const RegisterEvent();
}


class FullNameEvent extends RegisterEvent {
  final String fullName;
  const FullNameEvent(this.fullName);
}

class EmailEvent extends RegisterEvent {
  final String email;
  const EmailEvent(this.email);
}


class PasswordEvent extends RegisterEvent {
  final String password;
  const PasswordEvent(this.password);
}

class ConfirmPasswordEvent extends RegisterEvent {
  final String confirm_password;
  const ConfirmPasswordEvent(this.confirm_password);
}

