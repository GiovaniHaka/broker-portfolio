import 'package:broker_portfolio/common/constants/ui/separator_constants.dart';
import 'package:broker_portfolio/features/home/components/stock_market_item.dart';
import 'package:broker_portfolio/features/stock_market/presentation/stock_market_details/stock_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class StockMarketGrid extends StatelessWidget {
  final List<String> stocks;

  const StockMarketGrid({
    Key? key,
    required this.stocks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: defaultSeparator,
        crossAxisSpacing: defaultSeparator,
        childAspectRatio: 2.5,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final symbol = stocks[index];

          return StockMarketItem(
            symbol: symbol,
            onTap: () => Get.to(StockMarketDetailsScreen(
              stockSymbol: symbol,
            )),
          );
        },
        childCount: stocks.length,
      ),
    );
  }
}
