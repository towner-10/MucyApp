import 'package:flutter/material.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:stacked/stacked.dart';
import 'breathe_viewmodel.dart';

class BreatheView extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);
  final CustomAnimationControl _countControl = CustomAnimationControl.MIRROR;

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
                child: CustomAnimation<double>(
                  tween: Tween(
                    begin: 0.0,
                    end: 1.0
                  ),
                  startPosition: 0.0,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(seconds: 3),
                  builder: (context, child, value) {
                    return Opacity(
                      opacity: value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: model.getSizingService().blockSizeVertical * 25,
                            width: model.getSizingService().blockSizeHorizontal * 90,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                'Hooray! You\'re done.',
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
                              child: Text(
                                'Now, let\'s do some breathing.',
                                style: kParagraphTextStyle.copyWith(
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ]
                      ),
                    );
                  },
                  animationStatusListener: (AnimationStatus status) {
                    if (status == AnimationStatus.completed) {
                      _pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                    }
                  },
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
                      child: AnimatedCrossFade(
                        sizeCurve: Curves.bounceIn,
                        alignment: Alignment.center,
                        firstChild: Text(
                          "Breathe in...",
                          style: kParagraphTextStyle.copyWith(
                            fontSize: 30,
                            color: Colors.white
                          ),
                        ), 
                        secondChild: Text(
                          "Breathe out...",
                          style: kParagraphTextStyle.copyWith(
                            fontSize: 30,
                            color: Colors.white
                          ),
                        ),
                        crossFadeState: model.breatheIn ? CrossFadeState.showFirst : CrossFadeState.showSecond, 
                        duration: const Duration(milliseconds: 250)
                      )
                    ),
                  ]
                ),
              ),
              Container(
                height: model.getSizingService().screenHeight,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: model.getSizingService().blockSizeVertical * 10),
                      width: model.getSizingService().blockSizeHorizontal * 60,
                      child: Text(
                        'Are you feeling better?',
                        style: kHeadingTextStyle.copyWith(
                          fontSize: 35
                        ),
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => BreatheViewModel(),
    );
  }
}