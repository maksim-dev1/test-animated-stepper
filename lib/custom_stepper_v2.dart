import 'package:flutter/material.dart';

class CustomStepperV2 extends StatelessWidget {
  final List<bool> positions;
  const CustomStepperV2({super.key, required this.positions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          // Черная линия по центру
          Positioned(
            top: 10, // Отступ сверху, можно регулировать по необходимости
            left: 0,
            right: 0,
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
          Stack(
            children: List.generate(positions.length, (index) {
              if (index == 0) {
                return Positioned(
                  left: 0,
                  child: SizedBox(
                    width: 22,
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
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                );
              }

              // if (index == positions.length - 1) {
              //   return Positioned(
              //     right: 0,
              //     child: SizedBox(
              //       width: 22,
              //       height: 22,
              //       child: DecoratedBox(
              //         decoration: BoxDecoration(
              //           color: Colors.black,
              //           borderRadius: BorderRadius.circular(10),
              //           boxShadow: const [
              //             BoxShadow(
              //               color: Colors.white,
              //               offset: Offset(-3, 0),
              //             ),
              //           ],
              //         ),
              //         child: Center(
              //           child: Text(
              //             '${positions.length}',
              //             style: const TextStyle(
              //                 color: Colors.white, fontSize: 12),
              //           ),
              //         ),
              //       ),
              //     ),
              //   );
              // }

              return AnimatedAlign(
                alignment: positions[index]
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: 22,
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
                        '${index + 1}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
