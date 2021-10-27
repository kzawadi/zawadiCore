//From here we are trying to understand the underlying device we are running so
//to run the widget of that device category
//This is to make sure the app layout is good in mobile,web,desktop and foldables
import 'package:designsys/designsys.dart';
import 'package:zawadi_design/pages/news/NewsViewMobileLandscape.dart';
import 'package:zawadi_design/pages/news/news_view_mobile_portrait.dart';
import 'package:zawadi_design/pages/news/news_view_tablet.dart';

///The main entry to news page this class will determine the screen type and
///orientation inorder to determine the best layout of the users devices
class NewsMainView extends StatelessWidget {
  NewsMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
          portrait: NewsViewMobilePortrait(),
          landscape: NewsViewMobileLandscape()),
      tablet: NewsViewTablet(),
      desktop: NewsViewTablet(),
    );
  }
}
