import 'package:dio/dio.dart';
import 'package:hekayti/features/quiz/data/arguments/quiz_argument.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/api_service.dart';
import '../params/quiz_param.dart';

class QuizRemoteDataSource {
  final ApiService apiService;

  QuizRemoteDataSource(this.apiService);

  Future<QuizQuestion> getQuizQuestion(QuizArgument arg) async {
    try {
      final response = await apiService.post(
        ApiEndpoints.quiz,
        data: arg.toJson(),
      );

      final quizResponse =
      QuizResponse.fromJson(response.data);

      return quizResponse.mcqs.first;

    } on DioException catch (e) {
      final message =
          e.response?.data?['message'] ?? e.message ?? "Unknown error";
      throw ServerException(message: message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
