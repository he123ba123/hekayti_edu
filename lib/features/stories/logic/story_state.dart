part of 'story_cubit.dart';

enum StoryStatus { initial, loading, success, error }

class StoryState {
  final StoryStatus status;
  final List<String> storyParts;
  final int currentIndex;
  final String? errorMessage;

  const StoryState({
    required this.status,
    this.storyParts = const [],
    this.currentIndex = 0,
    this.errorMessage,
  });

  String? get currentPart =>
      storyParts.isNotEmpty ? storyParts[currentIndex] : null;

  factory StoryState.initial() {
    return const StoryState(status: StoryStatus.initial);
  }

  factory StoryState.loading() {
    return const StoryState(status: StoryStatus.loading);
  }

  factory StoryState.success(List<String> parts) {
    return StoryState(
      status: StoryStatus.success,
      storyParts: parts,
      currentIndex: 0,
    );
  }

  factory StoryState.error(String message) {
    return StoryState(status: StoryStatus.error, errorMessage: message);
  }

  StoryState copyWith({
    StoryStatus? status,
    List<String>? storyParts,
    int? currentIndex,
    String? errorMessage,
  }) {
    return StoryState(
      status: status ?? this.status,
      storyParts: storyParts ?? this.storyParts,
      currentIndex: currentIndex ?? this.currentIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
