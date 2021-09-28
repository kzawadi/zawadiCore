import 'package:designsys/designsys.dart';
import 'package:flutter/cupertino.dart';
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
        ? Loading()
        : CustomScrollView(
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
          );

    // ZawadiScaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       "Mobile Portrat View",
    //       style: TextStyle(color: Colors.black),
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: Center(
    //     child: viewModel.isBusy
    //         ? Loading()
    //         : Text(viewModel.dataReady
    //             ? viewModel.data!.first.content!
    //             : "NO DATA YET"),
    //   ),
    // );
  }

  Widget _header(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        'Top Stories',
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: Theme.of(context).primaryColor),
      ),
      centerTitle: true,
      leading: ZawadiActionButton(
        icon: IconlyIcon(
          IconlyBold.Filter1,
          color: Theme.of(context).colorScheme.secondaryVariant,
        ),
        onPressed: () {
          // return ZawadiMethods.viewTransition(context, CategoryListView());
        },
      ),
    );
  }
}
