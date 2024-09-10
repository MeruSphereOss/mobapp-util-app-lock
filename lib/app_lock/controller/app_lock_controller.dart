// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobapp_util_app_lock/app_lock/app_lock_constants.dart';
import 'package:mobapp_util_app_lock/app_lock/app_lock_status_enum.dart';
import 'package:mobapp_util_app_lock/utils/alert_dialog_utils.dart';
import 'package:nb_utils/nb_utils.dart';

class LocalAuthController {
  static Future<bool> authenticateWithBiometrics(BuildContext context) async {
    bool isBiometricSupported;
    bool canCheckBiometrics;
    bool isAuthenticated = false;
    try {
      final LocalAuthentication localAuthentication = LocalAuthentication();
      isBiometricSupported = await localAuthentication.isDeviceSupported();
      canCheckBiometrics = await localAuthentication.canCheckBiometrics;
      if (isBiometricSupported && canCheckBiometrics) {
        isAuthenticated = await localAuthentication.authenticate(
          localizedReason: LOCALIZED_REASON,
        );
      } else if (!isBiometricSupported) {
        customOkAlertDialog(context, APP_LOCK_NOT_SUPPORTED_TITLE,
            APP_LOCK_NOT_SUPPORTED_DESCRIPTION);
      } else if (!canCheckBiometrics) {
        customOkAlertDialog(
          context,
          UNABLE_TO_CHECK_BIOMETRICS_TITLE,
          UNABLE_TO_CHECK_BIOMETRICS_DESCRIPTION,
        );
      }

      return isAuthenticated;
    } catch (e) {
      rethrow;
    }
  }

  static checkBioMetric(
      BuildContext context, Function(String) onConfirmCallBack,
      {Color? primaryColor, Function? notAuthenticatedTap}) async {
    try {
      bool isAuthenticated =
          await LocalAuthController.authenticateWithBiometrics(context);
      1.seconds.delay;
      if (isAuthenticated) {
        onConfirmCallBack(AppLockStatus.completed.name);
      } else {
        customOkAlertDialog(
            context, NOT_AUTHENTICATED_TITLE, NOT_AUTHENTICATED_DESCRIPTION);
      }
    } catch (e) {
      rethrow;
    }
  }

  // static Future<bool> isBioMetricSupporteAndcanCheckBioMetrics() async {
  //   final LocalAuthentication localAuthentication = LocalAuthentication();
  //   bool isBiometricSupported = await localAuthentication.isDeviceSupported();
  //   bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;
  //   return isBiometricSupported && canCheckBiometrics;
  // }
}
