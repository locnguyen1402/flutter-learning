import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/style.dart';

class AlertService {
  static final AlertService _alertIns = AlertService._internal();

  factory AlertService() {
    return _alertIns;
  }

  AlertService._internal();

  showTextConfirmDialog(
    BuildContext context, {
    required String title,
    required String content,
    required String okText,
    required VoidCallback okCb,
    String? cancelText,
    VoidCallback? cancelCb,
  }) {
    final List<Widget> actionButtons = [
      ElevatedButton(
        onPressed: okCb,
        child: Text(okText),
      )
    ];

    if (cancelText != null && cancelCb != null) {
      actionButtons.insert(
        0,
        OutlinedButton(
          onPressed: cancelCb,
          child: Text(cancelText),
        ),
      );
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: Text(
              title,
              style: AppStyles.headline1,
            ),
            content: Text(content),
            actions: actionButtons,
          );
        });
  }
}
