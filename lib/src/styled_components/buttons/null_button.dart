import 'package:designsys/designsys.dart';

class ZawadiNullButton extends StatelessWidget {
  const ZawadiNullButton();

  @override
  Widget build(BuildContext context) {
    return ZawadiHeaderButton(
      backgroundColor: ZawadiColors.transparent,
      icon: Container(),
    );
  }
}
