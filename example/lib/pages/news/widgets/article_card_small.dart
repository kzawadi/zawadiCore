import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsys/designsys.dart';
import 'package:zawadi_design/models/article_model.dart';
import 'package:zawadi_design/pages/news/widgets/article_view.dart';

class ArticleCardSmall extends StatelessWidget {
  const ArticleCardSmall(this.article, this.source);

  @required
  final Article article;
  final bool source;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          ZawadiMethods.viewTransition(context, ArticleView(article, source)),
      child: Card(
        color: Colors.white54,
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
                placeholder: (context, url) => Loading(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // Image.network(
              //   article.getImageUrl,
              //   fit: BoxFit.cover,
              //   height: 125,
              // ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.name!,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    shortenLengthenOfTitle(article.title!),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                article.getPublishedAtFormattedTime,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Adds '...' to end of string if string word length is greater than 15
  String shortenLengthenOfTitle(String string) {
    string = !source ? string.substring(0, string.indexOf(' - ')) : string;
    if (string.split(' ').length >= 15) {
      return ZawadiMethods.addDotsToString(string, 15);
    } else {
      return string;
    }
  }
}
