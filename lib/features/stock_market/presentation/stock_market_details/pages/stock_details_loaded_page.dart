import 'package:broker_portfolio/common/widgets/separators/vertical_separator.dart';
import 'package:broker_portfolio/common/widgets/slivers/sliver_list_separated.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/types/stock_range.dart';
import 'package:broker_portfolio/features/stock_market/presentation/stock_market_details/components/selectable_stock_range_list.dart';
import 'package:broker_portfolio/features/stock_market/presentation/stock_market_details/components/stock_indicator_item.dart';
import 'package:flutter/material.dart';

import 'package:broker_portfolio/common/constants/ui/custom_text_style.dart';
import 'package:broker_portfolio/common/constants/ui/padding_constants.dart';
import 'package:broker_portfolio/common/widgets/slivers/sliver_text.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/stock_market.dart';

class StockDetailsLoadedPage extends StatelessWidget {
  final ValueChanged<StockRange> onChangeRange;
  final StockMarket stockMarket;

  const StockDetailsLoadedPage({
    Key? key,
    required this.stockMarket,
    required this.onChangeRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(),
            SliverPadding(
              padding: const EdgeInsets.all(viewPadding),
              sliver: SliverText(
                stockMarket.symbol,
                style: CustomTextStyle.headlineSmall(context),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(viewPadding),
              sliver: SliverToBoxAdapter(
                child: SelectableStockRangeList(
                  onSelect: (value) => onChangeRange(value),
                  ranges: stockMarket.validRanges,
                  selectedRange: stockMarket.range,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(viewPadding),
              sliver: SliverListSeparated(
                itemBuilder: (BuildContext context, int index) {
                  final reversedList = stockMarket.indicators.reversed.toList();
                  final indicator = reversedList[index];
                  return StockIndicatorItem(indicator: indicator);
                },
                separator: const VerticalSeparator(),
                itemCount: stockMarket.indicators.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
