import 'package:stacked/stacked.dart';
import 'package:zawadi_design/app/app.locator.dart';
import 'package:zawadi_design/models/article_model.dart';
import 'package:zawadi_design/services/news_services.dart';
import 'package:pretty_json/pretty_json.dart';

class NewsViewModel extends FutureViewModel<List<Article>> {
  final _newsServices = locator<NewsService>();

  @override
  void onError(error) {
    prettyJson(error);
    super.onError(error);
  }

  @override
  Future<List<Article>> futureToRun() => _newsServices.getArticles();
}
