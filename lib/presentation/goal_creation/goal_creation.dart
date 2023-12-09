import 'package:fello_hackathon/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GoalCreationScreen extends StatefulWidget {
  const GoalCreationScreen({super.key});

  @override
  State<GoalCreationScreen> createState() => _GoalCreationScreenState();
}

class _GoalCreationScreenState extends State<GoalCreationScreen> {
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
              Container(
                color: Colors.yellow,
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
              const Text("Select your amount"),
              const SliderExample(),
              const SizedBox(
                height: 30,
              ),
              const Text("Select your tenure"),
              const SliderExample(),
            ],
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

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 5,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}
