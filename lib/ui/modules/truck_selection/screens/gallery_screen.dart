import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:tire_management/ui/shared/constants.dart';

class GalleryScreen extends StatelessWidget {
  final String? imageUrl;
  final int index;

  const GalleryScreen({Key? key, this.imageUrl, this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: imageUrl == null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
                  child: IconButton(
                    iconSize: 55.r,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/images/fontisto_truck.svg',
                    width: 140.h,
                    height: 140.h,
                    color: mainColor,
                  ),
                ),
                SizedBox(height: 20.h,),
                Center(
                  child: Text(
                    'No Image Available',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: 36.0.sp),
                  ),
                ),
              ],
            )
          : PhotoView(
              imageProvider: NetworkImage(imageUrl!),
            ),
    );
  }
}
