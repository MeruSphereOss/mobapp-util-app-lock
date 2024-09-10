import 'package:flutter/material.dart';

// ThemeData themeData = AppTheme.shoppingTheme;
customOkAlertDialog(BuildContext context, String title, String message,
    {Color? primaryColor, Function? notAuthenticatedTap}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (buildcontext) {
      return AlertDialog(
        title: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryColor ?? const Color(0xff16558F),
            ),
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor ?? const Color(0xff16558F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                notAuthenticatedTap?.call();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
