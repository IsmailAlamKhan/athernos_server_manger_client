import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

import 'features/features.dart';
import 'shared/widgets/navigation_event_listener.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (light, dark) {
      return MaterialApp(
        title: appName,
        useInheritedMediaQuery: true,
        theme: AppTheme.lightThemeData(light),
        navigatorKey: NavigatorService.instance.navigatorKey(false),
        darkTheme: AppTheme.darkThemeData(dark),
        builder: (context, child) => NavigationEventListener(
          navigator: NavigatorService.instance.navigatorKey(false),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.2),
            child: child!,
          ),
        ),
        home: const LoginView(),
      );
    });
  }
}
