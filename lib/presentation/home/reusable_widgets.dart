import 'dart:convert';
import 'dart:io';
import 'dart:math';
// import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:todo_list/barrel.dart';

AppBar appbar() {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(size: 27, color: Colors.grey),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search,
          color: Colors.grey,
          size: 27,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.notifications_outlined,
          color: Colors.grey,
          size: 27,
        ),
      ),
    ],
  );
}

Widget text_builder(String text, double font_size,
    {Color text_color = Colors.black,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: text_color,
        fontSize: font_size.sp,
        fontWeight: fontWeight),
  );
}

var colors = [Colors.blue, Colors.red, Colors.green];
Random random = Random();

Widget category_card(String category) {
  return Container(
    width: 210.w,
    padding: EdgeInsets.only(top: 10.h, left: 10.w),
    margin: EdgeInsets.only(right: 5.w, left: 5.w),
    decoration: BoxDecoration(
        color: AppColors.background_1,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0, 0),
              spreadRadius: 1,
              blurRadius: 5)
        ],
        borderRadius: BorderRadius.circular(20)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      text_builder(category, 27, fontWeight: FontWeight.bold),
      Container(
        width: 180.w,
        margin: EdgeInsets.only(top: 10.h),
        child: LinearProgressIndicator(
          color: colors[random.nextInt(colors.length)],
          backgroundColor: Colors.grey[300],
          value: 0.5,
        ),
      )
    ]),
  );
}

Widget task_builder(String title, String time, String key, int id, bool done) {
  return Dismissible(
      key: Key(key),
      onDismissed: (direction) {
        HomeBloc().add(DeleteTodo(id: id));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5.h, left: 10.w, top: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 60.h,
        decoration: BoxDecoration(
            color: AppColors.background_1,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 2)
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    HomeBloc().add(Done(id: id));
                  },
                  child: done == true
                      ? Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 146, 214, 219),
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30.sp,
                            weight: 10,
                          ))
                      : Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 3,
                                color: colors[random.nextInt(colors.length)],
                              )),
                        ),
                ),
                Container(
                  // width: 280.w,
                  margin: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text_builder(title, 20, fontWeight: FontWeight.bold),
                      text_builder(time, 15, text_color: Colors.grey)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ));
}

Widget image_picker_modal(BuildContext context) {
  return Container(
    height: 130.h,
    width: double.infinity,
    margin: EdgeInsets.only(left: 10.w, right: 20.w, top: 30.h),
    child: Column(children: [
      GestureDetector(
        onTap: () {
          selectImageFromGallery();
          // HomeBloc().add(GetAll());
          Navigator.pop(context);
        },
        child: Container(
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 216, 216, 216),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.only(left: 5.w),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5.w),
                child: Icon(Icons.camera),
              ),
              text_builder("take a picture", 18),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          selectImageFromGallery();
          // HomeBloc().add(GetAll());
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.only(left: 5.w),
          height: 50.h,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10.h),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 216, 216, 216),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5.w),
                child: Icon(
                  Icons.image,
                  size: 30,
                ),
              ),
              text_builder("pick gallery", 18),
            ],
          ),
        ),
      ),
    ]),
  );
}

Future selectImageFromGallery() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result == null) return;

  File file = File(result.files.single.path!);

  String base64String = imageToBase64String(file);
  var imageBox = Hive.box('user__box');
  await imageBox.put('image_key', base64String);

  // return file;
}

// Future selectImageFromCamera() async {
//   FilePickerResult? result = await FilePicker.platform.
// }

String imageToBase64String(File image) {
  List<int> imageBytes = image.readAsBytesSync();
  return base64Encode(imageBytes);
}
