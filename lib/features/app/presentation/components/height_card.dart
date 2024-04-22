import 'package:bmi_tracker_app/features/app/presentation/manager/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeightCard extends StatelessWidget  {

  const HeightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Consumer<HomeProvider>(
        builder: (context, heightProvider, _) {
      return Column(
        children: [
          const Text(
            "Height",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                heightProvider.height.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(width: 10),
              const Text(
                "cm",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              )
            ],
          ),
          Slider(
            min: 50,
            max: 250,
            value: heightProvider.height.toDouble(),
            thumbColor: Colors.red,
            onChanged: (value) {
              heightProvider.height = value.toInt();
            },
          )
        ],
      );})
    );
  }
}