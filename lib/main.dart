import 'package:custom_stepper/custom_stepper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int completedSteps = 1;
  int upcomingSteps = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom stepper'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomStepper(
              completedSteps: completedSteps,
              upcomingSteps: upcomingSteps,
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (completedSteps > 1) {
                        setState(() {
                          completedSteps--;
                          upcomingSteps++;
                        });
                      }
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (upcomingSteps > 1) {
                        setState(() {
                          completedSteps++;
                          upcomingSteps--;
                        });
                      }
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 25, color: Colors.green),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
