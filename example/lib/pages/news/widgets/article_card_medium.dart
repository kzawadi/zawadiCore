import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsys/designsys.dart';
import 'package:zawadi_design/models/article_model.dart';
import 'package:zawadi_design/pages/news/widgets/article_view.dart';

class ArticleCardMedium extends StatelessWidget {
  const ArticleCardMedium(this.article, this.source);

  @required
  final Article article;
  final bool source;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          ZawadiMethods.viewTransition(context, ArticleView(article, source)),
      child: Card(
        margin: EdgeInsets.all(8),
        shape: SquircleBorder(radius: BorderRadius.all(Radius.circular(25))),
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        article.name!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 64,
                        child: Text(
                          !source
                              ? article.title!
                                  .substring(0, article.title!.indexOf(' - '))
                              : article.title!,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 164,
                        child: Text(
                          article.getPublishedAtFormattedTime,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryVariant,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: ClipSquircleBorder(
                  radius: BorderRadius.all(Radius.circular(30)),
                  child: CachedNetworkImage(
                    imageUrl: article.getImageUrl,
                    fit: BoxFit.cover,
                    height: 100,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),

                  // Image.network(
                  //   article.getImageUrl,
                  //   fit: BoxFit.cover,
                  //   width: 100,
                  //   height: 100,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
