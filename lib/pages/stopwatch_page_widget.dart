import 'package:flutter/material.dart';

class StopwatchPageWidget extends StatefulWidget {
  const StopwatchPageWidget({super.key});

  @override
  State<StatefulWidget> createState() => _StopwatchPageWidgetState();
}

class _StopwatchPageWidgetState extends State<StopwatchPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("stopwatch")));
  }
}
