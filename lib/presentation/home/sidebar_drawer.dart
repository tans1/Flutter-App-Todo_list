import 'dart:convert';
// import 'dart:typed_data';

import 'package:todo_list/barrel.dart';

Widget sidebar(BuildContext context) {
  var imageBox = Hive.box('user__box');
  var imageBase64String = imageBox.get('image_key');

  return Drawer(
      backgroundColor: Color.fromARGB(255, 8, 9, 55),
      child: Container(
        margin: EdgeInsets.only(top: 50.h, left: 10.w),
        child: Column(children: [
          Stack(children: [
            Container(
                margin: EdgeInsets.only(bottom: 13.h),
                height: 150,
                width: 150,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: imageBase64String == null
                        ? Image.asset(
                            "assets/images/undraw.png",
                            fit: BoxFit.fill,
                          )
                        : Image.memory(
                            base64Decode(imageBase64String),
                            fit: BoxFit.fill,
                          ))),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: AppColors.background_1,
                      context: context,
                      builder: (BuildContext context) {
                        return image_picker_modal(context);
                      });
                },
                child: Container(
                  height: 35.w,
                  width: 35.w,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    size: 27,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]),
          text_builder("username", 22, text_color: AppColors.textColor_1),
          Container(
            margin: EdgeInsets.only(top: 50.h),
            child: Column(
              children: [
                _sidebar_List_builder("Settings", Icons.settings),
                _sidebar_List_builder("Logout", Icons.person),
                _sidebar_List_builder("help", Icons.help)
              ],
            ),
          )
        ]),
      ));
}

Widget _sidebar_List_builder(String title, IconData icon) {
  return GestureDetector(
    onTap: () {},
    child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        child: Row(
          children: [
            SizedBox(
              height: 20.h,
              width: 20.w,
              child: Icon(
                icon,
                size: 25,
                color: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.w),
              child: text_builder(title, 18, text_color: AppColors.textColor_1),
            )
          ],
        )),
  );
}
