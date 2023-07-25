part of 'local_bloc.dart';

class LocalState {
  final String passWord;

  LocalState({this.passWord = ""});

  LocalState copyWith({String? passWord}) {
    return LocalState(passWord: passWord ?? this.passWord);
  }
}
