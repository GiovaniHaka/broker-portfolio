import 'package:broker_portfolio/utils/datetime/datetime_format.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:broker_portfolio/common/constants/ui/custom_colors.dart';
import 'package:broker_portfolio/common/constants/ui/custom_text_style.dart';
import 'package:broker_portfolio/common/constants/ui/padding_constants.dart';
import 'package:broker_portfolio/common/constants/ui/radius_constants.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/types/stock_indicator.dart';

class StockMarketChart extends StatefulWidget {
  final List<StockIndicator> indicators;

  const StockMarketChart({
    Key? key,
    required this.indicators,
  }) : super(key: key);

  @override
  State<StockMarketChart> createState() => _StockMarketChartState();
}

class _StockMarketChartState extends State<StockMarketChart> {
  List<FlSpot> spots = [];
  double minX = 0;
  double maxX = 0;
  double minY = 0;
  double maxY = 0;

  @override
  void initState() {
    super.initState();
    setSpots(widget.indicators);
  }

  void setSpots(List<StockIndicator> indicators) {
    for (int index = 0; index < indicators.length; index++) {
      final x = index.toDouble();
      final y = indicators[index].quote;

      if (x < minX) minX = x;
      if (x > maxX) maxX = x;
      if (y < minY) minY = y;
      if (y > maxY) maxY = y;
      spots.add(FlSpot(x, y));
    }
  }

  String getDateTimeByIndex(double index) {
    final intIndex = index.toInt();
    final dateTime = widget.indicators[intIndex].dateTime;
    return DateTimeFormat(dateTime).toYMD();
  }

  @override
  Widget build(BuildContext context) {
    final lineChartBarData = [
      LineChartBarData(
        spots: spots,
        isCurved: false,
        color: Colors.black,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
      ),
    ];

    final lineTouchData = LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        fitInsideHorizontally: true,
        maxContentWidth: 100,
        tooltipBgColor: Colors.black,
        getTooltipItems: (touchedSpots) {
          return touchedSpots.map((LineBarSpot touchedSpot) {
            final textStyle = CustomTextStyle.titleSmall(context)
                .copyWith(color: Colors.white);
            final date = getDateTimeByIndex(touchedSpot.x);
            final quote = touchedSpot.y.toStringAsFixed(2);

            return LineTooltipItem(
              '$date\nR\$ $quote',
              textStyle,
              textAlign: TextAlign.center,
            );
          }).toList();
        },
      ),
    );

    return AspectRatio(
      aspectRatio: 1.3,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          border: Border.all(color: CustomColors.greyMedium),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: largePadding),
          child: LineChart(
            LineChartData(
              minX: minX,
              maxX: maxX,
              minY: minY,
              maxY: maxY + 10,
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: lineChartBarData,
              lineTouchData: lineTouchData,
            ),
          ),
        ),
      ),
    );
  }
}
