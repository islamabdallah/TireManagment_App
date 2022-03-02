abstract class TrucksStates {}

class InitialTruckState extends TrucksStates {}

class SelectTruckState extends TrucksStates {}

//get trucks states
class GetTrucksLoadingState extends TrucksStates {}

class GetTrucksSuccessState extends TrucksStates {}

class GetTrucksErrorState extends TrucksStates {
  String message;
  GetTrucksErrorState({required this.message});
}
