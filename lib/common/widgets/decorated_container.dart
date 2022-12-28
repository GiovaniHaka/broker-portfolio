import 'package:broker_portfolio/common/constants/ui/radius_constants.dart';
import 'package:flutter/material.dart';

import 'package:broker_portfolio/common/constants/ui/custom_colors.dart';
import 'package:broker_portfolio/common/constants/ui/padding_constants.dart';
import 'package:broker_portfolio/common/widgets/buttons/button_detector.dart';

class DecoratedContainer extends StatelessWidget {
  final Widget child;
  final double padding;
  final bool haveBorder;
  final Color color;
  final Function()? onTap;

  const DecoratedContainer({
    Key? key,
    required this.child,
    this.padding = defaultPadding,
    this.haveBorder = false,
    this.color = Colors.transparent,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonDetector(
      color: color,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.greyMedium),
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: child,
      ),
    );
  }
}
