import 'package:flutter/material.dart';
import 'package:mucy/ui/elements/button_nav_button.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: const Color(0xFF7393CC),
        extendBody: true,
        body: Container(
          height: model.getSizingService().screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:Backgrounds.blueMucyBackground,
              fit: BoxFit.fitHeight
            )
          ),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: model.getSizingService().blockSizeVertical * 20),
                        child: Container(
                          width: model.getSizingService().blockSizeHorizontal * 90,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'new_session'.tr(),
                            style: kHeadingTextStyle.copyWith(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        width: model.getSizingService().blockSizeHorizontal * 90,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'session_greeting'.tr() + ' ${model.name}!',
                            style: kMontserratRegular.copyWith(
                              fontSize: 20,
                              color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          )
        ),
        bottomNavigationBar: BottomNavButton(
          text: 'lets_get_started'.tr(),
          color: const Color(0xff282e4e),
          callback: () => model.navigateToAdultReward(),
        )
      ),
      onModelReady: (model) async {
        await precacheImage(Backgrounds.blueMucyBackground, context);
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}