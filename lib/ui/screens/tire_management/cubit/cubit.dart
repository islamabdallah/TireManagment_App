import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tire_management/core/utils/services/local/cache_helper.dart';

import 'package:tire_management/ui/screens/tire_management/cubit/states.dart';
import 'package:tire_management/ui/screens/tire_management/models/tire_model.dart';
import 'package:tire_management/ui/shared/models/shared.dart';

class TiresManageCubit extends Cubit<TiresManageStates> {
  TiresManageCubit() : super(InitialTiresManageState());

  static TiresManageCubit get(context) => BlocProvider.of(context);
  TireModel? firstTire;
  TireModel? secondTire;
  SharedModel? shared;
  String? selectedAction;
  bool isBottomSheetOpened = false;

  void changeAction(value) {
    selectedAction = value;
    emit(ChangeSelectedActionState());
  }

  void selectTire(TireModel tire) {
    if (firstTire == null) {
      firstTire = tire;
      isBottomSheetOpened = true;
      print('firstTire id ${firstTire!.name}');
      print('Tire id ${tire.name}');
    } else {
      if (firstTire!.name == tire.name && selectedAction == null) {
        firstTire = null;
        isBottomSheetOpened = false;
      } else if (firstTire!.name != tire.name && selectedAction == null) {
        firstTire = tire;
        isBottomSheetOpened = true;
        print('firstTire id ${firstTire!.name}');
        print('Tire id ${tire.name}');
      } else if (selectedAction != null && tire.name != firstTire!.name) {
        secondTire = tire;
        isBottomSheetOpened = true;
        print('firstTire id ${secondTire!.name}');
        print('Tire id ${tire.name}');
      }
    }

    emit(FirstSelectedTireState());
  }

  void cancelProcess() {
    firstTire = null;
    secondTire = null;
    selectedAction = null;
    isBottomSheetOpened = false;
    emit(CancelProcessState());
  }

  void closeBottomSheet() {
    isBottomSheetOpened = false;
    emit(CloseBottomSheetState());
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
