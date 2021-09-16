import 'package:designsys/designsys.dart';

/// A loading indicator for zawadi with a default sie of 40
/// its a chasing dot from spinKit package
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitChasingDots(
        size: 40,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
