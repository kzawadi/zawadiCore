import 'package:designsys/designsys.dart';

class COVID19Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // return ZawadiMethods.viewTransition(context, COVID19View());
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'COVID-19 News: ',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      TextSpan(
                          text: 'Get the latest coverage of the coronavirus',
                          style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                ),
              ),
              ZawadiHeaderButton(
                icon: IconlyIcon(
                  IconlyBold.ArrowRight1,
                  color: Theme.of(context).colorScheme.secondaryVariant,
                ),
                radius: BorderRadius.all(Radius.circular(35)),
                size: 55.0,
                onPressed: () {
                  // return ZawadiMethods.viewTransition(context, COVID19View());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
