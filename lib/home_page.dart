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
    return OrientationBuilder(
      builder: (context, orientation) {
        final screen = MediaQuery.of(context).size;
        final screenWidth = screen.width;
        final screenHeight = screen.height;
        final paddingTopHeight = MediaQuery.of(context).padding.top;
        final paddingBottomHeight = MediaQuery.of(context).padding.bottom;
        final itemWidth =
        (screenWidth -
                paddingTopHeight -
                paddingBottomHeight -
                20 * 2 -
                3 * 2 -
                10) /
            4;
        final itemHeight = screenHeight - 30 * 2;
        return Container(
          constraints:
              BoxConstraints(maxWidth: itemWidth, maxHeight: itemHeight),
          alignment: Alignment.center,
          color: Colors.grey,
          child: FlipClock(
            digitSize: itemWidth + ((itemHeight - itemWidth).abs() / 2),
            digitColor: Colors.grey[300],
            width: itemWidth,
            height: itemHeight,
            separatorWidth: 10,
            separatorColor: Colors.grey,
            backgroundColor: Colors.black,
            showBorder: false,
            showSeconds: false,
            digitSpacing: const EdgeInsets.symmetric(horizontal: 3),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
        );
      },
    );
  }
}
