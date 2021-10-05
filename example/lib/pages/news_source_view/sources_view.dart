import 'package:auto_size_text/auto_size_text.dart';
import 'package:designsys/designsys.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
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
            return SourceTile(source: sources[index]);
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

//This is a temporary solution later we will create a good methods helper class
void _launchURL(String url) async => await canLaunch(url)
    ? await launch(
        url,
        enableJavaScript: true,
        // forceWebView: true,
        statusBarBrightness: Brightness.dark,
      )
    : throw 'Could not launch $url';

class SourceTile extends StatelessWidget {
  const SourceTile({Key? key, this.source}) : super(key: key);

  @required
  final Source? source;

  @override
  Widget build(BuildContext context) {
    return ClipSquircleBorder(
      radius: BorderRadius.all(Radius.circular(25)),
      child: ZawadiExpansionTile(
        backgroundColor: Colors.brown[200],
        iconColor: Theme.of(context).primaryColor,
        title: AutoSizeText(
          source?.name ?? '',
          style: GoogleFonts.notoSerif(
            textStyle: Theme.of(context).textTheme.headline6,
            color: Colors.black,
          ),
          minFontSize: 16,
          maxFontSize: 18,
        ),
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: AutoSizeText(
            source!.name!.substring(0, 1),
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              source?.description ?? '',
              style: GoogleFonts.notoSerif(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.brown[900],
              ),
              maxFontSize: 19,
              minFontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () => _launchURL(source?.url ?? 'https://www.google.com/'),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 50, right: 50),
              child: AutoSizeText(
                'Visit Us',
                style: GoogleFonts.notoSans(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                minFontSize: 16,
                maxFontSize: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
