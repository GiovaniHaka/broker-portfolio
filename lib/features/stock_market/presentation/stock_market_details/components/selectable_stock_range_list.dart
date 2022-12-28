import 'package:broker_portfolio/common/constants/ui/custom_text_style.dart';
import 'package:broker_portfolio/common/constants/ui/padding_constants.dart';
import 'package:broker_portfolio/common/widgets/decorated_container.dart';
import 'package:flutter/material.dart';

import 'package:broker_portfolio/common/widgets/separators/horizontal_separator.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/types/stock_range.dart';

class SelectableStockRangeList extends StatelessWidget {
  final ValueChanged<StockRange> onSelect;
  final List<StockRange> ranges;
  final StockRange selectedRange;

  const SelectableStockRangeList({
    Key? key,
    required this.onSelect,
    required this.ranges,
    required this.selectedRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final range = ranges[index];

          return StockRangeItem(
            range: range,
            isSelected: range == selectedRange,
            onTap: () => onSelect(range),
          );
        },
        separatorBuilder: (context, index) {
          return const HorizontalSeparator();
        },
        itemCount: ranges.length,
      ),
    );
  }
}

class StockRangeItem extends StatelessWidget {
  final StockRange range;
  final Function()? onTap;
  final bool isSelected;

  const StockRangeItem({
    Key? key,
    required this.range,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      onTap: onTap,
      padding: smallPadding,
      color: isSelected ? Colors.black : Colors.white,
      child: Text(
        range.value,
        style: CustomTextStyle.labelSmall(context).copyWith(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
