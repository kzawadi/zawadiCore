import 'package:designsys/designsys.dart';

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
