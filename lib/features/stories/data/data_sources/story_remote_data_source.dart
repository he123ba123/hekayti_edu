import 'package:dio/dio.dart';
import 'package:hekayti/core/network/api_endpoints.dart';
import 'package:hekayti/core/network/api_service.dart';
import 'package:hekayti/features/stories/data/models/story_request_model.dart';
import 'package:hekayti/features/stories/data/models/story_response_model.dart';
import 'package:hekayti/core/error/exceptions.dart';

abstract class StoryRemoteDataSource {
  Future<StoryResponseModel> getStory(StoryRequestModel requestBody);
}

class StoryRemoteDataSourceImpl implements StoryRemoteDataSource {
  final ApiService _apiService;

  StoryRemoteDataSourceImpl(this._apiService);

  @override
  Future<StoryResponseModel> getStory(StoryRequestModel requestBody) async {
    try {
      final response = await _apiService.post(
        ApiEndpoints.story,
        data: requestBody.toJson(),
      );
      return StoryResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      final message =
          e.response?.data?['message'] ?? e.message ?? "Unknown error";
      throw ServerException(message: message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
