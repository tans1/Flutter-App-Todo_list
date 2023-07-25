import 'package:todo_list/barrel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isScrolling = false;
  final homeBloc = HomeBloc();

  void callInitialFunctions() {
    var box = Hive.box('user__box');
    var localAuth = box.get('local_auth');
    if (localAuth == null) {
      toastInfo(msg: "it is better to have the local auth,please use it");
    }
    homeBloc.add(GetAll());
  }

  void initState() {
    callInitialFunctions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background_1,
        appBar: appbar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          bloc: homeBloc,
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 5.h),
                      child: text_builder("What's up,Joy!", 30,
                          fontWeight: FontWeight.bold)),
                  Container(
                      margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
                      child: text_builder("CATEGORIES", 20,
                          fontWeight: FontWeight.bold,
                          text_color: Colors.grey)),
                  Container(
                    color: Color.fromARGB(70, 217, 217, 217),
                    height: 100.h,
                    width: double.infinity,
                    child: state.isLoading != true
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.categories.length,
                            itemBuilder: (context, index) {
                              var category = state.categories[index];
                              return GestureDetector(
                                onTap: () {
                                  if (category == 'all') {
                                    homeBloc.add(GetAll());
                                  } else {
                                    homeBloc
                                        .add(GetByCategory(category: category));
                                  }
                                  ;
                                },
                                child: Container(
                                    margin: EdgeInsets.only(
                                        top: 5.h, bottom: 5.h, left: 2.w),
                                    child: category_card(category)),
                              );
                            },
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 10.h),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.h),
                    child: text_builder("Today's Tasks", 18,
                        fontWeight: FontWeight.bold, text_color: Colors.grey),
                  ),
                  Expanded(
                    child: NotificationListener<UserScrollNotification>(
                        onNotification: (notification) {
                          if (notification.direction ==
                              ScrollDirection.reverse) {
                            setState(() {
                              isScrolling = true;
                            });
                          } else {
                            setState(() {
                              isScrolling = false;
                            });
                          }
                          return true;
                        },
                        child: Container(
                          child: state.isLoading != true
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.todoList.length,
                                  itemBuilder: (context, index) {
                                    var todo = state.todoList[index];
                                    return task_builder(
                                        todo.title, todo.date, "${todo.id}", todo.id, todo.done);
                                  },
                                )
                              : Container(
                                  margin: EdgeInsets.only(top: 100.h),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  //   ),
                                ),
                        )),
                  )
                ],
              ),
            );
          },
        ),
        drawer: sidebar(context),
        floatingActionButton: isScrolling == false
            ? FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: AppColors.background_1,
                      context: context,
                      builder: (BuildContext context) {
                        return modal_bottom_sheet(context);
                      });
                },
                backgroundColor: Colors.blue,
                shape: CircleBorder(eccentricity: 1),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            : null);
  }
}
