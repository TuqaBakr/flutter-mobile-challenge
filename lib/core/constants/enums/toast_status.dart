import 'package:flutter/material.dart';

enum ToastStatus {
  success,
  error,
  warning,
}

extension ToastColor on ToastStatus {
  Color get toastColor {
    switch (this) {
      case ToastStatus.success:
        return const Color(0XFF3ec15e);
      case ToastStatus.error:
        return const Color(0XFFff1600);
      case ToastStatus.warning:
        return const Color(0XFFe9b636);
    }
  }
}

extension ToastTitle on ToastStatus {
  String get toastTitle {
    switch (this) {
      case ToastStatus.success:
        return 'Success';
      case ToastStatus.error:
        return 'Error';
      case ToastStatus.warning:
        return 'Warning';
    }
  }
}

extension ToastIcon on ToastStatus {
  IconData get toastIcon {
    switch (this) {
      case ToastStatus.success:
        return Icons.check;
      case ToastStatus.error:
        return Icons.close;
      case ToastStatus.warning:
        return Icons.warning_amber_rounded;
    }
  }
}
