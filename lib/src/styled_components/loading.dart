import 'package:designsys/designsys.dart';

/// A loading indicator for zawadi with a default sie of 40
/// its a chasing dot from spinKit package
class Loading extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor;
  final double? size;
  const Loading({Key? key, this.color, this.size, this.backgroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
        child: SpinKitChasingDots(
          size: size ?? 40,
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
