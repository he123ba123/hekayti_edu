import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationTab { home, stories, awards, settings }

class NavigationCubit extends Cubit<NavigationTab> {
  NavigationCubit([NavigationTab initialTab = NavigationTab.home])
    : super(initialTab);

  void changeTab(NavigationTab tab) => emit(tab);
}
