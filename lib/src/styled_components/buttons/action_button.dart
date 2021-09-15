import 'package:designsys/designsys.dart';
import 'package:designsys/src/styled_components/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class ZawadiActionButton extends StatelessWidget {
  final Widget icon;
  final Color? iconColor;
  final double? iconSize, containerWidth, containerHeight;
  final EdgeInsets? padding;
  final MainAxisAlignment? alignment;
  final void Function()? onPressed;

  const ZawadiActionButton({
    required this.icon,
    required this.onPressed,
    this.iconColor,
    this.containerWidth,
    this.containerHeight,
    this.alignment,
    this.padding,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return ZawadiPrimaryButton(
      prefixIcon: icon,
      borderRadius: BorderRadius.zero,
      color: ZawadiColors.transparent,
      alignment: alignment ?? MainAxisAlignment.center,
      containerWidth: containerWidth ?? 40,
      containerHeight: containerHeight ?? 40,
      iconColor: iconColor ?? Theme.of(context).primaryColor,
      iconSize: iconSize ?? 21,
      padding: padding ?? const EdgeInsets.all(5),
      onPressed: onPressed,
    );
  }
}
