import 'dart:io';
import 'package:hekayti/features/home/logic/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hekayti/core/routing/routes.dart';
import 'package:hekayti/features/home/presentation/screens/main_screen.dart';
import 'package:hekayti/features/lessons/presentation/screens/child_setup_screen.dart';
import 'package:hekayti/features/lessons/presentation/screens/lesson_selection_screen.dart';
import 'package:hekayti/features/lessons/presentation/screens/upload_material_screen.dart';
import 'package:hekayti/features/splash/presentation/screens/splash_screen.dart';
import 'package:hekayti/features/stories/presentation/screens/story_screen.dart';

import '../../features/welcome/welcome_screen.dart';
import '../framework/navigation_animation.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.welcomeScren:
        return _buildRoute(builder: (_) => const WelcomeScreen());
      case Routes.splashScreen:
        return _buildRoute(builder: (_) => const SplashScreen());
      case Routes.childSetupScreen:
        return _buildRoute(builder: (_) => const ChildSetupScreen());
      case Routes.lessonSelectionScreen:
        return _buildRoute(builder: (_) => const LessonSelectionScreen());
      case Routes.uploadMaterialScreen:
        return _buildRoute(builder: (_) => const UploadMaterialScreen());
      case Routes.storyScreen:
        return _buildRoute(builder: (_) => const StoryScreen());
      case Routes.mainScreen:
        final initialTab = arguments is NavigationTab ? arguments : null;
        return _buildRoute(builder: (_) => MainScreen(initialTab: initialTab));
      default:
        return _buildRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  PageRoute _buildRoute({required WidgetBuilder builder}) {
    return Platform.isAndroid
        ? FadePageRoute(builder: builder)
        : MaterialPageRoute(builder: builder);
  }
}
