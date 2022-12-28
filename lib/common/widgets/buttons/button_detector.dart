import 'package:broker_portfolio/common/constants/ui/radius_constants.dart';
import 'package:flutter/material.dart';

class ButtonDetector extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function()? onTap;

  const ButtonDetector({
    Key? key,
    this.color = Colors.white,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(defaultRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(defaultRadius),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
