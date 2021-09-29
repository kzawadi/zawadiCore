import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsys/designsys.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zawadi_design/models/article_model.dart';

class ArticleView extends StatelessWidget {
  const ArticleView(this.article, this.source) : super();
  final Article article;
  final bool source;

  @override
  Widget build(BuildContext context) {
    return ZawadiScaffold(
      backgroundColor: Colors.brown[200],
      body: SafeArea(
        child: _content(context),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        _header(context),
        SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  _description(context),
                  SizedBox(height: 12),
                  _body(context),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ZawadiBackButton(isClear: true),
          Text(
            article.name!,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          ZawadiHeaderButton(
            backgroundColor: ZawadiColors.transparent,
            icon: Container(),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _description(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Text(
            !source
                ? article.title!.substring(0, article.title!.indexOf(' - '))
                : article.title!,
            style: GoogleFonts.notoSans(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        article.getImageUrl.isNotEmpty ? SizedBox(height: 12) : Container(),
        ClipSquircleBorder(
          radius: BorderRadius.all(Radius.circular(25)),
          child: CachedNetworkImage(
            imageUrl: article.getImageUrl,
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
            children: [
              Text(
                authorName(),
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.secondaryVariant,
                ),
              ),
              Text(
                  DateFormat.yMMMd()
                      .format(DateTime.parse(article.publishedAt!)),
                  style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
        ),
      ],
    );
  }

  String authorName() {
    return [null, '', 'http', 'HTTP'].contains(article.author)
        ? 'BY UNKNOWN'
        : article.author!.toUpperCase().contains('BY ')
            ? article.author!.toUpperCase()
            : article.author!.contains(',')
                ? article.author!
                    .toUpperCase()
                    .substring(0, article.author!.indexOf(','))
                : 'BY ' + article.author!.toUpperCase();
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27),
      child: Text(
        article.content ?? 'No Content',
        style: GoogleFonts.baskervville(
          fontSize: 19,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          height: 1.5,
        ),
      ),
    );
  }
}
