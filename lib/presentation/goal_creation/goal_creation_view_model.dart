import 'dart:async';

import 'package:fello_hackathon/app/base_view_model.dart';

class GoalCreationViewModel extends BaseViewModel
    with GoalCreationViewModelInput, GoalCreationViewModelOutput {
  StreamController amountStreamController = StreamController<int>.broadcast();
  StreamController tenureStreamController = StreamController<int>.broadcast();

  @override
  void viewModelDispose() {
    amountStreamController.close();
    tenureStreamController.close();
  }

  @override
  void viewModelInitiate() {}

  @override
  Sink get inputAmount => amountStreamController.sink;

  @override
  Sink get inputTenure => tenureStreamController.sink;

  @override
  Stream<int> get outputAmount =>
      amountStreamController.stream.map((amount) => _onAmountChange(amount));

  @override
  Stream<int> get outputTenure =>
      tenureStreamController.stream.map((tenure) => _onTenureChange(tenure));

  int _onAmountChange(int amount) {
    return 20;
  }

  int _onTenureChange(int tenure) {
    return 20;
  }
}

mixin GoalCreationViewModelInput {
  Sink get inputAmount;
  Sink get inputTenure;
}

mixin GoalCreationViewModelOutput {
  Stream<int> get outputAmount;
  Stream<int> get outputTenure;
}
