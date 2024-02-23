import 'package:flip_board/flip_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flipclock/hex_color.dart';
import 'package:flutter_flipclock/setting_page.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetStorage box = GetStorage();
  Color _bgColor = Colors.grey;
  Color _digitalColor = Colors.grey[300]!;
  Color _digitalBgColor = Colors.black;
  Color _digitalShadowColor = Colors.pink[100]!;

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() {
    int? bgColor = box.read('bgColor');
    if (bgColor != null) {
      _bgColor = HexColor(bgColor.toRadixString(16));
    } else {
      box.write('bgColor', _bgColor.value);
    }
    int? digitalColor = box.read('digitalColor');
    print(digitalColor);
    if (digitalColor != null) {
      _digitalColor = HexColor(digitalColor.toRadixString(16));
    } else {
      box.write('digitalColor', _digitalColor.value);
    }
    int? digitalBgColor = box.read('digitalBgColor');
    if (digitalBgColor != null) {
      _digitalBgColor = HexColor(digitalBgColor.toRadixString(16));
    } else {
      box.write('digitalBgColor', _digitalBgColor.value);
    }
    int? digitalShadowColor = box.read('digitalShadowColor');
    if (digitalShadowColor != null) {
      _digitalShadowColor = HexColor(digitalShadowColor.toRadixString(16));
    } else {
      box.write('digitalShadowColor', _digitalShadowColor.value);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final screen = MediaQuery.of(context).size;
        final screenWidth = screen.width;
        final screenHeight = screen.height;
        final paddingTopHeight = MediaQuery.of(context).padding.top;
        final paddingBottomHeight = MediaQuery.of(context).padding.bottom;
        final itemWidth = (screenWidth -
                paddingTopHeight -
                paddingBottomHeight -
                20 * 2 -
                3 * 2 -
                10) /
            4;
        final itemHeight = screenHeight - 30 * 2;
        return GestureDetector(
          onLongPress: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return const SettingPage();
            })).then((value) {
              Phoenix.rebirth(context);
            });
          },
          child: Container(
            constraints:
                BoxConstraints(maxWidth: itemWidth, maxHeight: itemHeight),
            alignment: Alignment.center,
            color: _bgColor,
            child: FlipClock(
              digitSize: itemWidth + ((itemHeight - itemWidth).abs() / 2),
              digitColor: _digitalColor,
              digitShadowColor: _digitalShadowColor,
              width: itemWidth,
              height: itemHeight,
              separatorWidth: 10,
              backgroundColor: _digitalBgColor,
              showBorder: false,
              showSeconds: false,
              digitSpacing: const EdgeInsets.symmetric(horizontal: 3),
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        );
      },
    );
  }
}
