import 'package:flutter/material.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/models/emotion_data.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/ui/views/emotion/emotion_viewmodel.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:stacked/stacked.dart';

class EmotionUIView extends ViewModelBuilderWidget<EmotionViewModel> {
  final SizingService _sizingService = locator<SizingService>();
  final EmotionData _viewData;

  EmotionUIView(this._viewData);

  @override
  Widget builder(BuildContext context, EmotionViewModel model, Widget? child) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: _viewData.image,
            width: _sizingService.blockSizeHorizontal * 30,
            fit: BoxFit.fitWidth,
          ),
          Container(
            margin: EdgeInsets.all(15),
            width: _sizingService.blockSizeHorizontal * 45,
            height: 50.0,
            child: InkWell(
              onTap: () => model.saveEmotion(_viewData.index),
              child: Center(
                child: Text(
                  _viewData.name,
                  style: kBottomButtonTextStyle
                )
              )
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: _viewData.color,
            ),
          ),
        ],
      ),
    );
  }

  @override
  EmotionViewModel viewModelBuilder(BuildContext context) => EmotionViewModel();
}