import 'package:hekayti/features/stories/data/data_sources/story_remote_data_source.dart';
import 'package:hekayti/features/stories/data/models/story_request_model.dart';
import 'package:hekayti/features/stories/data/models/story_response_model.dart';
import 'package:hekayti/features/stories/domain/repository/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoryRemoteDataSource _storyRemoteDataSource;

  StoryRepositoryImpl(this._storyRemoteDataSource);

  @override
  Future<StoryResponseModel> getStory(
    StoryRequestModel storyRequestModel,
  ) async {
    return await _storyRemoteDataSource.getStory(storyRequestModel);
  }
}
