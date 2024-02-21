import 'package:flip_board/flip_clock.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final screenWidth = screen.width;
    final screenHeight = screen.height;
    final paddingTopHeight = MediaQuery.of(context).padding.top;
    final paddingBottomHeight = MediaQuery.of(context).padding.bottom;
    final itemWidth =
        (screenHeight - paddingTopHeight - paddingBottomHeight - 3 * 2 - 50) /
            4;
    final itemHeight = screenWidth - 30 * 2;
    return Container(
      constraints:
          BoxConstraints(maxWidth: screenHeight, maxHeight: screenWidth),
      alignment: Alignment.center,
      color: Colors.grey,
      child: FlipClock(
        flipDirection: AxisDirection.down,
        digitSize: itemWidth + 20,
        width: itemWidth,
        height: itemHeight,
        separatorWidth: 50,
        separatorColor: Colors.white,
        hingeColor: Colors.black,
        backgroundColor: Colors.black,
        showBorder: false,
        showSeconds: false,
        digitSpacing: const EdgeInsets.symmetric(horizontal: 3),
      ),
    );
  }
}
