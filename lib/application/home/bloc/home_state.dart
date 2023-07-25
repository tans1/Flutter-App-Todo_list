part of 'home_bloc.dart';

class HomeState {
  final List<TodoList> todoList;
  final List<String> categories;
  final bool isLoading;

  HomeState({this.todoList = const [], this.categories = const ['all'],this.isLoading = true});

  HomeState copyWith({
    List<TodoList>? todoList,
    List<String>? categories,
    bool? isLoading,
  }) {
    return HomeState(
      todoList: todoList ?? this.todoList,
      categories: [...this.categories, ...categories!],
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
