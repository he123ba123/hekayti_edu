import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../params/quiz_param.dart';

class QuizRemoteDataSource {
  final Dio dio;

  QuizRemoteDataSource(this.dio);

  Future<QuizQuestion> getQuizQuestion(int lessonNumber) async {
    try {
      final response = await dio.post(
        ApiConstants.quizEndPoint,
        data: {
          "lesson_number": lessonNumber,
        },
      );

      final quizResponse =
      QuizResponse.fromJson(response.data);

      return quizResponse.mcqs.first;

    } on DioException catch (e) {
      throw Exception(
        e.response?.data ?? "Failed to load quiz question",
      );
    }
  }
}
class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
}
