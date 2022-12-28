import 'package:broker_portfolio/common/widgets/decorated_container.dart';
import 'package:flutter/material.dart';

import 'package:broker_portfolio/common/constants/ui/custom_colors.dart';
import 'package:broker_portfolio/common/constants/ui/custom_icon_data.dart';
import 'package:broker_portfolio/common/constants/ui/custom_text_style.dart';
import 'package:broker_portfolio/common/widgets/separators/horizontal_separator.dart';

class RangeProfitabilityItem extends StatelessWidget {
  final double profitability;

  const RangeProfitabilityItem({
    Key? key,
    required this.profitability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Rentabilidade no período',
            style: CustomTextStyle.titleSmall(context),
          ),
          Builder(builder: (context) {
            final variation = profitability;

            final color = variation > 0
                ? CustomColors.greenStrong
                : CustomColors.redStrong;

            final iconData = variation > 0
                ? CustomIconData.trendingUp
                : CustomIconData.trendingDown;

            return Row(
              children: [
                Icon(
                  iconData,
                  color: color,
                  size: 18,
                ),
                const HorizontalSeparator.small(),
                Text(
                  '${variation.toStringAsFixed(2)}%',
                  style: CustomTextStyle.bodySmall(context).copyWith(
                    color: color,
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
