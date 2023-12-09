import 'package:fello_hackathon/data/models/plan_goal_details_model.dart';
import 'package:fello_hackathon/presentation/goal_creation/goal_creation.dart';
import 'package:fello_hackathon/presentation/resources/colors_manager.dart';
import 'package:fello_hackathon/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class HomeBrandListItem extends StatelessWidget {
  final String logoUrl;
  final String brandName;
  final String brandSubtitle;
  final String discountStatement;
  final double dicountPercentage;
  final PlanGoalDetails planGoalDetails;
  const HomeBrandListItem({
    required this.logoUrl,
    required this.brandName,
    required this.brandSubtitle,
    required this.discountStatement,
    required this.dicountPercentage,
    required this.planGoalDetails,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GoalCreationScreen(
            planGoalDetails: planGoalDetails,
          ),
          settings: RouteSettings(),
        ),
      ),
      child: Container(
        height: AppSize.s100,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.halfWhite,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppSize.s8,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
                ),
                child: Image.network(logoUrl),
              ),
              const SizedBox(
                width: AppSize.s8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(brandName),
                  Text(brandSubtitle),
                  Text(discountStatement),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
