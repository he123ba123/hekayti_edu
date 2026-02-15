import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (BuildContext context)=> const HekaytiEdu(),
    ),
  );
}

class HekaytiEdu extends StatelessWidget {
  const HekaytiEdu({super.key});

  static final GlobalKey<NavigatorState> appNavigatorKey =
  GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: appNavigatorKey,
          onGenerateRoute: AppRouter().generateRoute,
          initialRoute: Routes.voiceRecordingView,
          themeMode: ThemeMode.dark,
        );
      },
    );
  }
}
