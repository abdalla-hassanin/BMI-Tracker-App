import 'package:bmi_tracker_app/features/app/presentation/manager/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeightCard extends StatelessWidget {
  const WeightCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Consumer<HomeProvider>(builder: (context, weightProvider, _) {
          return Column(
            children: [
              const Text(
                "Weight(Kg)",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                        ),
                        onPressed: () {
                          if (weightProvider.weight > 0) {
                            weightProvider.weight--;
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      weightProvider.weight.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    IconButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                        ),
                        onPressed: () {
                          if (weightProvider.weight < 200) {
                            weightProvider.weight++;
                          }
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
