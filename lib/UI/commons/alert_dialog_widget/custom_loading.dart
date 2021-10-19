
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoading {
  static progressDialog(bool isLoading, BuildContext context) {
    AlertDialog dialog = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Container(
        height: 40,
        child: CustomLoadingLayout()
      ),
//      contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
    );
    if (!isLoading) {
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return dialog;
        },
        useRootNavigator: true,
      );
    }
  }

  static showProgressDialog(bool isLoading, BuildContext context, {required String message}) {
    AlertDialog dialog = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: SizedBox(
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
            const SizedBox(width: 10,),
            Text(message)
          ],
        ),
      ),
//      contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
    );
    if (!isLoading) {
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return dialog;
        },
        useRootNavigator: true,
      );
    }
  }


}

class CustomLoadingLayout extends StatefulWidget {
  const CustomLoadingLayout({Key? key}) : super(key: key);

  @override
  _CustomLoadingLayoutState createState() => _CustomLoadingLayoutState();
}

class _CustomLoadingLayoutState extends State<CustomLoadingLayout>{


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        CircularProgressIndicator(),
        SizedBox(width: 10,),
        Text("moving files....")
      ],
    );
  }
}
