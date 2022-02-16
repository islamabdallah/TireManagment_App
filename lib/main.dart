import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tire_management/core/utils/services/bloc_observer.dart';
import 'package:tire_management/core/utils/services/local/cache_helper.dart';
import 'package:tire_management/core/utils/services/remote/dio_helper.dart';
import 'package:tire_management/ui/screens/login/login_screen.dart';
import 'package:tire_management/ui/screens/manage_tires/manage_tire_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  // BlocOverrides.runZoned(
  //   () {
  //     runApp(MyApp());
  //   },
  //   blocObserver: MyBlocObserver(),
  // );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
    // MyApp(),
  );

  DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        // home: ManageTireScreen(),
        // home: CacheHelper.getData(key: 'userName') == null
        //     ? LoginScreen()
        //     : SelectTruckScreen(),
      );
    });
  }
}
