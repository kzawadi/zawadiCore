import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsys/designsys.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zawadi_design/models/article_model.dart';
import 'package:zawadi_design/pages/news/widgets/article_view.dart';
import 'package:zawadi_design/ui/web_assets.dart';

///This widget is medeum sized in shape and follows after larger card in
///front page
class ArticleCardMedium extends StatelessWidget {
  const ArticleCardMedium(this.article, this.source);

  @required
  final Article? article;

  final bool source;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          ZawadiMethods.viewTransition(context, ArticleView(article, source)),
      child: Card(
        color: Colors.brown[200],
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
                      AutoSizeText(
                        article?.name ?? '',
                        style: GoogleFonts.notoSans(
                          textStyle:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        minFontSize: 11,
                        maxFontSize: 15,
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 64,
                        child: AutoSizeText(
                          !source
                              ? article?.title ??
                                  ''.substring(
                                      0, article?.title!.indexOf(' - '))
                              : article?.title ?? '',
                          style: GoogleFonts.notoSans(
                            // fontSize: 19,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                          maxLines: 3,
                          maxFontSize: 19,
                          minFontSize: 16,
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width - 164,
                        child: Text(
                          article?.getPublishedAtFormattedTime ?? '',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).primaryColor,
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
                    imageUrl: article?.getImageUrl ?? WebAssets().dummyImage,
                    fit: BoxFit.cover,
                    height: 100,
                    placeholder: (context, url) => Loading(
                      color: Theme.of(context).primaryColor,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
