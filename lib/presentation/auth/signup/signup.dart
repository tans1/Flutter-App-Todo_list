import 'package:todo_list/barrel.dart'; 

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegisterBloc, RegisterState>(
        // bloc
        builder: (context, state) {
          return Container(
            // margin: EdgeInsets.only(top: 26.h),
            child: SingleChildScrollView(
              // padding: EdgeInsets.only(
              //     bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/undraw.png",
                      height: 80.h,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    // height: 370.h,
                    child: Column(
                      children: [
                        Container(
                          height: 40.h,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
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
                                  "Login",
                                  style: TextStyle(
                                      color: AppColors.textColor_1,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 25.h),
                          child: Text(
                            "Register",
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
                                take_credintial("full name", Icons.person,
                                    (value) {
                                  context
                                      .read<RegisterBloc>()
                                      .add(FullNameEvent(value));
                                },
                                    topright: 20,
                                    blur_radius: 2,
                                    x_offset: 3,
                                    y_offset: -2),
                                take_credintial("email", Icons.mail, (value) {
                                  context
                                      .read<RegisterBloc>()
                                      .add(EmailEvent(value));
                                }, blur_radius: 2, x_offset: 3, y_offset: 0),
                                take_credintial("password", Icons.mail, (value) {
                                  context
                                      .read<RegisterBloc>()
                                      .add(PasswordEvent(value));
                                }, blur_radius: 2, x_offset: 3, y_offset: 0),
                                take_credintial("confirm password", Icons.lock,
                                    (value) {
                                  context
                                      .read<RegisterBloc>()
                                      .add(ConfirmPasswordEvent(value));
                                },
                                    bottomright: 20,
                                    blur_radius: 2,
                                    x_offset: 3,
                                    y_offset: 2),
                              ],
                            )),
                        GestureDetector(
                          onTap: () {
                            RegisterController(context: context)
                                    .handleEmailRegister();
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
                      height: 80.h,
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
