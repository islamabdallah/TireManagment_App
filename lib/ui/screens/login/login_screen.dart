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

class LoginScreen extends StatelessWidget {
  static const routeName = 'LoginScreen';
  var formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(
                          'assets/images/cemex.jpg',
                        ),
                        width: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              DefualtTextField(
                                controller: cubit.userNameController,
                                hint: 'UserName',
                              ),
                              const SizedBox(
                                height: 30,
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
