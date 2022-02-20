import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'fake_data.dart';
import 'component/tire.dart';
import 'models/tire_model.dart';

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  bool enable = false;
  double offset = 0;

  var isBottomSheetShowed = false;

  List<TireModel> tireModel = [];

  @override
  void initState() {
    super.initState();

    for (var tier in truck14Tires) {
      tireModel.add(TireModel.fromJson(tier));
    }

    print(tireModel);
  }

   TireModel? getTire(name) {
    var x = tireModel.indexWhere((tire) => tire.name==name);
    if(x!=-1){
      return tireModel[x];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, String> data;
    // data = shovel4Tires;
    // data = truckMixer10Tires;
    // data = truckMixer12Tires;
    // data = concretePump14Tires;
    // data = cementTanker22Tires;
    // data = cementTanker24Tires;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isBottomSheetShowed = !isBottomSheetShowed;
          });
        },
      ),
      bottomSheet: isBottomSheetShowed
          ? BottomSheet(
              builder: (BuildContext context) {
                return Container(
                  height: 205.h,
                  width: 1.sw,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'test',
                          style: TextStyle(
                              fontSize: 21.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'test',
                          style: TextStyle(
                              fontSize: 21.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'test',
                          style: TextStyle(
                              fontSize: 21.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'test',
                          style: TextStyle(
                              fontSize: 21.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'test',
                          style: TextStyle(
                              fontSize: 21.sp, fontWeight: FontWeight.bold),
                        ),
                        Center(
                          child: SizedBox(
                            width: 337.w,
                            height: 47.h,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Actions'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              onClosing: () {},
            )
          : const SizedBox(),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(bottom: isBottomSheetShowed ? 205.h : 0.h),
        child: Center(
          child: Container(
            height: 695.h,
            // color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Tier(
                                data: getTire('F1'),
                              ),
                              Tier(
                                data:getTire('F2')
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Tier(
                                data: getTire('F5')
                              ),
                              Tier(
                                data: getTire('F6')
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Tier(
                              data: getTire('F9')
                              ),
                              Tier(
                                  data: getTire('F10')
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Tier(
                                data: getTire('R1')
                              ),
                              Tier(
                                data:  getTire('R2')
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Tier(
                                data:  getTire('R5')
                              ),
                              Tier(
                                data:  getTire('R6')
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Tier(
                                  data:  getTire('R9')

                              ),
                              Tier(
                                  data:  getTire('R10')

                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SimpleShadow(
                  opacity: 0.2,
                  // Default: 0.5
                  color: Colors.white,
                  // Default: Black
                  offset: const Offset(5, 5),
                  // Default: Offset(2, 2)
                  sigma: 7,
                  child: Container(
                    // color: Colors.red,
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    height: 665.h,
                    child: SvgPicture.asset(
                      "assets/icons/trailer2.svg",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Tier(
                                  data:  getTire('F3')

                              ),
                              Tier(
                                  data:  getTire('F4')

                              ),
                            ],
                          ),
                          Row(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Tier(
                                  data:  getTire('F7')

                              ),
                              Tier(
                                  data:  getTire('F8')

                              ),
                            ],
                          ),
                          Row(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Tier(
                                  data:  getTire('F11')

                              ),
                              Tier(
                                  data:  getTire('F12')

                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Tier(
                                  data:  getTire('R3')

                              ),
                              Tier(
                                  data:  getTire('R4')
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Tier(
                                  data:  getTire('R7')
                              ),
                              Tier(
                                  data:  getTire('R8')
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Tier(
                                  data:  getTire('R11')
                              ),
                              Tier(
                                  data:  getTire('R12')
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
