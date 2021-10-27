import 'package:auto_size_text/auto_size_text.dart';
import 'package:designsys/designsys.dart';
import 'package:flutter/cupertino.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zawadi_design/app/app.locator.dart';
import 'package:zawadi_design/models/source.dart';
import 'package:zawadi_design/pages/news/view_model.dart/news_viewmodel.dart';

///This widget is constrained in width by 240 so any children
///widget should take note that constraint
///very like it wont show an error becouse that widgets will be layed out but
///not in visible part greater than [mediaQuery.width =>240]
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
    return
        // ZawadiScaffold(
        //   backgroundColor: Colors.brown[100],
        // body:
        viewModel.dataReady("sources")
            ? Scaffold(
                extendBody: true,
                // appBar: AppBar(
                //   backgroundColor: Colors.brown[100],
                //   toolbarHeight: 120,
                // ),
                body: Container(
                  // height: double.infinity,
                  width: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        "assets/images/ios.jpg",
                        fit: BoxFit.cover,
                        height: screenHeight(context),
                        width: 240,
                        scale: 1,
                      ),
                      GlassmorphicContainer(
                        width: 240,
                        height: screenHeight(context),
                        borderRadius: 0.0,
                        blur: 5,
                        alignment: Alignment.bottomCenter,
                        border: 0.0,
                        linearGradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.center,
                          colors: [
                            Colors.white.withOpacity(0.1),
                            Colors.white.withOpacity(0.1),
                          ],
                          // stops: [
                          //   0.1,
                          //   1,
                          // ],
                          tileMode: TileMode.mirror,
                        ),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: _sourcesList(
                            context,
                            viewModel.dataMap!["sources"],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Loading(backgroundColor: Colors.brown[100]);
  }

  Widget _header(BuildContext context) {
    return AutoSizeText(
      "Sources",
      style: GoogleFonts.nunito(
        textStyle: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.black54,
            ),
        fontWeight: FontWeight.w900,
        fontSize: 25,
      ),
      maxFontSize: 22,
      minFontSize: 15,
    );
  }

  Widget _sourcesList(BuildContext context, List<Source> sources) {
    return Column(
      // itemExtent: 3,
      children: [
        SizedBox(height: 100),
        Center(child: _header(context)),
        SizedBox(height: 0),
        ListView.builder(
          primary: true,
          shrinkWrap: true,
          itemCount: sources.length,
          itemBuilder: (context, index) {
            if (sources.isNotEmpty) {
              return SourceTile(
                source: sources[index],
              );
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
        ),
      ],
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
        // backgroundColor: Colors.brown[200],
        iconColor: Colors.brown,
        childrenPadding: EdgeInsets.only(top: 4, bottom: 4),
        title: AutoSizeText(
          source?.name ?? '',
          style: GoogleFonts.notoSerif(
            textStyle: Theme.of(context).textTheme.headline6,
            color: Colors.black,
          ),
          minFontSize: 16,
          maxFontSize: 18,
        ),
        // headerBackgroundColor: Colors.brown[200],

        // leading: Container(
        //   padding: const EdgeInsets.all(5),
        //   child: AutoSizeText(
        //     source!.name!.substring(0, 1),
        //     style: Theme.of(context).textTheme.headline5!.copyWith(
        //           color: Colors.amber[100],
        //         ),
        //   ),
        // ),
        // leading: SizedBox(width: 0.1),
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
//todo ... migrate this to the UI package
// class OverLayIssue extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Overlay.of(context)!.insert(_getEntry(context));
//         },
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Text('0' * 10000),
//         ],
//       ),
//     );
//   }

//   OverlayEntry _getEntry(context) {
//     OverlayEntry? entry;

//     entry = OverlayEntry(
//       opaque: false,
//       maintainState: true,
//       builder: (_) => Positioned(
//         left: 100,
//         bottom: 100,
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: BackdropFilter(
//           filter: ui.ImageFilter.blur(
//             sigmaX: 2,
//             sigmaY: 2,
//           ),
//           child: Material(
//             type: MaterialType.transparency,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   width: 200,
//                   height: 200,
//                   color: Colors.red,
//                   child: Text('Hello world'),
//                 ),
//                 RaisedButton(onPressed: () => entry!.remove())
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//     return entry;
//   }
// }
