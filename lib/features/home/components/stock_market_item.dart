import 'package:broker_portfolio/common/constants/ui/custom_icon_data.dart';
import 'package:broker_portfolio/common/constants/ui/custom_text_style.dart';
import 'package:broker_portfolio/common/widgets/decorated_container.dart';
import 'package:flutter/material.dart';

class StockMarketItem extends StatelessWidget {
  final String symbol;
  final Function() onTap;

  const StockMarketItem({
    Key? key,
    required this.symbol,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            symbol,
            style: CustomTextStyle.titleSmall(context),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.bottomRight,
            child: Icon(CustomIconData.chevronRight),
          ),
        ],
      ),
    );
  }
}
