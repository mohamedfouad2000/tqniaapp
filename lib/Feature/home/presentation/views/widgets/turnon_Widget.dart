import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:tqniaapp/Core/utils/styles.dart';

class TurnOnWidget extends StatefulWidget {
  const TurnOnWidget({
    super.key,
    required this.txt,
    required this.Image,
  });
  final String txt;
  final String Image;
  @override
  State<TurnOnWidget> createState() => _TurnOnWidgetState();
}

class _TurnOnWidgetState extends State<TurnOnWidget> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFFEFF1F3),
            child: Center(
              child: Image(
                image: AssetImage(
                  widget.Image,
                ),
                height: 24,
                width: 24,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            widget.txt,
            style: StylesData.font16.copyWith(color: const Color(0xFF1C1243)),
          ),
          const Spacer(),
          FlutterSwitch(
            width: 36,
            height: 20,
            value: _switchValue,
            padding: 2.0,
            toggleSize: 16.0,
            activeColor: const Color(0xFF47C172),
            onToggle: (val) {
              setState(() {
                _switchValue = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
