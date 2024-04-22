import 'package:bmi_tracker_app/core/routing/routes.dart';
import 'package:bmi_tracker_app/features/app/domain/entities/bmi.dart';
import 'package:bmi_tracker_app/features/app/presentation/components/height_card.dart';
import 'package:bmi_tracker_app/features/app/presentation/components/weight_card.dart';
import 'package:bmi_tracker_app/features/app/presentation/manager/home_provider.dart';
import 'package:bmi_tracker_app/features/auth/presentation/manager/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Tracker',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () async {
                  await authProvider.signOutUser().then((value) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.loginScreen, (context) => false);
                  });
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flex(
                        mainAxisAlignment: MainAxisAlignment.center,
                        direction: Axis.horizontal,
                        children: [
                          HeightCard(),
                          WeightCard(),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            double bmi = Provider.of<HomeProvider>(context,
                                    listen: false)
                                .calculateBMI();
                            Navigator.pushNamed(context, Routes.resultScreen,
                                arguments: bmi);
                          },
                          child: const Text(
                            'Calculate',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text(
                    'Your BMI  ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(child: Divider())
                ],
              ),
            ),
            Expanded(
                child: Consumer<HomeProvider>(builder: (context, provider, _) {
              return FutureBuilder<List<BMI>>(
                future: provider.fetchBMIHistory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  List<BMI> bmiHistory = snapshot.data ?? [];
                  if (bmiHistory.isEmpty) {
                    return const Center(
                      child: Text(
                        'No BMI yet',
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: bmiHistory.length,
                    itemBuilder: (context, index) {
                      final entry = bmiHistory[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        elevation: 4.0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date: ${DateFormat.yMMMMd().format(entry.timestamp)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Weight: ${entry.weight} kg'),
                                  Text(
                                      'BMI: ${entry.bmi.toStringAsFixed(1)}'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Height: ${entry.height} m'),

                                  Text('Status: ${entry.status}'),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, Routes.resultScreen,
                                          arguments: entry.bmi);
                                    },
                                    icon: const Icon(Icons.read_more,color: Colors.indigo,),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      provider.deleteBMIModel(entry.id);
                                    },
                                    icon: const Icon(Icons.delete,color: Colors.red,),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            })),
          ],
        ));
  }
}
