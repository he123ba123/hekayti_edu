import 'package:hekayti/features/stories/data/models/story_request_model.dart';
import 'package:hekayti/features/stories/data/models/story_response_model.dart';

abstract class StoryRepository {
  Future<StoryResponseModel> getStory(StoryRequestModel storyRequestModel);
}
