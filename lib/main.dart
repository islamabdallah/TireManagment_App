import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tire_management/core/utils/services/bloc_observer.dart';
import 'package:tire_management/core/utils/services/local/cache_helper.dart';
import 'package:tire_management/ui/modules/login/screens/login_screen.dart';
import 'package:tire_management/ui/modules/tire_management/cubit/cubit.dart';
import 'package:tire_management/ui/modules/truck_selection/cubit/cubit.dart';
import 'package:tire_management/ui/shared/constants.dart';

import 'core/config/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderOutsideViewBoxBuilder, // See UPDATE below!
        'assets/images/truck3.svg',
      ),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderOutsideViewBoxBuilder, // See UPDATE below!
        'assets/icons/trailer2.svg',
      ),
      null,
    ),
    // precachePicture(
    //   ExactAssetPicture(
    //     SvgPicture.svgStringDecoderOutsideViewBoxBuilder , // See UPDATE below!
    //     'assets/icons/FL_Tyre.svg',
    //   ),
    //   null,
    // ),
  ]);

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
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 800),
        minTextAdapt: true,
        // designSize: const Size(412, 800),
        // minTextAdapt: true,

        builder: () {
          return MultiBlocProvider(
            providers: [
              BlocProvider<TiersManageCubit>(
                create: (context) => TiersManageCubit(),
              ),
              BlocProvider<TruckCubit>(
                create: (context) => TruckCubit(),
              ),
            ],
            child: MaterialApp(
              color: mainColor,
              theme: ThemeData(


                  scaffoldBackgroundColor: backgroundColor,
                  colorScheme:
                      ColorScheme.fromSwatch().copyWith(primary: mainColor,)),
              onGenerateRoute: AppRoutes.onGenerateRoutes,
              initialRoute: LoginScreen.routeName,
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
              // home: LoginScreen(),

              // home: TiersManagementScreen(),
              // home: CacheHelper.getData(key: 'userName') == null
              //     ? LoginScreen()
              //     : SelectTruckScreen(),
            ),
          );
        });
  }
}
