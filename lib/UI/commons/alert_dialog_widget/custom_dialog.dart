import 'package:flutter/material.dart';

Future<void> showCustomDialogSimple({
  @required BuildContext? context,
  Widget? body,
  bool? barrierDismissible = false,
}) async {
  return showDialog(
    context: context!,
    barrierDismissible: barrierDismissible!,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        child: Padding(padding: const EdgeInsets.all(16), child: body),
      );
    },
  );
}
