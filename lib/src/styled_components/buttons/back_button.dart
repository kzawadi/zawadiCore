import 'package:designsys/src/styled_components/buttons/primary_button.dart';
import '../../../designsys.dart';

class ZawadiBackButton extends StatelessWidget {
  final bool? isClear;
  final void Function()? onPressed;
  const ZawadiBackButton({this.isClear, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ZawadiPrimaryButton(
      color: [null, false].contains(isClear)
          ? Theme.of(context).colorScheme.secondary
          : ZawadiColors.transparent,
      containerHeight: 60.0,
      containerWidth: 60.0,
      borderRadius: BorderRadius.circular(50),
      padding: EdgeInsets.zero,
      prefixIcon: Icon(
        Iconsax.arrow_left_3,
        color: [null, false].contains(isClear)
            ? Theme.of(context).colorScheme.secondaryVariant
            : Theme.of(context).primaryColor,
        size: 27,
      ),
      alignment: [null, false].contains(isClear)
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}
