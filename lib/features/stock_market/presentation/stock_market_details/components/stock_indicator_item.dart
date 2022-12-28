import 'package:flutter/material.dart';

import 'package:broker_portfolio/common/constants/ui/custom_colors.dart';
import 'package:broker_portfolio/common/constants/ui/custom_icon_data.dart';
import 'package:broker_portfolio/common/constants/ui/custom_text_style.dart';
import 'package:broker_portfolio/common/constants/ui/padding_constants.dart';
import 'package:broker_portfolio/common/constants/ui/radius_constants.dart';
import 'package:broker_portfolio/common/widgets/separators/horizontal_separator.dart';
import 'package:broker_portfolio/common/widgets/separators/vertical_separator.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/types/stock_indicator.dart';
import 'package:broker_portfolio/utils/currency/double_to_currency.dart';
import 'package:broker_portfolio/utils/datetime/datetime_format.dart';

class StockIndicatorItem extends StatelessWidget {
  final StockIndicator indicator;

  const StockIndicatorItem({
    Key? key,
    required this.indicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        border: Border.all(
          color: CustomColors.greyMedium,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  doubleToCurrency(indicator.quote),
                  style: CustomTextStyle.titleSmall(context),
                ),
                const VerticalSeparator.small(),
                Builder(builder: (context) {
                  final variation = indicator.profitability;

                  final color = variation >= 0
                      ? CustomColors.greenStrong
                      : CustomColors.redStrong;

                  final iconData = variation >= 0
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
          ),
          Text(
            DateTimeFormat(indicator.dateTime).toYMD(),
            style: CustomTextStyle.labelSmall(context),
          ),
        ],
      ),
    );
  }
}
