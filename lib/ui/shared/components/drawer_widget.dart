import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tire_management/ui/modules/login/screens/login_screen.dart';
import 'package:tire_management/ui/modules/truck_selection/screens/truck_selection_screen.dart';
import 'package:tire_management/ui/shared/constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
        color: const Color(0xff293064),
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontSize: 20.0.sp);
    return SizedBox(
      width: 273.w,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15.w, top: 20.h),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 35.h,
                      width: 35.h,
                      padding: EdgeInsets.zero,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(
                          'assets/images/close.svg',
                          height: 35.h,
                          width: 35.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/profile.svg',
                  height: 150.h,
                  width: 150.h,
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  userData!.email!,
                  style: TextStyle(
                      color: const Color(0xff293064),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 22.0.sp),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: const Divider(
                thickness: 2,
                color: Color(0xff878787),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/fontisto_truck.svg',
                color: mainColor,
                height: 35.h,
              ),
              title: Text("Select Truck",
                  style: style,),
              onTap: (){
                Navigator.popUntil(context, ModalRoute.withName(TruckSelectionScreen.routeName));
              },
            ),

            ListTile(
              leading: Container(
                child: SvgPicture.asset(
                  'assets/images/logout.svg',
                  color: mainColor,
                  height: 30.h,
                ),
              ),
              title: Text('Logout',style: style,),
              onTap: (){
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(LoginScreen.routeName, (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
