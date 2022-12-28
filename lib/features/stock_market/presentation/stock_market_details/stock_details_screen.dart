import 'package:broker_portfolio/common/constants/states/states.dart';
import 'package:broker_portfolio/features/stock_market/presentation/stock_market_details/pages/stock_details_failure_page.dart';
import 'package:broker_portfolio/features/stock_market/presentation/stock_market_details/pages/stock_details_loading_page.dart';
import 'package:broker_portfolio/features/stock_market/presentation/stock_market_details/pages/stock_details_loaded_page.dart';
import 'package:broker_portfolio/features/stock_market/presentation/stock_market_details/stock_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StockMarketDetailsScreen extends StatefulWidget {
  final String stockSymbol;

  const StockMarketDetailsScreen({
    Key? key,
    required this.stockSymbol,
  }) : super(key: key);

  @override
  State<StockMarketDetailsScreen> createState() =>
      _StockMarketDetailsScreenState();
}

class _StockMarketDetailsScreenState extends State<StockMarketDetailsScreen> {
  final controller = StockMarketDetailsController();

  @override
  void initState() {
    super.initState();
    controller.initialize(widget.stockSymbol);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.state.value) {
        case States.loading:
          return const StockDetailsLoadingPage();
        case States.loaded:
          return controller.stockMarket.value.fold(
            (failure) {
              return const StockDetailsFailurePage();
            },
            (stock) {
              return StockDetailsLoadedPage(
                stockMarket: stock,
                onChangeRange: (value) => controller.onChangeRange(value),
              );
            },
          );

        default:
          return const StockDetailsLoadingPage();
      }
    });
  }
}
