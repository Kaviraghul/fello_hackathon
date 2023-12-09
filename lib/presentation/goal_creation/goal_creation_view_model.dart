import 'dart:async';

import 'package:fello_hackathon/app/base_view_model.dart';
import 'package:fello_hackathon/data/models/plan_goal_details_model.dart';

class GoalCreationViewModel extends BaseViewModel
    with GoalCreationViewModelInput, GoalCreationViewModelOutput {
  final PlanGoalDetails planGoalDetails;
  GoalCreationViewModel({required this.planGoalDetails});

  late double currentAmountValue;
  late double currentTenureValue;

  StreamController amountStreamController =
      StreamController<double>.broadcast();
  StreamController tenureStreamController =
      StreamController<double>.broadcast();

  @override
  void viewModelDispose() {
    amountStreamController.close();
    tenureStreamController.close();
  }

  @override
  void viewModelInitiate() {
    currentAmountValue = planGoalDetails.minAmount.toDouble();
    amountStreamController.add(planGoalDetails.minAmount.toDouble());
    currentTenureValue = planGoalDetails.minTenure.toDouble();
  }

  @override
  Sink get inputAmount => amountStreamController.sink;

  @override
  Sink get inputTenure => tenureStreamController.sink;

  @override
  Stream<double> get outputAmount =>
      amountStreamController.stream.map((amount) => _onAmountChange(amount));

  @override
  Stream<double> get outputTenure =>
      tenureStreamController.stream.map((tenure) => _onTenureChange(tenure));

  double _onAmountChange(double amount) {
    return amount;
  }

  double _onTenureChange(double tenure) {
    return tenure;
  }
}

mixin GoalCreationViewModelInput {
  Sink get inputAmount;
  Sink get inputTenure;
}

mixin GoalCreationViewModelOutput {
  Stream<double> get outputAmount;
  Stream<double> get outputTenure;
}
