import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mucy/models/emotion_data.dart';
import 'package:mucy/ui/elements/button_nav_button.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';
import 'ending_viewmodel.dart';

class EndingView extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EndingViewModel>.reactive(
      builder: (context, model, child) => Container(
        decoration: BoxDecoration(
          color: Backgrounds.defaultBackgroundColor
        ),
        child: SingleChildScrollView(
          child: Container(
            height: model.getSizingService().screenHeight,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                model.updatePage(page);
              },
              children: <Widget>[
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Container(
                    height: model.getSizingService().screenHeight,
                    child: Column(
                      children: [
                        BounceInDown(
                          child: Container(
                            width: model.getSizingService().blockSizeHorizontal * 60,
                            height: model.getSizingService().blockSizeVertical * 40,
                            child: Center(
                              child: AutoSizeText(
                                'feeling_better'.tr(),
                                maxLines: 2,
                                style: kHeadingTextStyle.copyWith(
                                  fontSize: 35
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Bounce(
                          child: Container(
                            child: Center(
                              child: Image(
                                image: EmotionData.emotionData[model.emotionIndex].image,
                                width: model.getSizingService().blockSizeHorizontal * 80,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          )
                        )
                      ],
                    )
                  ),
                  bottomNavigationBar: Container(
                    margin: EdgeInsets.all(5).copyWith(
                      bottom: 15 + model.getSizingService().bottomPadding
                    ),
                    height: model.getSizingService().blockSizeVertical * 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FadeInLeft(
                          child: InkWell(
                            onTap: () {
                              model.feelingBetter = false;
                              _pageController.animateToPage(model.currentPage + 1, duration: Duration(milliseconds: 300), curve: Curves.easeInToLinear);
                            },
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              height: model.getSizingService().blockSizeVertical * 9,
                              width: model.getSizingService().blockSizeHorizontal * 45,
                              child: Icon(
                                Icons.close,
                                color: EmotionData.emotionData[model.emotionIndex].color,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  width: 2.0,
                                  color: EmotionData.emotionData[model.emotionIndex].color
                                ),
                                color: EmotionData.emotionData[model.emotionIndex].color.withAlpha(50),
                              ),
                            ),
                          ),
                        ),
                        FadeInRight(
                          child: InkWell(
                            onTap: () {
                              model.feelingBetter = true;
                              _pageController.animateToPage(model.currentPage + 1, duration: Duration(milliseconds: 300), curve: Curves.easeInToLinear);
                            },
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              height: model.getSizingService().blockSizeVertical * 9,
                              width: model.getSizingService().blockSizeHorizontal * 45,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: EmotionData.emotionData[model.emotionIndex].color,
                              ),
                            ),
                          )
                        )
                      ],
                    )
                  ),
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Container(
                    height: model.getSizingService().screenHeight,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: model.getSizingService().blockSizeVertical * 4),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image(
                              image: EmotionData.emotionData[model.emotionIndex].image,
                              height: model.getSizingService().blockSizeVertical * 35,
                              width: model.getSizingService().blockSizeHorizontal * 80,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Bounce(
                          child: Container(
                            height: model.getSizingService().blockSizeVertical * 5,
                            width: model.getSizingService().blockSizeHorizontal * 80,
                            child: AutoSizeText(
                              'you_are_amazing'.tr(),
                              maxLines: 1,
                              style: kHeadingTextStyle.copyWith(
                                fontSize: 35
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          height: model.getSizingService().blockSizeVertical * 5,
                          width: model.getSizingService().blockSizeHorizontal * 70,
                          child: Center(
                            child: AutoSizeText(
                              model.feelingBetter ? 'have_a_mucy_day_better'.tr() : 'have_a_mucy_day'.tr(),
                              maxLines: 1,
                              style: kMontserratRegular.copyWith(
                                fontSize: 20
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: FadeInUp(
                              from: 50,
                              child: Container(
                                width: model.getSizingService().blockSizeHorizontal * 70,
                                height: model.getSizingService().blockSizeVertical * 17,
                                child: Stack(
                                  fit: StackFit.loose,
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Container(
                                      width: model.getSizingService().blockSizeHorizontal * 70,
                                      height: model.getSizingService().blockSizeVertical * 17,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(27.0),
                                        border: Border.all(width: 2.0, color: Colors.black),
                                      ),
                                    ),
                                    Positioned(
                                      top: model.getSizingService().blockSizeVertical * 4,
                                      child: Container(
                                        width: model.getSizingService().blockSizeHorizontal * 70,
                                        child: Divider(
                                          thickness: 2,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: model.getSizingService().blockSizeVertical * 1,
                                      child: Text(
                                        'reward'.tr(),
                                        style: kMontserratSemiBold.copyWith(
                                          fontSize: 18,
                                          color: Colors.black
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ),
                                    Positioned(
                                      bottom: model.getSizingService().blockSizeVertical,
                                      child: Container(
                                        width: model.getSizingService().blockSizeHorizontal * 65,
                                        height: model.getSizingService().blockSizeVertical * 10,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            model.reward == '' ? 'a_mucy_day'.tr() : model.reward,
                                            style: kHeadingTextStyle.copyWith(
                                              fontSize: 50,
                                            ),
                                            textAlign: TextAlign.center,
                                          )
                                        )
                                      )
                                    )
                                  ]
                                ),
                              ),
                            )
                          )
                        )
                      ],
                    )
                  ),
                  bottomNavigationBar: BottomNavButton(
                    text: 'continue'.tr(),
                    color: EmotionData.emotionData[model.emotionIndex].color,
                    callback: () => model.navigateToHome(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => EndingViewModel(),
    );
  }
}