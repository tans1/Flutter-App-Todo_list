part of 'local_bloc.dart';

@immutable
abstract class LocalEvent {
  const LocalEvent();
}


class PassWordEvent extends LocalEvent {
  final String passWord;
  const PassWordEvent(this.passWord);
}