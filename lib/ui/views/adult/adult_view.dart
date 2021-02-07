import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'adult_viewmodel.dart';

class AdultView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdultViewModel>.reactive(
      builder: (context, model, child) => Container(
        decoration: BoxDecoration(
          color: Backgrounds.defaultBackgroundColor,
          /*image: DecorationImage(
            image: Backgrounds.defaultBackground,
            fit: BoxFit.fitHeight
          )*/
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: model.getSizingService().blockSizeHorizontal * 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: model.getSizingService().topPadding + model.getSizingService().blockSizeVertical * 3),
                      child: GestureDetector(
                          onTap: () {
                            model.updateReward('');
                            model.saveReward();
                            model.navigateToMucyEmotion();
                          },
                          child: Row(
                            children: [
                              Text(
                                "Skip",
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.black,
                                size: 28,
                              ),
                            ],
                          )
                      )
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Adult, please enter a reward",
                            style: kHeadingTextStyle.copyWith(
                                fontSize: 21
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.info,
                                size: model.getSizingService().blockSizeHorizontal * 7.5,
                                color: Colors.black,
                              ),
                              onPressed: () => model.openHelperSheet()
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: model.getSizingService().blockSizeVertical * 2.5,
                            bottom: model.getSizingService().blockSizeVertical * 4
                        ),
                        width: model.getSizingService().blockSizeHorizontal * 90,
                        child: Text(
                          "Before we get started, we need to know the all important reward.",
                          style: kParagraphTextStyle.copyWith(
                              fontSize: 15
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'What\'s the reward?',
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Form(
                                    key: model.formKey,
                                    child: _HookTextField()
                                )
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.all(15).copyWith(
              bottom: 15 + model.getSizingService().bottomPadding
            ),
            height: 58.0,
            child: InkWell(
              onTap: () {
                if (model.formKey.currentState.validate()) {
                  model.formKey.currentState.save();
                  model.saveReward();
                  model.navigateToMucyEmotion();
                }
              },
              child: Center(
                child: Text(
                  'Continue',
                  style: kBottomButtonTextStyle
                )
              )
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xFF6776C1),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => AdultViewModel(),
    );
  }
}

class _HookTextField extends HookViewModelWidget<AdultViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, AdultViewModel model) {
    TextEditingController _controller = useTextEditingController();

    return TextFormField(
      controller: _controller,
      textCapitalization: TextCapitalization.words,
      style: GoogleFonts.montserrat(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: "Enter the reward...",
        contentPadding: EdgeInsets.only(left: 5),
        errorStyle: GoogleFonts.montserrat(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        hintStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
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
      validator: model.validateRewardInput,
      onSaved: model.updateReward,
    );
  }
}