import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsys/designsys.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zawadi_design/models/article_model.dart';
import 'package:zawadi_design/pages/news/widgets/article_view.dart';
import 'package:zawadi_design/ui/web_assets.dart';

///This is the widget in front page displaying a slighlty larger card of news
///currently only a single widgets is displayed in mobile view
class ArticleCardLarge extends StatelessWidget {
  const ArticleCardLarge(this.article, this.source);

  @required
  final Article? article;

  final bool source;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          ZawadiMethods.viewTransition(context, ArticleView(article!, source)),
      child: Card(
        color: Colors.brown[200],
        margin: EdgeInsets.all(8),
        shape:
            const SquircleBorder(radius: BorderRadius.all(Radius.circular(25))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipSquircleBorder(
              radius: BorderRadius.all(Radius.circular(25)),
              child: CachedNetworkImage(
                imageUrl: article?.urlToImage ?? WebAssets().dummyImage,
                fit: BoxFit.cover,
                height: 200,
                placeholder: (context, url) => Loading(
                  color: Theme.of(context).primaryColor,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 5,
                  // padding:
                  //     const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: AutoSizeText(
                    article?.name ?? "",
                    style: GoogleFonts.notoSans(
                      textStyle:
                          Theme.of(context).textTheme.bodyText2!.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontStyle: FontStyle.italic,
                              ),
                      fontSize: 12,
                    ),
                    minFontSize: 12,
                    maxFontSize: 16,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  flex: 3,
                  // padding:
                  //     const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  child: AutoSizeText(
                    article?.getPublishedAtFormattedTime ?? '00:00:00:00',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                    minFontSize: 12,
                    maxFontSize: 16,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 10),
              child: AutoSizeText(
                !source
                    ? article?.title ??
                        "".substring(0, article?.title!.indexOf(' - '))
                    : article?.title ?? "",
                style: GoogleFonts.notoSans(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                minFontSize: 19,
                maxFontSize: 22,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
