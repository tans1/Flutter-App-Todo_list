import 'package:todo_list/barrel.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 26.h),
            child: SingleChildScrollView(
              // padding: EdgeInsets.only(
              //     bottom: MediaQuery.of(context).viewInsets.bottom),
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
                          height: 40.h,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.go('/signup');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 80.w,
                                  height: 38.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          bottomLeft: Radius.circular(13)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0, 2))
                                      ],
                                      color: Colors.blue),
                                  child: Text(
                                    "register",
                                    style: TextStyle(
                                        color: AppColors.textColor_1,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 25.h),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 40.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            height: 180.h,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                take_credintial("email", Icons.mail, (value) {
                                  context
                                      .read<LoginBloc>()
                                      .add(LoginEmailEvent(value));
                                },
                                    topright: 20,
                                    blur_radius: 2,
                                    x_offset: 3,
                                    y_offset: -2),
                                take_credintial("password", Icons.lock,
                                    (value) {
                                  context
                                      .read<LoginBloc>()
                                      .add(LoginPasswordEvent(value));
                                },
                                    bottomright: 20,
                                    blur_radius: 2,
                                    x_offset: 3,
                                    y_offset: 2),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(top: 20.h, left: 10.w),
                                    child: Text(
                                      "forgot a password?",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        GestureDetector(
                          onTap: () {
                            LoginController(context: context).handleLogin();
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
          );
        },
      ),
    );
  }
}
