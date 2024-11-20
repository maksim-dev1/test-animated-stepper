import 'package:custom_stepper/custom_stepper.dart';
import 'package:custom_stepper/custom_stepper_v2.dart';
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

  final List<bool> positions = List.generate(5, (index) => false);

void toggleStep(bool value) {
  setState(() {
    for (int i = 1; i < positions.length - 1; i++) {
      if (positions[i] == false && value == true) {
        positions[i] = true;
        break;
      } else if (positions[i] == true && value == false) {
        positions[i] = false;
        break; 
      }
    }
    print(positions);
  });
}



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
            const Text('Stepper V1'),
            const SizedBox(
              height: 20,
            ),
            CustomStepper(
              completedSteps: completedSteps,
              upcomingSteps: upcomingSteps,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Stepper V2'),
            const SizedBox(
              height: 20,
            ),
            CustomStepperV2(positions: positions),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (completedSteps > 1) {
                        setState(() {
                          // 'Stepper V1'
                          completedSteps--;
                          upcomingSteps++;
                          // 'Stepper V2'
                        });
                      }
                      toggleStep(false);
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
                          // 'Stepper V1'
                          completedSteps++;
                          upcomingSteps--;
                          // 'Stepper V2'
                        });
                      }
                      toggleStep(true);
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 25, color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
