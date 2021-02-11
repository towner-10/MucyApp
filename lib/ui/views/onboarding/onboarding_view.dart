import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mucy/ui/elements/button_nav_button.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      builder: (context, model, child) => Container(
        decoration: model.currentBackgroundDecoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
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
                                      'Welcome to Mucy',
                                      style: kHeadingTextStyle.copyWith(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'I am Mucy the Meerkat.',
                                      style: kMontserratRegular.copyWith(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BottomNavButton(
                            text: 'Continue',
                            color: const Color(0xff282e4e),
                            callback: () => _pageController.animateToPage(model.currentPage + 1, duration: Duration(milliseconds: 300), curve: Curves.easeInToLinear),
                          )
                        ],
                      )
                    )
                  ),
                  Container(
                    height: model.getSizingService().screenHeight,
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FadeIn(
                                  child: Container(
                                    width: model.getSizingService().blockSizeHorizontal * 70,
                                    height: model.getSizingService().blockSizeVertical * 50,
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Image(
                                      fit: BoxFit.fitWidth,
                                      image: AssetImage("assets/images/blueMucyHead.png"),
                                    )
                                  ),
                                ),
                                BounceInRight(
                                  child: Container(
                                    padding: EdgeInsets.only(left: model.getSizingService().blockSizeHorizontal * 7),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Getting to know you',
                                        style: kHeadingTextStyle,
                                        textAlign: TextAlign.left,
                                      )
                                    ),
                                  ),
                                ),
                                FadeInRight(
                                  child: Container(
                                    height: model.getSizingService().blockSizeVertical * 5,
                                    margin: EdgeInsets.only(
                                      left: model.getSizingService().blockSizeHorizontal * 7,
                                      right: model.getSizingService().blockSizeHorizontal * 2
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        'Before we get started, what is your name?',
                                        style: kMontserratRegular.copyWith(
                                          fontSize: 15,
                                        ),
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                      )
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: model.getSizingService().blockSizeVertical * 25,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: model.getSizingService().blockSizeHorizontal * 7),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'What\'s your name?',
                                              style: kMontserratSemiBold.copyWith(
                                                fontSize: 10,
                                                color: Colors.black
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: model.getSizingService().blockSizeHorizontal * 7),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Form(
                                                key: model.formKey,
                                                child: _HookTextField()
                                              )
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  )
                                )
                              ],
                            ),
                          ),
                          BottomNavButton(
                            text: 'Get Started',
                            color: const Color(0xff6776c1),
                            callback: () {
                              if (model.formKey.currentState.validate()) {
                                model.formKey.currentState.save();
                                _pageController.animateToPage(model.currentPage + 1, duration: Duration(milliseconds: 300), curve: Curves.easeInToLinear);
                              }
                            },
                          )
                        ],
                      )
                    )
                  ),
                  Container(
                    height: model.getSizingService().screenHeight,
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: model.getSizingService().blockSizeHorizontal * 70,
                                  height: model.getSizingService().blockSizeVertical * 50,
                                  margin: EdgeInsets.symmetric(vertical: model.getSizingService().blockSizeVertical),
                                  child: Image(
                                    fit: BoxFit.fitWidth,
                                    image: AssetImage("assets/images/pinkMucyHead.png"),
                                  )
                                ),
                                BounceInRight(
                                  child: Container(
                                    height: model.getSizingService().blockSizeVertical * 5,
                                    child: AutoSizeText(
                                      'Nice to meet you!',
                                      style: kMontserratRegular.copyWith(
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: FadeInRight(
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
                                              border: Border.all(width: 2.0, color: const Color(0xff000000)),
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
                                              'Hi, my name is',
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
                                                  model.currentName,
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
                                  ),
                                )
                              ],
                            ),
                          ),
                          BottomNavButton(
                            text: 'Let\'s go',
                            color: const Color(0xffcc708a),
                            callback: () => model.navigateToHome(),
                          )
                        ],
                      )
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => OnboardingViewModel(),
    );
  }
}

class _HookTextField extends HookViewModelWidget<OnboardingViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, OnboardingViewModel model) {
    TextEditingController _controller = useTextEditingController();

    return TextFormField(
      controller: _controller,
      textCapitalization: TextCapitalization.words,
      style: kMontserratSemiBold.copyWith(
        fontSize: 15,
        color: Colors.black
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: "Enter your name...",
        contentPadding: EdgeInsets.only(left: 5),
        errorStyle: kMontserratSemiBold.copyWith(
          fontSize: 10,
        ),
        hintStyle: kMontserratMedium.copyWith(
          fontSize: 15,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: new BorderSide(
            color: Colors.black,
            width: 2
          )
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: new BorderSide(
            color: Colors.black,
            width: 2
          )
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: new BorderSide(
            color: Colors.red,
            width: 2
          )
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: model.validateNameInput,
      onSaved: model.updateName,
    );
  }
}