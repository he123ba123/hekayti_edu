import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hekayti/features/stories/data/models/story_request_model.dart';
import 'package:hekayti/features/stories/domain/repository/story_repository.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  final StoryRepository _storyRepository;

  StoryCubit(this._storyRepository) : super(StoryState.initial());

  Future<void> getStory(int lessonNumber) async {
    emit(StoryState.loading());
    try {
      final response = await _storyRepository.getStory(
        StoryRequestModel(lessonNumber: lessonNumber),
      );

      // Split story by the separator and trim parts
      final parts = response.story
          .split('---------')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();

      emit(StoryState.success(parts));
    } catch (e) {
      emit(StoryState.error(e.toString()));
    }
  }

  void nextPart() {
    if (state.currentIndex < state.storyParts.length - 1) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    }
  }

  void previousPart() {
    if (state.currentIndex > 0) {
      emit(state.copyWith(currentIndex: state.currentIndex - 1));
    }
  }
}
