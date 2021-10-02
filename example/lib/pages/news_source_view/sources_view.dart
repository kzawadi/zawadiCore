import 'package:auto_size_text/auto_size_text.dart';
import 'package:designsys/designsys.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:zawadi_design/app/app.locator.dart';
import 'package:zawadi_design/models/source.dart';
import 'package:zawadi_design/pages/news/view_model.dart/news_viewmodel.dart';

class SourcesViewPage extends StatelessWidget {
  const SourcesViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsViewModel>.reactive(
      disposeViewModel: false,
      fireOnModelReadyOnce: true,
      initialiseSpecialViewModelsOnce: true,
      // onModelReady: (model) => model.futuresMap,
      viewModelBuilder: () => locator<NewsViewModel>(),
      builder: (context, model, child) => SourceViewWidget(),
    );
  }
}

class SourceViewWidget extends ViewModelWidget<NewsViewModel> {
  const SourceViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return ZawadiScaffold(
      backgroundColor: Colors.brown[100],
      body: viewModel.dataReady("sources")
          ? CustomScrollView(
              slivers: [
                _header(context),
                CupertinoSliverRefreshControl(
                  onRefresh: () async {
                    // return await context.refresh(newsSourcesProvider);
                  },
                ),
                _sourcesList(context, viewModel.dataMap!["sources"]),
              ],
            )
          : Loading(backgroundColor: Colors.brown[100]),
    );
  }

  Widget _header(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      backgroundColor: Colors.brown[100],
      title: AutoSizeText(
        "Sources",
        style: GoogleFonts.nunito(
          textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
          fontWeight: FontWeight.w900,
          fontSize: 25,
        ),
        maxFontSize: 22,
        minFontSize: 15,
      ),
      leading: ZawadiBackButton(
        iconColor: true,
      ),
      centerTitle: true,
    );
  }

  Widget _sourcesList(BuildContext context, List<Source> sources) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (sources.length != 0) {
            return SourceCard(sources[index]);
          } else {
            Center(
              child: Text(
                'Error :(',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                    ),
              ),
            );
          }
          return Container();
        },
        childCount: sources.length,
      ),
    );
  }
}

class SourceCard extends StatelessWidget {
  const SourceCard(this.source);

  @required
  final Source source;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => ZawadiMethods.viewTransition(context, SourceView(source)),
      child: Card(
        margin: EdgeInsets.only(top: 8, bottom: 8),
        color: Colors.brown[200],
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: AutoSizeText(
                  source.name!.substring(0, 1),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
              SizedBox(width: 7),
              Expanded(
                child: AutoSizeText(source.name!,
                    style: Theme.of(context).textTheme.headline6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
