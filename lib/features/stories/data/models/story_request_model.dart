class StoryRequestModel {
  final int lessonNumber;

  StoryRequestModel({required this.lessonNumber});

  Map<String, dynamic> toJson() {
    return {'lesson_number': lessonNumber};
  }
}
