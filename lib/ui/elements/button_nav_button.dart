import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/utilities/styles.dart';

class BottomNavButton extends StatelessWidget {

  final String text;
  final Color color;
  final Color textColor;
  final Function callback;

  BottomNavButton({this.text, this.color, this.callback, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15).copyWith(
        bottom: 15 + locator<SizingService>().bottomPadding
      ),
      height: 58.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () => callback(),
        child: Center(
          child: Text(
            text,
            style: kBottomButtonTextStyle.copyWith(
              color: textColor
            )
          )
        )
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
      ),
    );
  }
}