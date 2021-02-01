import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mucy/models/emotion_data.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:stacked/stacked.dart';
import 'ending_viewmodel.dart';

class EndingView extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EndingViewModel>.reactive(
      builder: (context, model, child) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Backgrounds.defaultBackground,
            fit: BoxFit.fitHeight
          )
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
                        Container(
                          margin: EdgeInsets.only(top: model.getSizingService().blockSizeVertical * 20),
                          width: model.getSizingService().blockSizeHorizontal * 60,
                          child: Text(
                            'Are you feeling better?',
                            style: kHeadingTextStyle.copyWith(
                              fontSize: 35
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: model.getSizingService().blockSizeVertical * 6),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image(
                              image: EmotionData.emotionData[model.emotionIndex].image,
                              width: model.getSizingService().blockSizeHorizontal * 90,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                  bottomNavigationBar: Container(
                    margin: EdgeInsets.all(5).copyWith(
                      bottom: 15 + model.getSizingService().bottomPadding
                    ),
                    height: 58.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            model.feelingBetter = false;
                            _pageController.animateToPage(model.currentPage + 1, duration: Duration(milliseconds: 300), curve: Curves.easeInToLinear);
                          },
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 58.0,
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
                        InkWell(
                          onTap: () {
                            model.feelingBetter = true;
                            _pageController.animateToPage(model.currentPage + 1, duration: Duration(milliseconds: 300), curve: Curves.easeInToLinear);
                          },
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 58.0,
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
                              width: model.getSizingService().blockSizeHorizontal * 80,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Container(
                          width: model.getSizingService().blockSizeHorizontal * 80,
                          child: FittedBox(
                            child: Text(
                              'You are so amazing!',
                              style: kHeadingTextStyle.copyWith(
                                fontSize: 35
                              ),
                              textAlign: TextAlign.center,
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: model.getSizingService().blockSizeVertical, bottom: model.getSizingService().blockSizeVertical * 5),
                          width: model.getSizingService().blockSizeHorizontal * 50,
                          child: Text(
                            model.feelingBetter ? 'Have a marvelous Mucy Day.' : 'Feel better and have a marvelous Mucy Day.',
                            style: kParagraphTextStyle.copyWith(
                              fontSize: 20
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: model.getSizingService().blockSizeHorizontal * 70,
                            height: model.getSizingService().blockSizeVertical * 18,
                            child: Stack(
                              fit: StackFit.loose,
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  width: model.getSizingService().blockSizeHorizontal * 70,
                                  height: model.getSizingService().blockSizeVertical * 18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(27.0),
                                    border: Border.all(width: 2.0, color: const Color(0xff000000)),
                                  ),
                                ),
                                Positioned(
                                  top: model.getSizingService().blockSizeVertical * 4,
                                  child: Container(
                                    width: 233,
                                    child: Divider(
                                      thickness: 2,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: model.getSizingService().blockSizeVertical * 1.5,
                                  child: Text(
                                    'Reward',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ),
                                Positioned(
                                  bottom: model.getSizingService().blockSizeVertical * 3,
                                  child: Container(
                                    width: model.getSizingService().blockSizeHorizontal * 60,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          model.reward == '' ? 'A Mucy Day' : model.reward,
                                          style: kHeadingTextStyle.copyWith(
                                            fontSize: 50,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      )
                                    )
                                  )
                                )
                              ]
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                  bottomNavigationBar: Container(
                    margin: EdgeInsets.all(5).copyWith(
                      bottom: 15 + model.getSizingService().bottomPadding
                    ),
                    height: 58.0,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20.0),
                      onTap: () => model.navigateToHome(),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: kBottomButtonTextStyle
                        )
                      )
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: EmotionData.emotionData[model.emotionIndex].color,
                    ),
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