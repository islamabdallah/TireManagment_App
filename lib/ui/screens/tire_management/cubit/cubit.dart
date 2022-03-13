import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tire_management/core/utils/services/local/cache_helper.dart';

import 'package:tire_management/ui/screens/tire_management/cubit/states.dart';
import 'package:tire_management/ui/screens/tire_management/models/tire_model.dart';
import 'package:tire_management/ui/screens/tire_management/models/tire_position_model.dart';
import 'package:tire_management/ui/screens/tire_management/models/truck_movement_model.dart';
import 'package:tire_management/ui/shared/constants.dart';
import 'package:tire_management/ui/shared/models/shared.dart';

import '../repositores/tires_repository.dart';

class TiersManageCubit extends Cubit<TiresManageStates> {
  TiersManageCubit() : super(InitialTiresManageState());

  static TiersManageCubit get(context) => BlocProvider.of(context);
  List<Tire> tires = [];
  List<Tire> newTires = [];
  Tire? firstTire;
  Tire? secondTire;
  SharedModel? shared;
  String? selectedAction;
  String? oldTierStatus;
  bool isBottomSheetOpened = false;
  TiresRepository repo = TiresRepositoryImplementation();

  void getTires() async {
    tires.clear();
    newTires.clear();
    emit(GetTiresLoadingState());
    try {
      var result = await repo.getTires();
      if (result.data['flag']) {
        for (var tire in result.data['truckTires']) {
          tires.add(Tire.fromJson(tire));
        }
        // for (var tire in result.data['newTires']) {
        //   newTires.add(Tire.fromJson(tire));
        // }
        emit(GetTiresSuccessState());
      }
    } on DioError catch (error) {
      if (error.response != null) {
        print(error.response!.data['message']);
        emit(GetTiresErrorState(error.response!.data['message']));
      } else {
        print(error.type);
        // print(error);
        emit(GetTiresErrorState(
            'server error, check your internet connection and try again.'));
      }
    } catch (error) {
      print(error);
      emit(GetTiresErrorState('Something wrong!'));
    }
  }

  Tire? getTire(name) {
    var x = tires.indexWhere((tire) => tire.position == name);
    if (x != -1) {
      return tires[x];
    } else {
      return null;
    }
  }

  void changeAction(value) {
    selectedAction = value;
    emit(ChangeSelectedActionState());
  }

  void selectOldTiersStatus(value) {
    oldTierStatus = value;
    emit(ChangeSelectedActionState());
  }

  void selectTire(Tire tire) {
    if (firstTire == null) {
      firstTire = tire;
      isBottomSheetOpened = true;
      print('firstTire id ${firstTire!.position}');
      print('Tire id ${tire.position}');
    } else {
      if (firstTire!.position == tire.position && selectedAction == null) {
        firstTire = null;
        isBottomSheetOpened = false;
      } else if (firstTire!.position != tire.position &&
          selectedAction == null) {
        firstTire = tire;
        isBottomSheetOpened = true;
        print('firstTire id ${firstTire!.position}');
        print('Tire id ${tire.position}');
      } else if (selectedAction != null &&
          tire.position != firstTire!.position) {
        secondTire = tire;
        isBottomSheetOpened = true;
        print('firstTire id ${secondTire!.position}');
        print('Tire id ${tire.position}');
      }
    }

    emit(FirstSelectedTireState());
  }

  void cancelProcess() {
    firstTire = null;
    secondTire = null;
    selectedAction = null;
    oldTierStatus = null;
    clearControllers();
    isBottomSheetOpened = false;
    emit(CancelProcessState());
  }

  void closeBottomSheet() {
    isBottomSheetOpened = false;
    emit(CloseBottomSheetState());
  }

  void replaceTierWithNew(value) {
    secondTire = Tire(id: 20, position: 'new', tireSerial: '567');
    // secondTire = newTires.firstWhere((element) => element.tireSerial==value);
    emit(SelectNewTierState());

  }

  void saveProcess() {
    shared = SharedModel(
      userName: CacheHelper.getData(key: 'userName'),
      action: selectedAction!,
      tire1: firstTire!,
      tire2: secondTire!,
      truckNumber: CacheHelper.getData(key: 'truckNumber'),
    );
    emit(SaveProcessState(shared!));
  }

  TextEditingController t1Depth1 = TextEditingController();
  TextEditingController t1Depth2 = TextEditingController();
  TextEditingController t1Distance = TextEditingController();

  TextEditingController t2Depth1 = TextEditingController();
  TextEditingController t2Depth2 = TextEditingController();
  TextEditingController t2Distance = TextEditingController();

  void clearControllers() {
    t1Depth1.clear();
    t1Depth2.clear();
    t1Distance.clear();
    t2Depth1.clear();
    t2Depth2.clear();
    t2Distance.clear();
  }

  Future<void> startMovement(
    String t1Depth1,
    String t1Depth2,
    String t1Distance,
    String t2Depth1,
    String t2Depth2,
    String t2Distance,
  ) async {
    String truckNO = truckNumber!;
    String userId = userData!.id!;
    String movementType = selectedAction!;

    TirePosition tier1 = TirePosition(
      tireId: firstTire!.id,
      position: selectedAction == 'Replacement'
          ? oldTierStatus!
          : secondTire!.position,
      currentTireDepth: int.parse(t1Depth1),
      sTDThreadDepth: int.parse(t1Depth2),
      kMWhileChange: '$t1Distance Km',
    );

    TirePosition tier2 = TirePosition(
      tireId: secondTire!.id,
      position: firstTire!.position,
      currentTireDepth: int.parse(t2Depth1),
      sTDThreadDepth: int.parse(t2Depth2),
      kMWhileChange: '$t2Distance Km',
    );

    TruckMovementModel lastData = TruckMovementModel(
        truckNumber: truckNO,
        userId: userId,
        movementType: movementType,
        tiresPosition: [tier2, tier1]);
    print(lastData.toJson());

    emit(GetTiresLoadingState());

    try {
      var result = await repo.setTires(lastData);
      if (result.data['flag']) {

        emit(TireMovementSuccessState(result.data['message']));
      }
    } on DioError catch (error) {
      if (error.response != null) {
        print(error.response!.data['message']);
        emit(TireMovementErrorState(error.response!.data['message']));
      } else {
        print(error.type);
        emit(TireMovementErrorState(
            'server error, check your internet connection and try again.'));
      }
    } catch (error) {
      print(error);
      emit(TireMovementErrorState('Something wrong!'));
    }
  }
}
