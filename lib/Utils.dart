
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class Utils {

  static List<Widget> modelBuilder<M>(
      List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  static void showSheets(BuildContext context, {
    required Widget child,
    required VoidCallback onClicked
  }) =>
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  child,
                ],
            cancelButton: CupertinoActionSheetAction(
              child: Text("Done"),
              onPressed: onClicked,
            ),
              ));

  static String decodeEmpty(String s){
    if (null == s)
      return "";

    if (s.isEmpty)
      return "";

    return s;
  }

  static String decodeLate(String s){
    if (null == s)
      return "";

    if ('Y' == s)
      return "L";

    if (s.isEmpty)
      return "";

    return s;
  }



  static String decodeEarlyExit(String s){
    if (null == s)
      return "";

    if ('Y' == s)
      return "E";

    if (s.isEmpty)
      return "";

    return s;
  }

  static String decodeHoliday(String s){
    if (null == s)
      return "";

    if ('S' == s)
      return "WKN";

    if ('F' == s)
      return "WKN";

    if ('H' == s)
      return "Holiday";

    if ('A' == s)
      return "Absent";

    if ('LV' == s)
      return "Leave";

    if (s.isEmpty)
      return "";

    return s;
  }


}
