import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:stacked/stacked.dart';
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
              child: FadeIn(
                duration: Duration(seconds: 3),
                child: Text(
                  "MUCY",
                  style: kLoadingTextStyle,
                ),
                controller: (controller) => controller.addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    model.navigateToOnboarding();
                  }
                }),
              )
            )
          ),
        );
      },
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}