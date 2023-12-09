import 'package:fello_hackathon/data/models/plan_goal_details_model.dart';

class Brand {
  final int id;
  final String brandName;
  final String brandLogo;
  final String brandSubtitle;
  final String discountStatement;
  final double discountPercentage;
  final double minSavingsAmount;
  final PlanGoalDetails planGoalDetails;

  Brand({
    required this.id,
    required this.brandName,
    required this.brandLogo,
    required this.brandSubtitle,
    required this.discountStatement,
    required this.discountPercentage,
    required this.minSavingsAmount,
    required this.planGoalDetails,
  });

  factory Brand.fromMap(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      brandName: json['brandName'],
      brandLogo: json['brandLogo'],
      brandSubtitle: json['brandSubtitle'],
      discountStatement: json['discountStatement'],
      discountPercentage: json['dicountPercentage'],
      minSavingsAmount: json['minSavingsAmount'],
      planGoalDetails: PlanGoalDetails.fromMap(json['planGoalDetails']),
    );
  }
}
