import 'package:auto_size_text/auto_size_text.dart';
import 'package:designsys/assets/icons/iconly_line.dart';
import 'package:designsys/designsys.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zawadi_design/pages/news/widgets/covid19_view_mobile_portrait.dart';

class COVID19Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          ZawadiMethods.viewTransition(context, Covid19ViewMobilePortrait()),
      child: Card(
        color: Colors.brown[200],
        shape:
            const SquircleBorder(radius: BorderRadius.all(Radius.circular(25))),
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Row(
            children: [
              Expanded(
                child: AutoSizeText.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'COVID-19 News: ',
                        style: GoogleFonts.notoSans(
                          textStyle:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      TextSpan(
                        text: 'Get the latest coverage of the coronavirus',
                        style: GoogleFonts.notoSans(
                          textStyle:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  maxFontSize: 16,
                  maxLines: 1,
                  minFontSize: 8,
                ),
              ),
              ZawadiHeaderButton(
                icon: IconlyIcon(
                  IconlyLine.ArrowRightSquare,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                radius: BorderRadius.all(Radius.circular(25)),
                size: 40.0,
                onPressed: () {
                  // return ZawadiMethods.viewTransition(context, COVID19View());
                },
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .secondaryVariant
                    .withOpacity(0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
