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
      case Routes.voiceRecordingView:
        return _buildRoute(builder: (_) => const VoiceRecordingView());
      case Routes.aiFeedbackView:
        return _buildRoute(builder: (_) => const AiFeedbackView());
      case Routes.quizView:
        final question = QuizQuestion(
          id: 1,
          question: 'ماذا وجد البطل "زيد" في أعماق الغابة المسحورة؟',
          correctOptionId: 2,
          options: [
            QuizOption(id: 1, text: "خريطة قديمة للكنز"),
            QuizOption(id: 2, text: "طائر ملون يتحدث"),
            QuizOption(id: 3, text: "صندوقًا مليئًا بالذهب"),
            QuizOption(id: 4, text: "مفتاحًا ذهبيًا سحريًا"),
          ],
        );
        ;

        return _buildRoute(
          builder: (_) => QuizView(
            quizArgument: QuizArgument(
              question: question,
              currentIndex: 2,
              totalQuestions: 5,
            ),
          ),
        );
      case Routes.resultView:
        return _buildRoute(builder: (_) => const ResultView(score: .6));
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
