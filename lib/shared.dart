import 'package:flutter/material.dart';

  showLoading(BuildContext context, String message,
      {bool isCancellable = true}) {
    return showDialog(
      context: context,
      barrierDismissible: isCancellable,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Text(message),
              const SizedBox(
                width: 15,
              ),
              const CircularProgressIndicator()
            ],
          ),
        );
      },
    );
  }

  hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }