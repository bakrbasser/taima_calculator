import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taima_calculator/source/data/db.dart';
import 'package:taima_calculator/source/presentation/cubit/currencies_list/currencies_list_cubit.dart';
import 'package:taima_calculator/source/presentation/cubit/update_currencies/update_currencies_cubit.dart';
import 'package:taima_calculator/source/presentation/pages/home.dart';
import 'package:taima_calculator/source/theme.dart';

void main() async {
  await Hive.initFlutter();
  await CurrencyHiveService()
      .init(); // Initialize the Hive box before running the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CurrenciesListCubit()),
        BlocProvider(create: (context) => UpdateCurrenciesCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale('ar'), // Arabic locale (RTL)
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Arabic
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: 'حاسبة عملات تيما',
        theme: AppTheme.lightTheme,
        home: const Home(),
      ),
    );
  }
}
