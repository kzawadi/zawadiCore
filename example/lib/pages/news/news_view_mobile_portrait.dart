import 'package:designsys/designsys.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:zawadi_design/pages/news/view_model.dart/news_viewmodel.dart';
import 'package:zawadi_design/pages/news/widgets/article_grid.dart';
import 'package:zawadi_design/pages/news/widgets/articles_list.dart';

class NewsViewMobilePortrait extends StatelessWidget {
  const NewsViewMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsViewModel>.reactive(
      onModelReady: (model) => model.futureToRun,
      builder: (context, model, child) => MobilePortraitContents(),
      viewModelBuilder: () => NewsViewModel(),
    );
  }
}

class MobilePortraitContents extends ViewModelWidget<NewsViewModel> {
  const MobilePortraitContents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return viewModel.isBusy
        ? Loading(
            backgroundColor: Colors.brown[100],
          )
        : Container(
            color: Colors.brown[100],
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                _header(context),
                CupertinoSliverRefreshControl(
                  onRefresh: () async {
                    // return await context.refresh(newsFutureProvider);
                  },
                ),
                ArticleList(viewModel.data!, true, false),
                ArticleGrid(viewModel.data!, false)
              ],
            ),
          );
  }

  Widget _header(BuildContext context) {
    return CupertinoSliverNavigationBar(
      stretch: true,
      backgroundColor: Colors.brown[100],
      largeTitle: Text(
        'Top Stories',
        style: GoogleFonts.nunito(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
      ),
      trailing: ZawadiActionButton(
        icon: IconlyIcon(
          IconlyCurved.User3,
          size: 25,
          color: Theme.of(context).colorScheme.secondaryVariant,
        ),
        onPressed: () {
          // return ZawadiMethods.viewTransition(context, CategoryListView());
        },
      ),
    );
  }
}
