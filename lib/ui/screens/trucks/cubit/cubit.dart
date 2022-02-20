import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tire_management/ui/screens/trucks/cubit/states.dart';
import 'package:tire_management/ui/screens/trucks/models/truck_model.dart';
import 'package:tire_management/ui/screens/trucks/repositores/trucks_repository.dart';

class TruckCubit extends Cubit<TrucksStates> {
  TruckCubit() : super(InitialTruckState());

  static TruckCubit get(context) => BlocProvider.of(context);
  TrucksRepositoryImplementation repo = TrucksRepositoryImplementation();
  TrucksRepository fakeRepo = FakeTrucksRepositoryImplementation();

  List<String> trucksDropdownList = [];
  List<Truck> trucksList = [];

  late Truck selectedTruck;

  // void selectTruck(String? value) {
  //   selectedTruck = value!;
  //   emit(SelectTruckState());
  // }
  //
  // void getHomeData() async {
  //   emit(GetTrucksLoadingState());
  //   try {
  //     var value = await repo.getTrucks();
  //     if (value.data != null) {
  //       if (value.data['flag']) {
  //         if (value.data!['data'] != 0) {
  //           value.data!['data'].forEach((element) {
  //             trucksList.add(Truck.fromJson(element));
  //           });
  //           trucksList.forEach((element) {
  //             trucksDropdownList.add(element.truckNumber!);
  //           });
  //         }
  //         emit(GetTrucksSuccessState());
  //       } else {
  //         emit(GetTrucksErrorState(message: value.data['message'].message!));
  //       }
  //     }
  //   } on DioError catch (error) {
  //     if (error.response != null) {
  //       emit(GetTrucksErrorState(message: error.response!.data['message']));
  //     } else {
  //       print(error.type);
  //       // print(error);
  //       emit(GetTrucksErrorState(
  //           message:
  //               'server error, check your internet connection and try again.'));
  //     }
  //   } catch (error) {
  //     emit(GetTrucksErrorState(message: 'Something wrong!'));
  //   }
  // }

  void selectTruck(String? value) {
    selectedTruck =
        trucksList.firstWhere((truck) => truck.truckNumber == value);
    emit(SelectTruckState());
  }

  void getHomeData() async {
    emit(GetTrucksLoadingState());
    trucksList = await fakeRepo.getTrucks();
    for (var truck in trucksList) {
      trucksDropdownList.add(truck.truckNumber!);
    }
    emit(GetTrucksSuccessState());
  }
}
