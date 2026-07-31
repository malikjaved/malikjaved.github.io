import 'package:flutter/material.dart';

import '/Widget/MobileWorkBox.dart';

class MobileWork extends StatefulWidget {
  @override
  _MobileWorkState createState() => _MobileWorkState();
}

class _MobileWorkState extends State<MobileWork> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: size.width,
        height: size.height * 1.7,
      ),
      child: Column(
        children: [
          Container(
            height: size.height * 1.7,
            child: MobileWorkBox(),
          )
        ],
      ),
    );
  }
}
