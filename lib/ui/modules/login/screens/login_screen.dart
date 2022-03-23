import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tire_management/ui/modules/login/cubit/cubit.dart';
import 'package:tire_management/ui/modules/login/cubit/states.dart';
import 'package:tire_management/ui/shared/components/defualt_button.dart';
import 'package:tire_management/ui/shared/utils/message_dialog.dart';
import 'package:tire_management/ui/shared/utils/navigations.dart';

import '../../../shared/components/defualt_text_field.dart';
import '../../../shared/constants.dart';
import '../../../shared/utils/loading_dialog.dart';
import '../../truck_selection/cubit/cubit.dart';
import '../../truck_selection/screens/truck_selection_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/cemex.jpg"), context);

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            loadingAlertDialog(context);
          }

          if (state is LoginErrorState) {
            Navigator.pop(context);
            showMessageDialog(
                context: context,
                message: state.message,
                isSucceeded: false,
            onPressedRetry: (){
                  print('ha');
            }
            );
          }

          if (state is LoginSuccessState) {
            Navigator.pop(context);
            print(state.trucks);
            TruckCubit.get(context).setTrucks(state.trucks);
            Navigator.pushReplacementNamed(context, TruckSelectionScreen.routeName);
            // navigateAndFinish(
            //   context: context,
            //   nextScreen: TruckSelectionScreen.routeName,
            // );
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: backgroundColor,
            body: Center(
              child: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SimpleShadow(
                        offset: Offset(0, 4.h),
                        sigma: 3,
                        child: Image.asset(
                            'assets/images/cemex.jpg',
                          width: 340.w,
                          height: 100.h,
                        ),
                      ),
                      SizedBox(height: 90.h,),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            DefualtTextField(
                              label: 'Email',
                              inputType: TextInputType.emailAddress,
                              controller: cubit.userNameController,
                              hint: 'Email',
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            DefualtTextField(
                              label: 'Password',
                              controller: cubit.passwordController,
                              inputType: TextInputType.text,
                              hint: 'Password',
                              isPassword: true,
                              obscureText: !cubit.isTextVisible,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 112.h,
                      ),
                      DefaultButton(
                        title: 'Login',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.login();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
