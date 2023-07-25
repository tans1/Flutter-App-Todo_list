import 'package:todo_list/barrel.dart'; 


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetAll>((event, emit) async {
      List<TodoList> todoList = await TodoProvider().fetchAll();
      List<String> categories = await get_categories();
      emit(HomeState().copyWith(
          todoList: todoList, categories: categories, isLoading: false));
    });

    on<GetByCategory>((event, emit) async {
      List<TodoList> todoLists =
          await TodoProvider().getByCategory(category: event.category);
      List<String> categories = await get_categories();

      emit(HomeState().copyWith(
          todoList: todoLists, categories: categories, isLoading: false));
    });

    on<CreateTodo>((event, emit) async {
      Map<String, dynamic> todo = {
        'title': event.title,
        'description': event.description,
        'category': event.category,
        'date': event.date,
      };
      await TodoProvider().create(todo);
    });

    on<DeleteTodo>((event, emit) async {
      await TodoProvider().deleteById(id: event.id);
      print("deleted succesfully");
    });

    on<Done>((event, emit) async {
      TodoList todo = await TodoProvider().getById(id: event.id);
      var new_todo = {
        'id': todo.id,
        'title': todo.title,
        'description': todo.description,
        'category': todo.category,
        'date': todo.date,
        'done': 1,
      };
      await TodoProvider().update(new_todo);
      
    });
  }

  Future<List<String>> get_categories() async {
    List<String> categories = await TodoProvider().getAllCategories();
    return categories;
  }
}
