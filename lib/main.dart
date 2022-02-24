import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tire_management/core/utils/services/bloc_observer.dart';
import 'package:tire_management/core/utils/services/local/cache_helper.dart';
import 'package:tire_management/core/utils/services/remote/dio_helper.dart';
import 'package:tire_management/ui/screens/login/login_screen.dart';
import 'package:tire_management/ui/screens/manage_tires/manage_tire_screen.dart';
import 'package:tire_management/ui/screens/tire_management/cubit/cubit.dart';
import 'package:tire_management/ui/screens/tire_management/tire_management_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
    // );

    // runApp(
    //   DevicePreview(
    //     enabled: !kReleaseMode,
    //     builder: (context) => MyApp(), // Wrap your app
    //   ),
    // MyApp(),
  );

  DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 870),
        minTextAdapt: true,
        builder: () {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => TiersManageCubit(),
              ),
            ],
            child: MaterialApp(
              // useInheritedMediaQuery: true,
              // locale: DevicePreview.locale(context),
              // builder: DevicePreview.appBuilder,
              builder: (context, widget) {
                ScreenUtil.setContext(context);
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              debugShowCheckedModeBanner: false,

              // home: const Car(),
              home: LoginScreen(),

              // home: TiersManagementScreen(),
              // home: CacheHelper.getData(key: 'userName') == null
              //     ? LoginScreen()
              //     : SelectTruckScreen(),
            ),
          );
        });
  }
}
