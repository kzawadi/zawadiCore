import 'package:designsys/src/styled_components/buttons/primary_button.dart';
import '../../../designsys.dart';

class ZawadiBackButton extends StatelessWidget {
  final bool isClear;
  final bool iconColor;
  final void Function()? onPressed;
  final Color? surroundingColor;
  const ZawadiBackButton(
      {this.isClear = true,
      this.onPressed,
      this.surroundingColor,
      this.iconColor = false});

  @override
  Widget build(BuildContext context) {
    return ZawadiPrimaryButton(
      color: isClear
          ? ZawadiColors.transparent
          : surroundingColor ?? Theme.of(context).colorScheme.secondary,
      containerHeight: 60.0,
      containerWidth: 60.0,
      borderRadius: BorderRadius.circular(50),
      padding: EdgeInsets.all(8),
      prefixIcon: Icon(
        Iconsax.arrow_left_24,
        color: iconColor
            ? Theme.of(context)
                .colorScheme
                .secondaryVariant //todo solve icon colo0r

            : Theme.of(context).primaryColor,
        size: 27,
      ),
      alignment: isClear ? MainAxisAlignment.start : MainAxisAlignment.center,
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}
