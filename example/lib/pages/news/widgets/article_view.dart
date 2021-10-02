import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsys/designsys.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zawadi_design/models/article_model.dart';
import 'package:zawadi_design/ui/web_assets.dart';

///Its called article view but also can be news view or details view
///this page display the selected news in details
///functionaly it take [Article] and [source] as a required arguments.
class ArticleView extends StatelessWidget {
  const ArticleView(this.article, this.source) : super();

  final Article? article;
  final bool source;

  Widget _header(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      backgroundColor: Colors.brown[100],
      title: AutoSizeText(
        article?.name ?? '',
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

  Widget _description(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: AutoSizeText(
            !source
                ? article?.title ??
                    ''.substring(0, article?.title!.indexOf(' - '))
                : article?.title ?? '',
            style: GoogleFonts.notoSans(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.start,
            maxLines: 20,
            minFontSize: 16,
            maxFontSize: 22,
          ),
        ),
        // article!.getImageUrl.isNotEmpty ? SizedBox(height: 12) : Container(),
        ClipSquircleBorder(
          radius: BorderRadius.all(Radius.circular(25)),
          child: CachedNetworkImage(
            imageUrl: article?.getImageUrl ?? WebAssets().dummyImage,
            fit: BoxFit.cover,
            height: 250,
            placeholder: (context, url) => Loading(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(height: 7),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                authorName(),
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              AutoSizeText(
                DateFormat.yMMMd()
                    .format(DateTime.parse(article?.publishedAt ?? '')),
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.bodyText1,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _launchURL(article?.articleUrl ?? ''),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: AutoSizeText(
                        "Read More ...",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.subtitle1,
                          color: Colors.blue[900],
                        ),
                        minFontSize: 13,
                        maxFontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

//This is a temporary solution later we will create a good methods helper class
  void _launchURL(String url) async => await canLaunch(url)
      ? await launch(
          url,
          enableJavaScript: true,
          forceWebView: true,
          statusBarBrightness: Brightness.dark,
          webOnlyWindowName: article?.name ?? "",
        )
      : throw 'Could not launch $url';

  String authorName() {
    return [null, '', 'http', 'HTTP'].contains(article?.author ?? '')
        ? 'BY UNKNOWN'
        : article!.author!.toUpperCase().contains('BY ')
            ? article!.author!.toUpperCase()
            : article!.author!.contains(',')
                ? article!.author!
                    .toUpperCase()
                    .substring(0, article?.author!.indexOf(','))
                : 'BY ' + article!.author!.toUpperCase();
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: AutoSizeText(
        article?.content ?? 'No Content',
        style: GoogleFonts.literata(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          height: 1.5,
          color: Colors.black,
          fontSize: 19,
        ),
        minFontSize: 16,
        maxFontSize: 22,
        textAlign: TextAlign.start,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ZawadiScaffold(
      backgroundColor: Colors.brown[100],
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          _header(context),
          SliverList(
            delegate: SliverChildListDelegate([
              _description(context),
              _body(context),
            ]),
          )
        ],
      ),
    );
    // );
  }
}
