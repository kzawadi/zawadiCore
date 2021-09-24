import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zawadi_design/pages/startup/startup_view.dart';

@StackedApp(
  /// All the routes of the app are registred here
  routes: [
    CupertinoRoute(page: StartUpView, initial: true),
    // CupertinoRoute(page: SecondView),
  ],

  ///Dependency injection of all services going to be used in this App
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
