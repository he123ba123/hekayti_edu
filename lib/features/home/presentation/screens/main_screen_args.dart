import 'package:hekayti/features/home/logic/navigation_cubit.dart';

class MainScreenArgs {
  final NavigationTab? initialTab;
  final int? initialLessonId;

  const MainScreenArgs({this.initialTab, this.initialLessonId});
}
