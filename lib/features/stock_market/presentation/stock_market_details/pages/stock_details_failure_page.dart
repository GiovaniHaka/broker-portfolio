import 'package:broker_portfolio/common/constants/ui/custom_text_style.dart';
import 'package:flutter/material.dart';

class StockDetailsFailurePage extends StatelessWidget {
  const StockDetailsFailurePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Algo deu errado ao buscar ativo',
          style: CustomTextStyle.titleMedium(context),
        ),
      ),
    );
  }
}
