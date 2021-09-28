import 'package:stacked/stacked.dart';
import 'package:zawadi_design/app/app.locator.dart';
import 'package:zawadi_design/models/article_model.dart';
import 'package:zawadi_design/services/news_services.dart';
import 'package:pretty_json/pretty_json.dart';

class Covid19ViewModel extends FutureViewModel<List<Article>> {
  final _newsServices = locator<NewsService>();

  // List<Article>? _covid19Articles;
  // get covid19Articles => _covid19Articles;

  @override
  void onError(error) {
    prettyJson(error);
    super.onError(error);
  }

  // Future<void> getCvid19Articles() async {
  //   _covid19Articles = await runBusyFuture(
  //     _newsServices.getCovid19Articles(),
  //   );
  // }

  @override
  Future<List<Article>> futureToRun() => _newsServices.getCovid19Articles();
}
