import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_flipclock/hex_color.dart';
import 'package:get_storage/get_storage.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  GetStorage box = GetStorage();
  Color _pickerBgColor = Colors.grey;
  Color _currentBgColor = Colors.grey;
  Color _pickerDigitalColor = Colors.white;
  Color _currentDigitalColor = Colors.white;
  Color _pickerDigitalBgColor = Colors.black;
  Color _currentDigitalBgColor = Colors.black;
  Color _pickerDigitalShadowColor = Colors.pink;
  Color _currentDigitalShadowColor = Colors.pink;

  @override
  void initState() {
    int? bgColor = box.read('bgColor');
    int? digitalColor = box.read('digitalColor');
    int? digitalBgColor = box.read('digitalBgColor');
    int? digitalShadowColor = box.read('digitalShadowColor');
    if (bgColor != null) {
      _currentBgColor = HexColor(bgColor.toRadixString(16));
    }
    if (digitalColor != null) {
      _currentDigitalColor = HexColor(digitalColor.toRadixString(16));
    }
    if (digitalBgColor != null) {
      _currentDigitalBgColor = HexColor(digitalBgColor.toRadixString(16));
    }
    if (digitalShadowColor != null) {
      _currentDigitalShadowColor =
          HexColor(digitalShadowColor.toRadixString(16));
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
        actions: <Widget>[
          TextButton(
            onPressed: onSetDefault,
            child: const Row(
              children: [
                Text('重置默认'),
              ],
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onBgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("背景颜色"),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: _currentBgColor,
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onDigitalColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("数字颜色"),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: _currentDigitalColor,
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onDigitalBgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("数字板背景颜色"),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: _currentDigitalBgColor,
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onDigitalShadowColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("数字阴影颜色"),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: _currentDigitalShadowColor,
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
          ],
        ),
      ),
    );
  }

  void onBgColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('选择一个颜色'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _pickerBgColor,
              onColorChanged: (Color color) {
                setState(() {
                  _pickerBgColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('确定'),
              onPressed: () {
                setState(() {
                  _currentBgColor = _pickerBgColor;
                });
                box.write('bgColor', _currentBgColor.value);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onDigitalColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('选择一个颜色'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _pickerDigitalColor,
              onColorChanged: (Color color) {
                setState(() {
                  _pickerDigitalColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('确定'),
              onPressed: () {
                setState(() => _currentDigitalColor = _pickerDigitalColor);
                box.write('digitalColor', _currentDigitalColor.value);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onDigitalBgColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('选择一个颜色'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _pickerDigitalBgColor,
              onColorChanged: (Color color) {
                setState(() {
                  _pickerDigitalBgColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('确定'),
              onPressed: () {
                setState(() {
                  _currentDigitalBgColor = _pickerDigitalBgColor;
                });
                box.write('digitalBgColor', _currentDigitalBgColor.value);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onDigitalShadowColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('选择一个颜色'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _pickerDigitalShadowColor,
              onColorChanged: (Color color) {
                setState(() {
                  _pickerDigitalShadowColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('确定'),
              onPressed: () {
                setState(() {
                  _currentDigitalShadowColor = _pickerDigitalShadowColor;
                });
                box.write(
                    'digitalShadowColor', _currentDigitalShadowColor.value);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onSetDefault() {
    _currentBgColor = Colors.grey;
    _currentDigitalColor = Colors.white;
    _currentDigitalBgColor = Colors.black;
    _currentDigitalShadowColor = Colors.pink;
    box.write('bgColor', _currentBgColor.value);
    box.write('digitalColor', _currentDigitalColor.value);
    box.write('digitalBgColor', _currentDigitalBgColor.value);
    box.write('digitalShadowColor', _currentDigitalShadowColor.value);
    setState(() {});
  }
}
