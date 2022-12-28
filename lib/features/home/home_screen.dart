import 'package:flutter/material.dart';

import 'package:broker_portfolio/common/constants/ui/custom_text_style.dart';
import 'package:broker_portfolio/common/constants/ui/padding_constants.dart';
import 'package:broker_portfolio/common/widgets/slivers/sliver_text.dart';
import 'package:broker_portfolio/features/home/components/stock_market_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularStocks = [
      'PETR4.SA',
      'VALE3.SA',
      'BBAS3.SA',
      'AMER3.SA',
      'MGLU3.SA',
      'ITUB4.SA',
    ];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(),
            SliverPadding(
              padding: const EdgeInsets.all(viewPadding),
              sliver: SliverText(
                'Portfolio',
                style: CustomTextStyle.headlineSmall(context),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(viewPadding),
              sliver: StockMarketGrid(stocks: popularStocks),
            ),
          ],
        ),
      ),
    );
  }
}
