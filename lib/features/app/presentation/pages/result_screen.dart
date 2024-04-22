import 'package:bmi_tracker_app/features/app/presentation/components/result_gauge.dart';
import 'package:flutter/material.dart';


class ResultScreen extends StatelessWidget {
  final double bmiResult;

  const ResultScreen({super.key, required this.bmiResult});

  @override
  Widget build(BuildContext context) {
    final String bmiStatus = _getBmiStatus();
    final String bmiInterpretation = _getBmiInterpretation();
    final Color bmiStatusColor = _getBmiStatusColor();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Result"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bmiStatus,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: bmiStatusColor,
                ),
              ),
              const SizedBox(height: 10),
              ResultGauge(
                bmiResult: bmiResult,
              ),
              const SizedBox(height: 10),
              Text(
                bmiInterpretation,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getBmiStatus() {
    final double bmiScore = bmiResult;
    if (bmiScore > 30) {
      return "Obese";
    } else if (bmiScore >= 25) {
      return "Overweight";
    } else if (bmiScore >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String _getBmiInterpretation() {
    final double bmiScore = bmiResult;
    if (bmiScore > 30) {
      return "Please work to reduce obesity";
    } else if (bmiScore >= 25) {
      return "Do regular exercise & reduce weight";
    } else if (bmiScore >= 18.5) {
      return "Enjoy, you are fit";
    } else {
      return "Try to increase weight";
    }
  }

  Color _getBmiStatusColor() {
    final double bmiScore = bmiResult;
    if (bmiScore > 30) {
      return Colors.red;
    } else if (bmiScore >= 25) {
      return Colors.yellow;
    } else if (bmiScore >= 18.5) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }
}
