import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';
import 'breathe_viewmodel.dart';

class BreatheView extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);
  final CustomAnimationControl _countControl = CustomAnimationControl.mirror;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BreatheViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        extendBody: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Backgrounds.blueMucyBackground,
              fit: BoxFit.fitHeight
            )
          ),
          height: model.getSizingService().screenHeight,
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              model.updatePage(page);
            },
            children: <Widget>[
              Container(
                height: model.getSizingService().screenHeight,
                child: FadeIn(
                  duration: const Duration(seconds: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: model.getSizingService().blockSizeVertical * 25,
                        width: model.getSizingService().blockSizeHorizontal * 90,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: AutoSizeText(
                            'you_are_done'.tr(),
                            maxLines: 1,
                            style: kHeadingTextStyle.copyWith(
                              fontSize: 35,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: model.getSizingService().blockSizeVertical * 2),
                        width: model.getSizingService().blockSizeHorizontal * 50,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AutoSizeText(
                            'start_breathing'.tr(),
                            maxLines: 2,
                            style: kMontserratRegular.copyWith(
                              fontSize: 20,
                              color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ]
                  ),
                  controller: (controller) => controller.addStatusListener((status) {
                    if (status == AnimationStatus.completed) {
                      _pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                    }
                  }),
                )
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: model.getSizingService().blockSizeVertical * 21,
                      margin: EdgeInsets.only(top: model.getSizingService().blockSizeVertical * 10, bottom: model.getSizingService().blockSizeVertical * 5),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: CustomAnimation<double>(
                          control: _countControl,
                          tween: Tween(
                            begin: 3.0,
                            end: 0.0
                          ),
                          duration: const Duration(seconds: 3, milliseconds: 600),
                          builder: (context, child, value) {
                            int _displayValue = (value).round();

                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              transitionBuilder: (child, animation) {
                                return ScaleTransition(child: child, scale: animation);
                              },
                              child: Text(
                                _displayValue.toString(),
                                style: kHeadingTextStyle.copyWith(
                                  fontSize: 180,
                                  color: Colors.white
                                ),
                                key: ValueKey<int>(_displayValue),
                              )
                            );
                          },
                          animationStatusListener: (status) {
                            if (status == AnimationStatus.forward) {
                              model.updateBreatheMode(true);
                            }
                            else if (status == AnimationStatus.reverse) {
                              model.updateBreatheMode(false);
                            }
                          },
                        )
                      )
                    ),
                    Container(
                      height: model.getSizingService().blockSizeVertical * 5,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(child: child, scale: animation);
                        },
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            model.currentBreatheText,
                            style: kMontserratRegular.copyWith(
                              fontSize: 30,
                              color: Colors.white
                            ),
                            key: ValueKey<String>(model.currentBreatheText),
                          )
                        )
                      )
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => BreatheViewModel(),
    );
  }
}