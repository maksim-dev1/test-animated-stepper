import 'package:flutter/material.dart';

class StepCirclesScreen extends StatefulWidget {
  @override
  _StepCirclesScreenState createState() => _StepCirclesScreenState();
}

class _StepCirclesScreenState extends State<StepCirclesScreen> {
  int currentStep = 0; // Текущий шаг

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const circleSize = 50.0;
    const offset = 20.0; // Смещение для наложения кругов

    return Scaffold(
      appBar: AppBar(title: Text('Step Circles Animation')),
      body: Stack(
        children: List.generate(5, (index) {
          // Определяем, в какой части экрана круг
          final isOnLeft = index < currentStep;

          // Вычисляем позиции для каждого круга
          final targetX = isOnLeft
              ? index * offset // Левый ряд
              : screenWidth -
                  circleSize -
                  (index - currentStep) * offset; // Правый ряд
          final targetY =
              MediaQuery.of(context).size.height / 2 - circleSize / 2;

          return AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: targetX,
            top: targetY,
            child: _buildCircle(isOnLeft ? Colors.green : Colors.red, index),
          );
        }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: currentStep > 0
                  ? () {
                      setState(() {
                        currentStep--;
                      });
                    }
                  : null,
              child: Text('Back'),
            ),
            ElevatedButton(
              onPressed: currentStep < 5
                  ? () {
                      setState(() {
                        currentStep++;
                      });
                    }
                  : null,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  // Метод для создания круга
  Widget _buildCircle(Color color, int index) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          index.toString(),
        ),
      ),
    );
  }
}
