import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/utilities/styles.dart';

class BottomNavButton extends StatelessWidget {

  final String text;
  final Color color;
  final Color textColor;
  final Function callback;

  BottomNavButton({required this.text, required this.color, required this.callback, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15).copyWith(
        bottom: 15 + locator<SizingService>().bottomPadding
      ),
      height: locator<SizingService>().blockSizeVertical * 9,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () => callback(),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: AutoSizeText(
              text,
              style: kBottomButtonTextStyle.copyWith(
                color: textColor,
                fontSize: 20
              ),
            ),
          ),
        )
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
      ),
    );
  }
}