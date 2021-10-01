import 'package:auto_size_text/auto_size_text.dart';
import 'package:designsys/designsys.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:zawadi_design/app/app.locator.dart';
import 'package:zawadi_design/pages/news/view_model.dart/news_viewmodel.dart';
import 'package:zawadi_design/pages/news/widgets/article_grid.dart';
import 'package:zawadi_design/pages/news/widgets/articles_list.dart';

class NewsViewMobilePortrait extends StatelessWidget {
  const NewsViewMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsViewModel>.reactive(
      disposeViewModel: false,
      fireOnModelReadyOnce: true,
      initialiseSpecialViewModelsOnce: true,
      onModelReady: (model) => model.futuresMap,
      builder: (context, model, child) => MobilePortraitContents(),
      viewModelBuilder: () => locator<NewsViewModel>(),
    );
  }
}

class MobilePortraitContents extends ViewModelWidget<NewsViewModel> {
  const MobilePortraitContents({
    Key? key,
  }) : super(key: key);

  Widget _header(BuildContext context) {
    return CupertinoSliverNavigationBar(
      stretch: true,
      border: Border.all(style: BorderStyle.none),
      backgroundColor: Colors.brown[100],
      largeTitle: AutoSizeText(
        'For You',
        style: GoogleFonts.nunito(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w900,
          // fontSize: 24,
        ),
        minFontSize: 21,
        maxFontSize: 30,
      ),
      trailing: ZawadiActionButton(
        icon: IconlyIcon(
          IconlyCurved.Setting,
          size: 25,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          // return ZawadiMethods.viewTransition(context, CategoryListView());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, viewModel) {
    return !viewModel.dataReady("articles")
        ? Loading(
            backgroundColor: Colors.brown[100],
          )
        : ZawadiScaffold(
            backgroundColor: Colors.brown[100],
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                _header(context),
                CupertinoSliverRefreshControl(
                  onRefresh: () async {
                    // return await context.refresh(newsFutureProvider);
                  },
                ),
                ArticleList(viewModel.dataMap!["articles"], true, false),
                ArticleGrid(viewModel.dataMap!["articles"], false)
              ],
            ),
          );
  }
}
