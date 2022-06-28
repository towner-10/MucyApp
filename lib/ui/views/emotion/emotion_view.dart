import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:mucy/models/emotion_data.dart';
import 'package:mucy/ui/elements/emotion_ui_element.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stacked/stacked.dart';
import 'emotion_viewmodel.dart';

class EmotionView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmotionViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        extendBody: true,
        body: Container(
          decoration: BoxDecoration(
            color: Backgrounds.defaultBackgroundColor
          ),
          height: model.getSizingService().screenHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: model.getSizingService().blockSizeHorizontal * 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: model.getSizingService().blockSizeVertical * 15 + model.getSizingService().topPadding),
                  child: Column(
                    children: [
                      Text(
                        'mucy_emotion'.tr(),
                        style: kHeadingTextStyle.copyWith(
                          fontSize: 35
                        ),
                      ),
                      Text(
                        'how_are_you_feeling'.tr(),
                        style: kMontserratRegular.copyWith(
                          fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: LiveList(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    showItemDuration: const Duration(seconds: 1),
                    showItemInterval: const Duration(milliseconds: 250),
                    itemBuilder: (context, index, anim) {
                      return FadeTransition(
                        opacity: Tween<double>(
                          begin: 0,
                          end: 1
                        ).animate(anim),
                        child: EmotionUIView(EmotionData.emotionData[index])
                      );
                    }
                  ),
                )
              ],
            )
          ),
        ),
      ),
      viewModelBuilder: () => EmotionViewModel(),
    );
  }
}