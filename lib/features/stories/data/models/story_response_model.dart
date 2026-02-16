class StoryResponseModel {
  final String story;

  StoryResponseModel({required this.story});

  factory StoryResponseModel.fromJson(Map<String, dynamic> json) {
    return StoryResponseModel(story: json['story'] as String);
  }
}
