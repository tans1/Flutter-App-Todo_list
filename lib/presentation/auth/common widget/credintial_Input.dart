import 'package:todo_list/barrel.dart'; 
Widget take_credintial(String text, IconData icon, void Function(String value)? func,
    {double topright = 0,
    double bottomright = 0,
    double blur_radius = 0,
    double x_offset = 0,
    double y_offset = 0}) {
  return Container(
        margin: EdgeInsets.only(right: 70.w, bottom: 2),
        height: 50.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: blur_radius,
              offset: Offset(x_offset, y_offset),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(topright),
              bottomRight: Radius.circular(bottomright)),
        ),
        padding: EdgeInsets.only(left: 20.w),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            height: 30.h,
            width: 30.w,
            margin: EdgeInsets.only(right: 10),
            child: Icon(icon),
          ),
          Container(
            width: 250.w,
            child: TextField(
              onChanged: (value){
                 func!(value);
              },
              decoration: InputDecoration(
                  hintText: text,
                  hintStyle: TextStyle(fontSize: 18.sp),
                  border: InputBorder.none),
            ),
          )
        ]),
      );
    }
