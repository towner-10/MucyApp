import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:stacked/stacked.dart';
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
              image: Backgrounds.blueMucyBackground,
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
                            'New Session',
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
                            'Welcome to a new session, ${model.name}!',
                            style: kParagraphTextStyle.copyWith(
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
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(15).copyWith(
            bottom: 15 + model.getSizingService().bottomPadding
          ),
          height: 58.0,
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            onTap: () => model.navigateToAdultReward(),
            child: Center(
              child: Text(
                'Let\'s get started',
                style: kBottomButtonTextStyle
              )
            )
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: const Color(0xff282e4e),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}