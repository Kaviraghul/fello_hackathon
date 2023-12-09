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
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: widget.minValue,
      max: widget.maxValue,
      value: widget.currentValue,
      onChanged: (newValue) {
        widget.onDrag(newValue);
      },
      divisions: widget.divisionsValue,
    );
  }
}
