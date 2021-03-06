import 'package:dio/dio.dart';
import 'package:zawadi_design/app/app.logger.dart';
import 'package:zawadi_design/exceptions/api_exceptions.dart';
import 'package:zawadi_design/models/article_model.dart';
import 'package:zawadi_design/models/source.dart';
import 'package:zawadi_design/services/api_key.dart';

// import 'package:zawadi_design/services/api_key.dart';

class NewsService {
  ///The Base url to fetch top headline in english language
  String baseUrl =
      'https://newsapi.org/v2/top-headlines?language=en&apiKey=$newsApiKey';

  ///The Base url to fetch top headline of corana Virus in english language
  String baseUrlCovid19 =
      'https://newsapi.org/v2/top-headlines?q=coronavirus&language=en&apiKey=$newsApiKey';
  String sourcesPath =
      'https://newsapi.org/v2/top-headlines/sources?apiKey=$newsApiKey';

  Dio _dio = Dio();
  final _log = getLogger('FirestoreApi');

  ///This funtion calls the News API and return a list of articles according
  /// to the url params passed during the calling of this function
  /// The list is deserialized also
  Future<List<Article>> getArticles({String? path}) async {
    try {
      final response = await _dio.get(
        baseUrl,
      );

      final results = List<Map<String, dynamic>>.from(
        response.data['articles'],
      );

      final List<Article> articles = results
          .map((articleData) => Article.fromMap(articleData))
          .toList(growable: false);
      _log.i("The fetched Top headlines are Articles [first item] ");
      _log.i(articles.first);
      return articles;
    } on DioError catch (e) {
      throw NewsExceptions.fromDioError(e);
    }
  }

  Future<List<Article>> getCovid19Articles() async {
    try {
      final response = await _dio.get(
        baseUrlCovid19,
      );

      final results = List<Map<String, dynamic>>.from(
        response.data['articles'],
      );

      final List<Article> articles = results
          .map((articleData) => Article.fromMap(articleData))
          .toList(growable: false);

      return articles;
    } on DioError catch (e) {
      throw NewsExceptions.fromDioError(e);
    }
  }

  ///This function returns a list of sources of News from News API
  ///it also deserilize
  Future<List<Source>> getSources() async {
    try {
      final response = await _dio.get(sourcesPath);

      final results = List<Map<String, dynamic>>.from(
        response.data['sources'],
      );
      _log.i(
          "Data of Sources fetched (Only showing first element)${results.first}");

      final List<Source> sources = results
          .map((sourceData) => Source.fromMap(sourceData))
          .toList(growable: false);

      _log.i(
          "Data of Sources fetched (Only showing first element)${sources.first}");

      return sources;
    } on DioError catch (e) {
      throw NewsExceptions.fromDioError(e);
    }
  }
}
