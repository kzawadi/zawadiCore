import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zawadi_design/pages/news/NewsViewMobileLandscape.dart';
import 'package:zawadi_design/pages/news/main_news.dart';
import 'package:zawadi_design/pages/news/news_view_mobile_portrait.dart';
import 'package:zawadi_design/pages/news/view_model.dart/news_viewmodel.dart';
import 'package:zawadi_design/pages/startup/startup_view.dart';
import 'package:zawadi_design/services/news_services.dart';

@StackedApp(
  /// All the routes of the app are registred here
  routes: [
    CupertinoRoute(page: StartUpView),
    CupertinoRoute(page: NewsMainView, initial: true),
    CupertinoRoute(page: NewsViewMobileLandscape),
    CupertinoRoute(page: NewsViewMobilePortrait),
    // CupertinoRoute(page: SecondView),
  ],

  ///Dependency injection of all services going to be used in this App
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: NewsService),
    LazySingleton(classType: NewsViewModel),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
