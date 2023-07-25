import 'package:todo_list/barrel.dart';
import 'package:todo_list/domain/todos/todo_controller.dart';
import 'package:intl/intl.dart';

Widget modal_bottom_sheet(BuildContext context) {
  return ModalWidget();
}

class ModalWidget extends HookWidget {
  const ModalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final title = useState("");
    final description = useState("");
    final category = useState("");
    final date = useState("");
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          height: 430.h,
          width: double.infinity,
          margin: EdgeInsets.only(top: 20.h),
          padding: EdgeInsets.only(left: 20.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: EdgeInsets.only(bottom: 10.h),
                child: text_builder("Title", 20, fontWeight: FontWeight.bold)),
            Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(188, 191, 191, 191),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(0, 0),
                    )
                  ],
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  width: 350.w,
                  child: TextField(
                    onChanged: (value) {
                      title.value = value;
                    },
                    decoration: InputDecoration(
                        hintText: "Title",
                        hintStyle: TextStyle(fontSize: 18.sp),
                        border: InputBorder.none),
                  ),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 10.h, top: 15.h),
                child: text_builder("Description", 20,
                    fontWeight: FontWeight.bold)),
            Container(
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(188, 191, 191, 191),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(0, 0),
                    )
                  ],
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  width: 350.w,
                  child: TextField(
                    maxLines: null,
                    onChanged: (value) {
                      description.value = value;
                    },
                    decoration: InputDecoration(
                        hintText: "description",
                        hintStyle: TextStyle(fontSize: 18.sp),
                        border: InputBorder.none),
                  ),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child:
                    text_builder("category", 20, fontWeight: FontWeight.bold)),
            Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(188, 191, 191, 191),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(0, 0),
                    )
                  ],
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  width: 350.w,
                  child: TextField(
                    onChanged: (value) {
                      category.value = value;
                    },
                    decoration: InputDecoration(
                        hintText: "category",
                        hintStyle: TextStyle(fontSize: 18.sp),
                        border: InputBorder.none),
                  ),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: text_builder("pick a date", 20,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2050))
                        .then((value) {
                      int day = value!.day;
                      String month = getMonthName(value.month);
                      int year = value.year;
                      date.value = "${month} , ${day} / ${year}";
                      return true;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      date.value != "" ? date.value : "choose a date",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    TodoController(context).handleTodo(
                        title: title.value,
                        description: description.value,
                        category: category.value,
                        date: date.value != ""
                            ? date.value
                            : DateTime.now().toString());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    width: 150.w,
                    margin: EdgeInsets.only(right: 30.w),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}

String getMonthName(int monthNumber) {
  return DateFormat('MMMM').format(DateTime(2022, monthNumber));
}
