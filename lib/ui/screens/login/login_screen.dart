import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tire_management/ui/screens/login/components/defualt_text_field.dart';
import 'package:tire_management/ui/screens/login/cubit/cubit.dart';
import 'package:tire_management/ui/screens/login/cubit/states.dart';
import 'package:tire_management/ui/screens/trucks/car_selection.dart';
import 'package:tire_management/ui/screens/trucks/select_truck_screen.dart';
import 'package:tire_management/ui/shared/components/defualt_button.dart';
import 'package:tire_management/ui/shared/constants.dart';
import 'package:tire_management/ui/shared/utils/messages.dart';
import 'package:tire_management/ui/shared/utils/navigations.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'LoginScreen';
  var formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(100.w);
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showAlert(message: state.message, context: context);
          }
          if (state is LoginInputDataErrorState) {
            showAlert(message: state.message, context: context);
          }
          if (state is LoginSuccessState) {
            navigateWithTransitionAndFinish(
              context: context,
              nextScreen: CarSelectionScreen(),
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
                  padding: EdgeInsets.all(100.w <= 500 ? 16.0 : 25.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage(
                          'assets/images/cemex.jpg',
                        ),
                        width: 40.w,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
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
                      if (state is! LoginLoadingState)
                        DefualtButton(
                          title: 'Login',
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              cubit.login();
                            }
                          },
                        ),
                      if (state is LoginLoadingState)
                        const Center(
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
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
