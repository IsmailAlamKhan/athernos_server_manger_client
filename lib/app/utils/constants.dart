import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'exception.dart';

const appName = 'Athernos server manager';

Color tintColor({
  required Color color,
  required Color tint,
  required double opacity,
}) {
  return Color.alphaBlend(tint.withOpacity(opacity), color);
}

Color surfaceTintColor({
  required BuildContext context,
  double opacity = .5,
}) {
  return tintColor(
    color: Theme.of(context).colorScheme.surface,
    tint: Theme.of(context).colorScheme.surfaceTint,
    opacity: opacity,
  );
}

typedef FutureCallback<T> = Future<T> Function();

bool isTabletOrLarger(BuildContext context) {
  return MediaQuery.of(context).size.width > 500;
}

bool isMobileSize(BuildContext context) {
  return MediaQuery.of(context).size.width < 500;
}

const riverpodKeepAlive = Riverpod(keepAlive: true);

String exceptionToString(Object exception) {
  String message = 'Unknown error';

  if (exception is! Exception) {
    if (kDebugMode) {
      message = exception.toString();
    }
  } else {
    if (exception is AppException) {
      message = exception.message;
    } else if (exception is PlatformException) {
      message = exception.message ?? exception.code;
    } else if (exception is ProcessException) {
      message = exception.message;
    } else {
      message = exception.toString();
    }
  }
  return message;
}
