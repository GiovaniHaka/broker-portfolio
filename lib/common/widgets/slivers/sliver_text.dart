import 'package:flutter/material.dart';

class SliverText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const SliverText(
    this.text, {
    Key? key,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
