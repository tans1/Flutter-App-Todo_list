import 'package:todo_list/barrel.dart'; 

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_1,
      body: Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.red, width: 2)
                      ),
                  child: Image.asset(
                    "assets/images/undraw.png",
                    height: 340.h,
                    fit: BoxFit.cover,
                  )),
              Container(
                margin: EdgeInsets.only(
                    top: 30.h, bottom: 30.h, left: 10.w, right: 10.w),
                child: Text(
                  "welcome to the todo list",
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  var box = Hive.box('user__box');
                  var alreadyLogedIn = box.get('loggedIn');
                  if (alreadyLogedIn != null) {
                    context.go("/local-auth");
                  } else {
                    context.go("/login");
                  }
                  ;
                },
                child: Container(
                  height: 50.h,
                  width: 120.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.button_1),
                  child: Text(
                    "start",
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
