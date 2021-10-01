import 'package:auto_size_text/auto_size_text.dart';
import 'package:designsys/designsys.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:zawadi_design/pages/news/view_model.dart/covid19_viewmodel.dart';
import 'package:zawadi_design/pages/news/widgets/article_grid.dart';
import 'package:zawadi_design/pages/news/widgets/articles_list.dart';

///This is main page showing only [covid19] articles.
///it contains a first larger and five medium card and lastly
///small grid arranged cards
///all this are in [CustomScrollView]
///This page initiate its own ViewModel Controller which extends
///a future viewModel which upon firing of this page the
///[model.futureToRun] get excuted and return a [List of Articles]
///which is passed to the card in this page

class Covid19ViewMobilePortrait extends StatelessWidget {
  const Covid19ViewMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Covid19ViewModel>.reactive(
      onModelReady: (model) => model.futureToRun,
      builder: (context, model, child) => Covid19MobilePortraitContents(),
      viewModelBuilder: () => Covid19ViewModel(),
    );
  }
}

class Covid19MobilePortraitContents extends ViewModelWidget<Covid19ViewModel> {
  Widget _header(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      backgroundColor: Colors.brown[100],
      title: AutoSizeText(
        'Coronavirus News',
        style: GoogleFonts.nunito(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w900,
          fontSize: 22,
        ),
        maxLines: 1,
        maxFontSize: 22,
        minFontSize: 16,
      ),
      leading: ZawadiBackButton(
        // isClear: false,
        iconColor: true,
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context, Covid19ViewModel viewModel) {
    return viewModel.isBusy
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
                    // return await context.refresh(newsCOVID19Provider);
                  },
                ),
                ArticleList(viewModel.data!, false, false),
                ArticleGrid(viewModel.data!, false),
              ],
            ),
          );
  }
}
