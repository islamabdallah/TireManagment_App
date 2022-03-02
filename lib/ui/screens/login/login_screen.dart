import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tire_management/ui/screens/login/components/defualt_text_field.dart';
import 'package:tire_management/ui/screens/login/cubit/cubit.dart';
import 'package:tire_management/ui/screens/login/cubit/states.dart';
import 'package:tire_management/ui/shared/components/defualt_button.dart';
import 'package:tire_management/ui/shared/utils/messages.dart';
import 'package:tire_management/ui/shared/utils/navigations.dart';

import '../../shared/utils/loading_dialog.dart';
import '../truck_selection/truck_selection_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'LoginScreen';
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
            showAlert(message: state.message, context: context);
          }

          if (state is LoginSuccessState) {
            Navigator.pop(context);
            navigateWithTransitionAndFinish(
              context: context,
              nextScreen: TruckSelectionScreen(),
            );
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(50.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image(
                        image: const AssetImage(
                          'assets/images/cemex.jpg',
                        ),
                        width: 304.w,
                        height: 83.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 50.h),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              DefualtTextField(
                                controller: cubit.userNameController,
                                hint: 'UserName',
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              DefualtTextField(
                                controller: cubit.passwordController,
                                hint: 'Password',
                                isPassword: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      DefualtButton(
                        title: 'Login',
                        onPress: () {
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
