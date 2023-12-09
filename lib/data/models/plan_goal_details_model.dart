class PlanGoalDetails {
  final int minAmount;
  final int maxAmount;
  final int amountDivisions;
  final int minTenure;
  final int maxTenure;
  final int tenureDivisions;

  PlanGoalDetails({
    required this.minAmount,
    required this.maxAmount,
    required this.amountDivisions,
    required this.minTenure,
    required this.maxTenure,
    required this.tenureDivisions,
  });

  factory PlanGoalDetails.fromMap(Map<String, dynamic> json) {
    return PlanGoalDetails(
      minAmount: json['minAmount'],
      maxAmount: json['maxAmount'],
      amountDivisions: json['amountDivisions'],
      minTenure: json['minTenure'],
      maxTenure: json['maxTenure'],
      tenureDivisions: json['tenureDivisions'],
    );
  }
}
