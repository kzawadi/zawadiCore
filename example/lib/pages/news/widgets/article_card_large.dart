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
          children: [
            Expanded(
              child: ClipSquircleBorder(
                radius: BorderRadius.all(Radius.circular(25)),
                child: CachedNetworkImage(
                  imageUrl: article?.getImageUrl ?? WebAssets().dummyImage,
                  fit: BoxFit.cover,
                  height: 200,
                  placeholder: (context, url) => Loading(
                    color: Theme.of(context).primaryColor,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: AutoSizeText(
                article?.name ?? "",
                style: GoogleFonts.notoSans(
                  textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                minFontSize: 12,
                maxFontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                !source
                    ? article?.title ??
                        "".substring(0, article?.title!.indexOf(' - '))
                    : article?.title ?? "",
                style: GoogleFonts.notoSans(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: AutoSizeText(
                article?.getPublishedAtFormattedTime ?? '00:00:00:00',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
