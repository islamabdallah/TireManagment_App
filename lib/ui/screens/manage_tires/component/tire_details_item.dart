import 'package:flutter/material.dart';
import 'package:tire_management/ui/screens/manage_tires/component/default_drop_down.dart';
import 'package:tire_management/ui/screens/manage_tires/cubit/cubit.dart';
import 'package:tire_management/ui/screens/manage_tires/models/tire_model.dart';
import 'package:tire_management/ui/shared/components/container_info_item.dart';
import 'package:tire_management/ui/shared/components/details_row.dart';

class TireDetailsItem extends StatelessWidget {
  Tire? tire;
  BuildContext context;
  TireDetailsItem({required this.tire, required this.context});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsRow(
          title: 'Tire Details',
          imagePath: 'assets/images/tire.svg',
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InfoItem(
                value: tire!.serialNumber!.toString(),
                title: 'SerialNumber',
              ),
              Row(
                children: [
                  Expanded(
                    child: InfoItem(
                      value: tire!.type!,
                      title: 'Type',
                    ),
                  ),
                  InfoItem(
                    value: tire!.make!,
                    title: 'Make',
                  ),
                ],
              ),
              InfoItem(
                value: tire!.manufactor!,
                title: 'Manfactor',
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
