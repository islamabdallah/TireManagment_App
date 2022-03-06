import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tire_management/core/utils/services/local/cache_helper.dart';

import 'package:tire_management/ui/screens/tire_management/cubit/states.dart';
import 'package:tire_management/ui/screens/tire_management/models/tire_model.dart';
import 'package:tire_management/ui/shared/models/shared.dart';

import '../repositores/tires_repository.dart';

class TiersManageCubit extends Cubit<TiresManageStates> {
  TiersManageCubit() : super(InitialTiresManageState());

  static TiersManageCubit get(context) => BlocProvider.of(context);
  List<Tire> tires = [];
  Tire? firstTire;
  Tire? secondTire;
  SharedModel? shared;
  String? selectedAction;
  String? oldTierStatus;
  bool isBottomSheetOpened = false;
  TiresRepository repo = FakeTiresRepositoryImplementation();


  void getTires() async {
    emit(GetTiresLoadingState());
    try {
       tires = await repo.getTires();
       emit(GetTiresSuccessState());
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
    isBottomSheetOpened = false;
    emit(CancelProcessState());
  }

  void closeBottomSheet() {
    isBottomSheetOpened = false;
    emit(CloseBottomSheetState());
  }

  void replaceTierWithNew(value) {
    secondTire = Tire(position: 'new', serial: '567');
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
}
