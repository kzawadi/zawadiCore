import 'package:designsys/designsys.dart';

class IconlyIcon extends StatelessWidget {
  final String path;
  final Color? color;
  final double? size;

  const IconlyIcon(this.path, {this.color, this.size});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      color: color ?? ZawadiColors.gray,
      width: size ?? 24,
      height: size ?? 24,
      semanticsLabel: '',
    );
  }
}
