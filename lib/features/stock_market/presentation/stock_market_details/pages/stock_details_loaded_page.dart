import 'package:broker_portfolio/common/constants/ui/custom_icon_data.dart';
import 'package:broker_portfolio/features/stock_market/presentation/stock_market_details/components/stock_market_chart.dart';
import 'package:broker_portfolio/features/stock_market/presentation/stock_market_details/components/stock_market_indicators_list.dart';
import 'package:flutter/material.dart';

import 'package:broker_portfolio/common/constants/ui/custom_text_style.dart';
import 'package:broker_portfolio/common/constants/ui/padding_constants.dart';
import 'package:broker_portfolio/common/widgets/separators/vertical_separator.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/stock_market.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/types/stock_range.dart';
import 'package:broker_portfolio/features/stock_market/presentation/stock_market_details/components/range_profitability_item.dart';
import 'package:broker_portfolio/features/stock_market/presentation/stock_market_details/components/selectable_stock_range_list.dart';

class StockDetailsLoadedPage extends StatefulWidget {
  final ValueChanged<StockRange> onChangeRange;
  final StockMarket stockMarket;

  const StockDetailsLoadedPage({
    Key? key,
    required this.stockMarket,
    required this.onChangeRange,
  }) : super(key: key);

  @override
  State<StockDetailsLoadedPage> createState() => _StockDetailsLoadedPageState();
}

class _StockDetailsLoadedPageState extends State<StockDetailsLoadedPage> {
  bool isShowingChart = false;

  switchIndicatorsView() {
    setState(() {
      isShowingChart = !isShowingChart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(),
            SliverPadding(
              padding: const EdgeInsets.all(viewPadding),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.stockMarket.symbol,
                          style: CustomTextStyle.headlineSmall(context),
                        ),
                        IconButton(
                          onPressed: () => switchIndicatorsView(),
                          icon: Icon(
                            isShowingChart
                                ? CustomIconData.list
                                : CustomIconData.chart,
                          ),
                        ),
                      ],
                    ),
                    const VerticalSeparator.large(),
                    SelectableStockRangeList(
                      onSelect: (value) => widget.onChangeRange(value),
                      ranges: widget.stockMarket.validRanges,
                      selectedRange: widget.stockMarket.range,
                    ),
                    const VerticalSeparator.large(),
                    RangeProfitabilityItem(
                      profitability: widget.stockMarket.rangeProfitability,
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.all(viewPadding),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.topCenter,
                  child: child,
                );
              },
              child: isShowingChart
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: StockMarketChart(
                        indicators: widget.stockMarket.indicators,
                      ),
                    )
                  : StockMarketIndicatorsList(
                      indicators: widget.stockMarket.indicators,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
