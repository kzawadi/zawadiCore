import 'package:stacked/stacked.dart';
import 'package:zawadi_design/app/app.locator.dart';
import 'package:zawadi_design/services/news_services.dart';

class NewsViewModel extends MultipleFutureViewModel {
  final _newsServices = locator<NewsService>();

  // @override
  // void onError(error) {
  //   prettyJson(error);
  //   super.onError(error);
  // }

  @override
  Map<String, Future Function()> get futuresMap => {
        "articles": () async {
          return _newsServices.getArticles();
        },
        "covidArticles": () async {
          return _newsServices.getCovid19Articles();
        },
        "sources": () async {
          return _newsServices.getSources();
        },
      };

  // @override
  // Future<List<Article>> futureToRun() => _newsServices.getArticles();
}
