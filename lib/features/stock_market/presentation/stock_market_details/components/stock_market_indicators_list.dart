import 'package:broker_portfolio/common/widgets/separators/vertical_separator.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/types/stock_indicator.dart';
import 'package:flutter/material.dart';

import 'stock_indicator_item.dart';

class StockMarketIndicatorsList extends StatelessWidget {
  final List<StockIndicator> indicators;

  const StockMarketIndicatorsList({
    Key? key,
    required this.indicators,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final reversedList = indicators.reversed.toList();
        final indicator = reversedList[index];
        return StockIndicatorItem(indicator: indicator);
      },
      separatorBuilder: (context, index) {
        return const VerticalSeparator();
      },
      itemCount: indicators.length,
    );
  }
}
