import 'package:designsys/designsys.dart';

class ViewHeaderOne extends StatelessWidget {
  final String? title;
  final Widget? button;

  const ViewHeaderOne({this.title, this.button});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        Spacer(),
        button ??
            ZawadiHeaderButton(
              backgroundColor: ZawadiColors.transparent,
              icon: Container(),
              onPressed: () {},
            ),
      ],
    );
  }
}
