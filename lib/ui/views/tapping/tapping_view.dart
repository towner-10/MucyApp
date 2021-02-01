import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mucy/ui/elements/translation_animated.dart';
import 'package:mucy/ui/elements/opacity_animated.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'tapping_viewmodel.dart';

class TappingView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TappingViewModel>.reactive(
      builder: (context, model, child) {
        Future.delayed(Duration.zero, () => model.startup());
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Backgrounds.defaultBackground,
              fit: BoxFit.fitHeight
            )
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: model.getSizingService().blockSizeHorizontal * 5),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: model.getSizingService().blockSizeVertical * 7,
                      child: _ComposeWidget(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            model.data[model.index].title,
                            style: kHeadingTextStyle.copyWith(
                              fontSize: 35
                            )
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: model.getSizingService().blockSizeHorizontal * 50,
                      height: model.getSizingService().blockSizeVertical * 40,
                      margin: EdgeInsets.symmetric(vertical: model.getSizingService().blockSizeVertical * 2.5),
                      child: Image(
                        image: AssetImage(model.data[model.index].imagePath),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(
                      height: model.getSizingService().blockSizeVertical * 10,
                      child: _ComposeWidget(
                        child: Text(
                          '"' + model.data[model.index].quote + '"',
                          style: kParagraphTextStyle.copyWith(
                            fontSize: 25
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                )
              ),
            ),
            bottomSheet: FutureBuilder(
              initialData: false,
              future: Future.delayed(const Duration(seconds: 3), () {
                  return true;
                }),
              builder: (context, snap) {
                if (snap.data) {
                  return OpacityAnimatedWidget.tween(
                    opacityEnabled: 1,
                    opacityDisabled: 0,
                    enabled: snap.data,
                    child: Container(
                      margin: EdgeInsets.all(15).copyWith(
                        bottom: 15 + model.getSizingService().bottomPadding
                      ),
                      height: 58.0,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.0),
                        onTap: () => model.nextPage(),
                        child: Center(
                          child: Text(
                            'Continue',
                            style: kBottomButtonTextStyle
                          )
                        )
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: model.data[model.index].color,
                      ),
                    ),
                  );
                }
                return Container(
                  height: 58.0,
                  margin: EdgeInsets.all(15).copyWith(
                    bottom: 15 + model.getSizingService().bottomPadding
                  ),
                );
              }
            )
          )
        );
      },
      viewModelBuilder: () => TappingViewModel(),
    );
  }
}

class _ComposeWidget extends HookViewModelWidget<TappingViewModel> {

  final Widget child;

  _ComposeWidget({this.child});

  @override
  Widget buildViewModelWidget(BuildContext context, TappingViewModel model) {
    AnimationController _animController = useAnimationController(duration: Duration(seconds: 1, milliseconds: 500));

    _animController.reset();
    _animController.forward();

    Animation _animOpacity = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(_animController);

    return FadeTransition(
      opacity: _animOpacity,
      child: TranslationAnimatedWidget.tween(
        translationDisabled: Offset(400, 0),
        translationEnabled: Offset(0, 0),
        child: child
      )
    );
  }
}