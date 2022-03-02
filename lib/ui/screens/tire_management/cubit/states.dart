import 'package:tire_management/ui/shared/models/shared.dart';

abstract class TiresManageStates {}

class InitialTiresManageState extends TiresManageStates {}

class GetTiresLoadingState extends TiresManageStates {}

class GetTiresSuccessState extends TiresManageStates {}

class SelectTireState extends TiresManageStates {}

class ChangeSelectedActionState extends TiresManageStates {}

class FirstSelectedTireState extends TiresManageStates {}

class CancelProcessState extends TiresManageStates {}

class SaveProcessState extends TiresManageStates {
  SharedModel shared;
  SaveProcessState(this.shared);
}

class SelectNewTierState extends TiresManageStates {}

class CloseBottomSheetState extends TiresManageStates {}
