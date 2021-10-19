import 'package:flutter/material.dart';


class NoDataScreen extends StatefulWidget {
  final GestureTapCallback onPressRetry;

  const NoDataScreen({Key? key, required this.onPressRetry}) : super(key: key);

  @override
  _NoDataScreenState createState() => _NoDataScreenState();
}

class _NoDataScreenState extends State<NoDataScreen> {



  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[

          ],
        ),
      ),
    );
  }
}