import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'app/features/features.dart';
import 'app/utils/logger.dart';

Future<void> main() async {
  final container = ProviderContainer();
  NavigatorService.init();
  AppLogger.init();
  await container.read(localStorageProvider).init();
  container.read(currentUserControllerProvider.notifier).init();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}
