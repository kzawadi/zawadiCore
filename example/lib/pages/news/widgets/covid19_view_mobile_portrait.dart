import 'package:designsys/designsys.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:zawadi_design/pages/news/view_model.dart/covid19_viewmodel.dart';
import 'package:zawadi_design/pages/news/widgets/article_grid.dart';
import 'package:zawadi_design/pages/news/widgets/articles_list.dart';

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
      title: Text(
        'Coronavirus',
        style: GoogleFonts.nunito(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w800,
          fontSize: 20,
          letterSpacing: 1.2,
        ),
      ),
      leading: ZawadiBackButton(isClear: true),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context, Covid19ViewModel viewModel) {
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
