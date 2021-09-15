import 'package:designsys/designsys.dart';

class ZawadiHeaderButton extends StatelessWidget {
  const ZawadiHeaderButton({
    Key? key,
    this.backgroundColor,
    this.icon,
    this.onPressed,
    this.radius,
    this.size,
    this.isClear,
  }) : super(key: key);
  final void Function()? onPressed;
  final Widget? icon;
  final Color? backgroundColor;
  final BorderRadius? radius;
  final double? size;
  final bool? isClear;

  @override
  Widget build(BuildContext context) {
    return ZawadiPrimaryButton(
      color: [false].contains(isClear)
          ? Theme.of(context).colorScheme.secondary
          : backgroundColor ?? ZawadiColors.transparent,
      containerHeight: size ?? 55.0,
      containerWidth: size ?? 55.0,
      borderRadius: radius ?? BorderRadius.circular(37),
      padding: const EdgeInsets.all(0),
      prefixIcon: icon,
      alignment: [null, false].contains(isClear)
          ? MainAxisAlignment.center
          : MainAxisAlignment.end,
      onPressed: onPressed ?? () {},
    );
  }
}
