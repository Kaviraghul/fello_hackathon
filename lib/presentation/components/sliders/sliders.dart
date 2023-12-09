import 'package:flutter/material.dart';

class AppSliders extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final int divisionsValue;
  final double currentValue;
  final ValueChanged<double> onDrag;
  const AppSliders({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.divisionsValue,
    required this.currentValue,
    required this.onDrag,
  }) : super(key: key);

  @override
  State<AppSliders> createState() => _AppSlidersState();
}

class _AppSlidersState extends State<AppSliders> {
  late double _currentSliderValue;

  @override
  void initState() {
    _currentSliderValue = widget.minValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Slider(
        value: _currentSliderValue,
        min: widget.minValue,
        max: widget.maxValue,
        divisions: 9,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
          widget.onDrag.call(value);
        },
      ),
    );
  }
}
