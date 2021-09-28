import 'package:designsys/designsys.dart';
import 'package:zawadi_design/models/article_model.dart';

class ArticleCardLarge extends StatelessWidget {
  const ArticleCardLarge(this.article, this.source);
  @required
  final Article article;
  final bool source;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // return CantonMethods.viewTransition(context, ArticleView(article, source));
      },
      child: Card(
        shape: const SquircleBorder(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipSquircleBorder(
              // radius: BorderRadius.circular(45),
              child: Image.network(
                article.getImageUrl,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Text(
                article.name!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                  !source
                      ? article.title!
                          .substring(0, article.title!.indexOf(' - '))
                      : article.title!,
                  style: Theme.of(context).textTheme.headline6),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
}
