import 'package:designsys/designsys.dart';

class ZawadiMethods {
  /// Defocuses a textfield
  static void defocusTextfield(BuildContext context) =>
      FocusScope.of(context).requestFocus(new FocusNode());

  /// Default transition for switching views
  static Future<void> viewTransition(BuildContext context, Widget view) =>
      Navigator.push(
        context,
        PageTransition(
          child: view,
          type: PageTransitionType.rightToLeft,
          curve: Curves.ease,
          duration: Duration(milliseconds: 300),
        ),
      );

  /// Adds '...' to the end of a string
  static String addDotsToString(String string, int index) {
    List<String> wordList = string.split(' ');

    String result =
        wordList.sublist(0, index).join(' ').replaceAll(RegExp(r' '), ' ') +
            '...';

    return result;
  }

  static String separateNumberByThreeDigits(
      {required int source, bool? commas}) {
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc;

    if ([null, false].contains(commas)) {
      mathFunc = (Match match) => '${match[1]} ';
    } else {
      mathFunc = (Match match) => '${match[1]},';
    }

    String result = source.toString().replaceAllMapped(reg, mathFunc);

    return result;
  }

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
