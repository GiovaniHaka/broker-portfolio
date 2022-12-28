import 'package:flutter/material.dart';

class StockDetailsLoadingPage extends StatelessWidget {
  const StockDetailsLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
