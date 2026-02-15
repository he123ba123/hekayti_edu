import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hekayti/core/routing/routes.dart';

import '../../features/welcome/welocome_view.dart';
import '../framework/navigation_animation.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.welcomeView:
        return _buildRoute(
            builder: (_) => const WelcomeView()
        );
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