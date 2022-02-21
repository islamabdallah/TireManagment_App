import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tire_management/ui/screens/manage_tires/cubit/states.dart';
import 'package:tire_management/ui/screens/manage_tires/models/tire_model.dart';

enum Actions {
  replaceWithSameTruck,
  replaceWithNewOne,
  replaceWithAnotherTruck,
}

class ManageTiresCubit extends Cubit<ManageTiresStates> {
  ManageTiresCubit() : super(InitialManageTiresState());

  static ManageTiresCubit get(context) => BlocProvider.of(context);
  Tire? firstTire;
  Tire? secondTire;
  String? oldTierStatus;
  String? selectedAction;
  Map<int, String> selectedTiresList = {};

  void changeAction(value) {
    if (value == 'Replace with a new one') {
      secondTire = null;
      selectedTiresList.removeWhere((key, value) => value == 'second');
    }
    selectedAction = value;
    emit(ChangeSelectedActionState());
  }

  void selectFirstTire(Tire tire) {
    // print('firstTire id ${firstTire!.id}');
    // print('firstTire id ${firstTire!.id}');
    // if (firstTire != null && firstTire!.id == tire.id) {
    //   firstTire == null;
    // } else {
    //   firstTire = tire;
    // }

    if (firstTire == null) {
      firstTire = tire;
      selectedTiresList.addAll({tire.id!: 'first'});
      print('selectedList = $selectedTiresList');
    } else {
      if (selectedTiresList[tire.id] != null) {
        if (selectedTiresList[tire.id] == 'first') firstTire = null;
        if (selectedTiresList[tire.id] == 'second') secondTire = null;
        selectedTiresList.remove(tire.id!);
      } else {
        if (selectedAction == 'Replace with a same Truck tire' &&
            secondTire == null) {
          secondTire = tire;
          selectedTiresList.addAll({tire.id!: 'second'});
          print('selectedList = $selectedTiresList');
        }
      }
    }

    emit(FirstSelectedTireState());
  }
}
