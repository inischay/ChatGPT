import 'package:flutter/material.dart';

import '../contraints.dart';
import '../widgets/drop_dowm_widget.dart';
import '../widgets/text_widget.dart';

class Services {
  static Future<void> showModelSheet(BuildContext context) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        backgroundColor: scaffoldBackdroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: TextWidget(
                    label: "Chosen Model",
                    fonsize: 16,
                  ),
                ),
                Flexible(flex: 2, child: DropDownWidget())
              ],
            ),
          );
        });
  }
}
