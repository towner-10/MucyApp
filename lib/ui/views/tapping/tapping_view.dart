import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mucy/ui/elements/button_nav_button.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';
import 'tapping_viewmodel.dart';

class TappingView extends StatelessWidget {

  final PageController _pageController = PageController(initialPage: 0);
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TappingViewModel>.reactive(
      builder: (context, model, child) {
        Future.delayed(Duration.zero, () => model.startup());
        return Container(
          height: model.getSizingService().screenHeight,
          decoration: BoxDecoration(
            color: Backgrounds.defaultBackgroundColor
          ),
          child: PageView.builder(
            itemCount: model.data.length,
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              model.updatePage(page);
            },
            itemBuilder: (context, index) {
              return Scaffold(
                extendBody: true,
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: model.getSizingService().blockSizeHorizontal * 5),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: model.getSizingService().blockSizeVertical * 7,
                          child: BounceInRight(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                model.data[index].title,
                                style: kHeadingTextStyle.copyWith(
                                  fontSize: 35
                                )
                              ),
                            ),
                          ),
                        ),
                        ElasticInRight(
                          child: Container(
                            width: model.getSizingService().blockSizeHorizontal * 50,
                            height: model.getSizingService().blockSizeVertical * 40,
                            margin: EdgeInsets.symmetric(vertical: model.getSizingService().blockSizeVertical * 2.5),
                            child: Image(
                              image: AssetImage(model.data[index].imagePath),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: model.getSizingService().blockSizeVertical * 10,
                          child: BounceInRight(
                            child: AutoSizeText(
                              '"' + model.data[index].quote + '"',
                              style: kMontserratRegular.copyWith(
                                fontSize: 25
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                ),
                bottomNavigationBar: FutureBuilder(
                  initialData: false,
                  future: Future.delayed(const Duration(seconds: 3), () {
                      return true;
                    }),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      return FadeIn(
                        child: BottomNavButton(
                          text: 'continue'.tr(), 
                          color: model.data[index].color,
                          callback: () {
                            if (model.currentPage >= 8) model.navigateToBreathe();
                            else _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                          },
                        )
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
              );
            },
          )
        );
      },
      viewModelBuilder: () => TappingViewModel(),
    );
  }
}