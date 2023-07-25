import 'package:todo_list/barrel.dart';

class LocalAuthPage extends StatefulWidget {
  const LocalAuthPage({super.key});

  @override
  State<LocalAuthPage> createState() => _LocalAuthPageState();
}

class _LocalAuthPageState extends State<LocalAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 26.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/undraw.png",
                  height: 100.h,
                  width: double.infinity,
                ),
              ),
              Container(
                height: 370.h,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 25.h),
                      child: Text(
                        "Get In",
                        style: TextStyle(
                            fontSize: 40.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        height: 150.h,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            take_credintial("password", Icons.lock, (value) {},
                                topright: 20,
                                bottomright: 20,
                                blur_radius: 2,
                                x_offset: 3,
                                y_offset: 2),
                            Container(
                              margin: EdgeInsets.only(top: 20.h, left: 10.w),
                              child: Text(
                                "or scan ur fingerprint",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp),
                              ),
                            )
                          ],
                        )),
                    GestureDetector(
                      onTap: () {
                        context.go('/home');
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.button_1,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.check,
                          size: 60.sp,
                          color: AppColors.textColor_1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Image.asset(
                  "assets/images/undraw.png",
                  height: 100.h,
                  width: double.infinity,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
