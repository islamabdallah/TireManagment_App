import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tire_management/ui/screens/manage_tires/cubit/cubit.dart';
import 'package:tire_management/ui/screens/manage_tires/models/tire_model.dart';
import 'package:tire_management/ui/shared/constants.dart';

class TireItem extends StatelessWidget {
  double width;
  double? height;
  Tire? tire;
  var onPress;
  TireItem({
    required this.width,
    required this.height,
    required this.onPress,
    required this.tire,
  });
  @override
  Widget build(BuildContext context) {
    var cubit = ManageTiresCubit.get(context);
    return InkWell(
      onTap: onPress,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: width < 480 ? height! / 22 : height! / 18,
            backgroundColor: cubit.selectedTiresList[tire!.id!] != null &&
                    cubit.selectedTiresList[tire!.id!] == 'first'
                ? Colors.red.shade800
                : cubit.selectedTiresList[tire!.id!] != null &&
                        cubit.selectedTiresList[tire!.id!] == 'second'
                    ? Colors.green.shade800
                    : mainColor,
            child: SvgPicture.asset('assets/images/tire.svg'),
          ),
          Text(
            tire!.tirePlace!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
