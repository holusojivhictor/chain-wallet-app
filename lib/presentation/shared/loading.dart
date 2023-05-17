import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final bool useScaffold;
  final Color? color;
  final MainAxisSize mainAxisSize;

  const Loading({
    Key? key,
    this.useScaffold = true,
    this.color,
    this.mainAxisSize = MainAxisSize.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = Column(
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(color: color),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            'Loading',
            textAlign: TextAlign.center,
            style: TextStyle(color: color),
          ),
        ),
      ],
    );
    if (!useScaffold) return body;
    return Scaffold(body: body);
  }
}
