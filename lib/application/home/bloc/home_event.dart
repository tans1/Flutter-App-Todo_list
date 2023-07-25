part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetAll extends HomeEvent {}

class GetAllCategories extends HomeEvent {}

class GetByCategory extends HomeEvent {
  final String category;

  GetByCategory({required this.category});
}

class GetByID extends HomeEvent {
  final int id;

  GetByID({required this.id});
}

class CreateTodo extends HomeEvent {
  final String title;
  final String description;
  final String category;
  final String date;

  CreateTodo(
      {required this.title,
      required this.description,
      required this.category,
      required this.date});
}

class DeleteTodo extends HomeEvent {
  final int id;

  DeleteTodo({
    required this.id,
  });
}

class Done extends HomeEvent {
  final int id;

  Done({
    required this.id,
  });
}