import 'package:flutter/material.dart';

// class CustomStepper extends StatefulWidget {
//   final int completedSteps;
//   final int upcomingSteps;

//   const CustomStepper({
//     super.key,
//     required this.completedSteps,
//     required this.upcomingSteps,
//   });

//   @override
//   State<CustomStepper> createState() => _CustomStepperState();
// }

// class _CustomStepperState extends State<CustomStepper> {
//   final double stepWidth = 22;
//   final double stepOverlap = 10;

//   double calculateBoxWidth(int stepCount) {
//     return stepWidth + (stepCount - 1) * stepOverlap;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: DecoratedBox(
//         decoration: const BoxDecoration(
//           color: Colors.red,
//         ),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: List.generate(
//             5,
//             (index) {
//               return Positioned(
//                 child: const SizedBox(
//                   width: 22,
//                   height: 22,
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.white,
//                           offset: Offset(3, 0),
//                         ),
//                         BoxShadow(
//                           color: Colors.white,
//                           offset: Offset(-3, 0),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomStepper extends StatefulWidget {
  final int completedSteps;
  final int upcomingSteps;

  const CustomStepper({
    super.key,
    required this.completedSteps,
    required this.upcomingSteps,
  });

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  final double stepWidth = 22;
  final double stepOverlap = 10;

  double calculateBoxWidth(int stepCount) {
    return stepWidth + (stepCount - 1) * stepOverlap;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: calculateBoxWidth(widget.completedSteps),
          height: 22,
          child: Stack(
            children: List.generate(widget.completedSteps, (index) {
              return Positioned(
                left: stepOverlap * index,
                child: SizedBox(
                  width: stepWidth,
                  height: 22,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-3, 0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '${widget.completedSteps}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: 4,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: calculateBoxWidth(widget.upcomingSteps),
          height: 22,
          child: Stack(
            children: List.generate(
              widget.upcomingSteps,
              (index) {
                return Positioned(
                  right: stepOverlap * index,
                  child: SizedBox(
                    width: stepWidth,
                    height: 22,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(3, 0),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '${widget.completedSteps + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
