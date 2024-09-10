import 'package:flutter/material.dart';
import 'package:mobapp_util_app_lock/app_lock/app_lock_constants.dart';
import 'package:mobapp_util_app_lock/app_lock/controller/app_lock_controller.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class AppLock extends StatelessWidget {
  String? titlebarText;
  Color? titlebarTextColor;
  Color? titlebarBackgroundColor;
  Function(String) onConfirmCallBack;
  String? unlockTitle;
  double? unlockTitleFontSize;
  Color? unlockTitleColor;
  String? unlockDescription;
  double? unlockDescriptionFontSize;
  Color? unlockDescriptionColor;
  Widget? loginWidget;
  Color? loginWidgetTextColor;
  void Function()? onloginWidgetTap;
  String? appLogo;
  Color? primaryColor;

  AppLock(
      {super.key,
      this.titlebarText,
      this.titlebarTextColor,
      this.titlebarBackgroundColor,
      required this.onConfirmCallBack,
      this.unlockTitle,
      this.unlockTitleFontSize,
      this.unlockTitleColor,
      this.unlockDescription,
      this.unlockDescriptionFontSize,
      this.unlockDescriptionColor,
      this.loginWidget,
      this.loginWidgetTextColor,
      this.onloginWidgetTap,
      this.appLogo,
      this.primaryColor});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: titlebarBackgroundColor ?? const Color(0xff16558F),
        title: Text(
          titlebarText ?? APP_LOCK_TITLE,
          style: TextStyle(
            color: titlebarTextColor ?? Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.10),
            Icon(
              Icons.lock,
              color: primaryColor ?? const Color(0xff16558F),
              size: 40,
            ),
            SizedBox(height: screenHeight * 0.012),
            Text(
              unlockTitle ?? UNLOCK_TITLE,
              style: TextStyle(
                  fontSize: unlockTitleFontSize ?? 24,
                  color: unlockTitleColor ?? Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.05),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                unlockDescription ?? UNLOCK_DESCRIPTION,
                style: TextStyle(
                    fontSize: unlockDescriptionFontSize ?? 18,
                    color: unlockDescriptionColor ?? Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            Icon(
              Icons.fingerprint_rounded,
              size: 60,
              color: primaryColor ?? Color(0xff16558F),
            ).onTap(() {
              LocalAuthController.checkBioMetric(context, onConfirmCallBack,
                  primaryColor: primaryColor);
            }),
            SizedBox(
              height: screenHeight * 0.043,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(22),
                child: loginWidget ??
                    Text(
                      DO_YOU_WANT_TO_LOGIN_WITH_ANOTHER_ACCOUNT,
                      textAlign: TextAlign.center,
                      style: boldTextStyle(
                          color: loginWidgetTextColor ?? Colors.black),
                    ).onTap(() {
                      if (onloginWidgetTap != null) {
                        onloginWidgetTap!();
                      }
                    }),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.036,
            ),
            appLogo != null
                ? appLogoWidget(context, appLogo ?? "")
                : const Text("")
          ],
        ),
      ),
    );
  }

  appLogoWidget(BuildContext context, String path) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Image.asset(
      path,
      height: screenHeight * 0.17,
      width: screenWidth * 0.35,
    );
  }
}
