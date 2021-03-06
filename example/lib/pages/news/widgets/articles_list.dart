import 'package:designsys/designsys.dart';
import 'package:zawadi_design/models/article_model.dart';
import 'package:zawadi_design/pages/news/widgets/article_card_large.dart';
import 'package:zawadi_design/pages/news/widgets/article_card_medium.dart';
import 'package:zawadi_design/pages/news/widgets/covid19_card.dart';

class ArticleList extends StatelessWidget {
  const ArticleList(this.articles, this.showCovid19Card, this.source);

  final List<Article> articles;
  final bool showCovid19Card, source;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (articles.length != 0 && index <= 5) {
            switch (index) {
              case 0:
                return showCovid19Card ? COVID19Card() : Container();
              case 1:
                return ArticleCardLarge(articles[index], source);
              default:
                return ArticleCardMedium(articles[index], source);
            }
          } else {
            return Container();
          }
        },

        /// Sets ChildCount to one incase of error and needs to display on Item in the list
        /// This also allows the use of the [RefreshList] widget, to refresh the feed.
        childCount: articles.length != 0 ? articles.length - 1 : 1,
      ),
    );
  }
}
