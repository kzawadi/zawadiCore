import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsys/designsys.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zawadi_design/models/article_model.dart';
import 'package:zawadi_design/pages/news/widgets/article_view.dart';

///The small of all which mainly its layout is more vertical and the last in
///stack of the front page
class ArticleCardSmall extends StatelessWidget {
  const ArticleCardSmall(this.article, this.source);

  @required
  final Article article;

  final bool source;

  /// Adds '...' to end of string if string word length is greater than 15
  String shortenLengthenOfTitle(String string) {
    string = !source ? string.substring(0, string.indexOf(' - ')) : string;
    if (string.split(' ').length >= 15) {
      return ZawadiMethods.addDotsToString(string, 15);
    } else {
      return string;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          ZawadiMethods.viewTransition(context, ArticleView(article, source)),
      child: Card(
        color: Colors.brown[200],
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipSquircleBorder(
              radius: BorderRadius.circular(45),
              child: CachedNetworkImage(
                imageUrl: article.getImageUrl,
                fit: BoxFit.cover,
                height: 125,
                placeholder: (context, url) => Loading(
                  color: Theme.of(context).primaryColor,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    article.name!,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                    minFontSize: 8,
                    maxLines: 1,
                    maxFontSize: 16,
                  ),
                  AutoSizeText(
                    shortenLengthenOfTitle(article.title!),
                    style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    minFontSize: 19,
                    overflow: TextOverflow.fade,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: AutoSizeText(
                article.getPublishedAtFormattedTime,
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
