import 'package:broker_portfolio/common/constants/ui/custom_colors.dart';
import 'package:broker_portfolio/features/stock_market/presentation/stock_market_details/stock_details_screen.dart';
import 'package:flutter/material.dart';import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'pt_BR';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      theme: ThemeData(
        backgroundColor: CustomColors.backgroundColor,
        scaffoldBackgroundColor: CustomColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: CustomColors.backgroundColor,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const StockMarketDetailsScreen(stockSymbol: 'PETR4.SA'),
    );
  }
}
