import 'package:broker_portfolio/common/constants/ui/separator_constants.dart';
import 'package:flutter/material.dart';

class HorizontalSeparator extends StatelessWidget {
  final double width;

  const HorizontalSeparator({
    Key? key,
    this.width = defaultSeparator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }

  const HorizontalSeparator.large({
    Key? key,
    this.width = largeSeparator,
  }) : super(key: key);
  
  const HorizontalSeparator.medium({
    Key? key,
    this.width = mediumSeparator,
  }) : super(key: key);
  
  const HorizontalSeparator.small({
    Key? key,
    this.width = smallSeparator,
  }) : super(key: key);
}
