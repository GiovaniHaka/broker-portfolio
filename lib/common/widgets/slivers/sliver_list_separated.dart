import 'package:flutter/material.dart';

class SliverListSeparated extends StatefulWidget {
  final Widget? Function(BuildContext, int) itemBuilder;
  final Widget separator;
  final int itemCount;

  const SliverListSeparated({
    Key? key,
    required this.itemBuilder,
    required this.separator,
    required this.itemCount,
  }) : super(key: key);

  @override
  State<SliverListSeparated> createState() => _SliverListSeparatedState();
}

class _SliverListSeparatedState extends State<SliverListSeparated> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          final int itemIndex = index ~/ 2;
          if (!index.isEven) {
            return widget.separator;
          }
          return widget.itemBuilder.call(_, itemIndex);
        },
        semanticIndexCallback: (widget, index) {
          if (index.isEven) return index ~/ 2;
          return null;
        },
        childCount: widget.itemCount * 2 - 1,
      ),
    );
  }
}
