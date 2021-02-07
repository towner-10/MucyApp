import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/ui/elements/button_nav_button.dart';
import 'package:mucy/utilities/styles.dart';

@lazySingleton
class HelperDialogService {

  final SizingService _sizingService = locator<SizingService>();

  HelperDialogService();

  void showCustomBottomSheet({Widget child}) {
    Get.bottomSheet(
      child,
      barrierColor: Colors.transparent,
      isDismissible: false,
      isScrollControlled: false,
      enableDrag: false
    );
  }

  Future<void> showDialog(String title, String content, {double titleFontSize = 25, double contentFontSize = 14}) {
    return showModalBottomSheet(
      context: Get.context,
      builder: (BuildContext context) {
        return Container(
          width: _sizingService.screenWidth,
          height: _sizingService.blockSizeVertical * 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(34.0), topRight: Radius.circular(34.0)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: _sizingService.blockSizeVertical * 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Bounce(
                        from: 15,
                        duration: const Duration(milliseconds: 800),
                        delay: const Duration(milliseconds: 100),
                        child: Icon(
                          Icons.info,
                          size: _sizingService.blockSizeHorizontal * 7.5,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: _sizingService.blockSizeVertical * 2,
                          bottom: _sizingService.blockSizeVertical * 2
                        ),
                        child: Text(
                          title,
                          style: kHeadingTextStyle.copyWith(
                            fontSize: titleFontSize,
                            color: Colors.black
                          ),
                        ),
                      ),
                      Container(
                        width: _sizingService.blockSizeHorizontal * 85,
                        child: Divider(
                          color: const Color(0xFFEFF0F3),
                          thickness: 2,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: _sizingService.blockSizeVertical * 2),
                        width: _sizingService.blockSizeHorizontal * 80,
                        child: Text(
                          content,
                          style: kParagraphTextStyle.copyWith(
                            fontSize: contentFontSize,
                            color: Colors.black,
                            height: 1.5
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ),
                BottomNavButton(
                  text: 'Close',
                  color: const Color(0xFFEFF0F3),
                  callback: () => Navigator.pop(context),
                  textColor: Colors.black,
                )
              ],
            ),
          ),
        );
      },
      isDismissible: false
    );
  }
}