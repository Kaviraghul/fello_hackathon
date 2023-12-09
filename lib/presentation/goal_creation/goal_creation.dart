import 'package:fello_hackathon/data/models/plan_goal_details_model.dart';
import 'package:fello_hackathon/presentation/components/sliders/sliders.dart';
import 'package:fello_hackathon/presentation/goal_creation/goal_creation_view_model.dart';
import 'package:fello_hackathon/presentation/resources/colors_manager.dart';
import 'package:fello_hackathon/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GoalCreationScreen extends StatefulWidget {
  final PlanGoalDetails planGoalDetails;
  const GoalCreationScreen({
    required this.planGoalDetails,
    super.key,
  });

  @override
  State<GoalCreationScreen> createState() => _GoalCreationScreenState();
}

class _GoalCreationScreenState extends State<GoalCreationScreen> {
  late GoalCreationViewModel goalCreationViewModel =
      GoalCreationViewModel(planGoalDetails: widget.planGoalDetails);

  @override
  void initState() {
    goalCreationViewModel.viewModelInitiate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(2010, 35),
      ChartData(2011, 13),
      ChartData(2012, 34),
      ChartData(2013, 27),
      ChartData(2014, 40)
    ];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: AppSize.s300,
                child: SfCartesianChart(
                  series: <ChartSeries>[
                    SplineSeries<ChartData, int>(
                      dataSource: chartData,
                      // Dash values for spline
                      dashArray: <double>[5, 5],
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select your amount"),
                  StreamBuilder(
                    stream: goalCreationViewModel.outputAmount,
                    builder: ((context, snapshot) {
                      return Text(
                        snapshot.data.toString(),
                      );
                    }),
                  )
                ],
              ),
              AppSliders(
                minValue: widget.planGoalDetails.minAmount.toDouble(),
                maxValue: widget.planGoalDetails.maxAmount.toDouble(),
                currentValue: widget.planGoalDetails.minAmount.toDouble(),
                divisionsValue: widget.planGoalDetails.amountDivisions,
                onDrag: (double newValue) {
                  goalCreationViewModel.inputAmount.add(newValue);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select your Tenure"),
                  StreamBuilder(
                    stream: goalCreationViewModel.outputTenure,
                    builder: ((context, snapshot) {
                      return Text(
                        snapshot.data.toString(),
                      );
                    }),
                  )
                ],
              ),
              AppSliders(
                minValue: widget.planGoalDetails.minTenure.toDouble(),
                maxValue: widget.planGoalDetails.maxTenure.toDouble(),
                currentValue: widget.planGoalDetails.minTenure.toDouble(),
                divisionsValue: widget.planGoalDetails.tenureDivisions,
                onDrag: (double newValue) {
                  goalCreationViewModel.inputTenure.add(newValue);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.black,
            minimumSize: Size(88, 36),
            padding: EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Calculate',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final int x;
  final int y;

  ChartData(this.x, this.y);
}
