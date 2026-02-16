import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hekayti/core/network/api_service.dart';
import 'package:hekayti/features/home/logic/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hekayti/core/routing/routes.dart';
import 'package:hekayti/features/home/presentation/screens/main_screen.dart';
import 'package:hekayti/features/home/presentation/screens/main_screen_args.dart';
import 'package:hekayti/features/lessons/presentation/screens/child_setup_screen.dart';
import 'package:hekayti/features/lessons/presentation/screens/lesson_selection_screen.dart';
import 'package:hekayti/features/lessons/presentation/screens/upload_material_screen.dart';
import 'package:hekayti/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:hekayti/features/splash/presentation/screens/splash_screen.dart';
import 'package:hekayti/features/stories/presentation/screens/story_screen.dart';
import 'package:hekayti/features/lessons/presentation/screens/social_studies_screen.dart';
import 'package:hekayti/features/auth/presentation/screens/login_screen.dart';
import 'package:hekayti/features/auth/presentation/screens/signup_screen.dart';
import '../../features/quiz/data/data_source/remote_data_source.dart';
import '../../features/welcome/welcome_screen.dart';
import 'package:hekayti/features/quiz/data/arguments/quiz_argument.dart';
import 'package:hekayti/features/quiz/presentation/quiz_view.dart';
import 'package:hekayti/features/result/presentation/result_view.dart';
import '../../features/ai_feedback/ai_feedback_view.dart';
import '../../features/quiz/data/params/quiz_param.dart';
import '../../features/voice_recording/voice_recording_view.dart';
import '../framework/navigation_animation.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.welcomeScreen:
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
        NavigationTab? initialTab;
        int? initialLessonId;

        if (arguments is NavigationTab) {
          initialTab = arguments;
        } else if (arguments is MainScreenArgs) {
          initialTab = arguments.initialTab;
          initialLessonId = arguments.initialLessonId;
        }

        return _buildRoute(
          builder: (_) =>
              MainScreen(
                initialTab: initialTab,
                initialLessonId: initialLessonId,
              ),
        );
      case Routes.voiceRecordingView:
        return _buildRoute(builder: (_) => const VoiceRecordingView());
      case Routes.aiFeedbackView:
        return _buildRoute(builder: (_) => const AiFeedbackView());
      case Routes.quizView:
        return _buildRoute(
            builder: (_) =>
                 BlocProvider(
                  create: (context) {
                    final apiService = ApiService();
                    final remoteDataSource = QuizRemoteDataSource(apiService);
                    return QuizCubit(remoteDataSource)..loadQuestion(1);
                  },
                   child: QuizView(),
                ),
                );
      case Routes.resultView:
        return _buildRoute(builder: (_) => const ResultView(score: .6));
      case Routes.socialStudiesScreen:
        return _buildRoute(builder: (_) => const SocialStudiesScreen());
      case Routes.loginScreen:
        return _buildRoute(builder: (_) => const LoginScreen());
      case Routes.signupScreen:
        return _buildRoute(builder: (_) => const SignupScreen());
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
