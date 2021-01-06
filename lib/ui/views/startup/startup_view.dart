import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            width: model.getSizingService().screenWidth,
            height: model.getSizingService().screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Backgrounds.loadingBackground,
                fit: BoxFit.fitHeight
              )
            ),
            child: Center(
              child: _HookAnimation()
            )
          ),
        );
      },
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}


class _HookAnimation extends HookViewModelWidget<StartupViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, StartupViewModel model) {
    AnimationController _animController = useAnimationController(duration: Duration(seconds: 3))
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          model.navigateToOnboarding();
        }
      });

    Animation _anim = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(_animController);

    return FadeTransition(
      opacity: _anim,
      child: Text(
        "MUCY",
        style: kLoadingTextStyle,
      ),
    );
  }
}