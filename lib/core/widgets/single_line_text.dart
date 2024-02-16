import 'package:flutter/material.dart';

class SingleLineText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const SingleLineText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: style, maxLines: 1, overflow: TextOverflow.ellipsis);
  }
}
