import 'package:ecomapp/app/app_routes.dart';
import 'package:ecomapp/app/app_theme.dart';
import 'package:ecomapp/app/providers/local_provider.dart';
import 'package:ecomapp/app/providers/theme_provider.dart';
import 'package:ecomapp/features/auth/presentation/screens/splash_screen.dart';
import 'package:ecomapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../features/shared/presentation/providers/main_nab_holder_provider.dart';

class ANBBuyApp extends StatefulWidget {
  const ANBBuyApp({super.key});

  @override
  State<ANBBuyApp> createState() => _ANBBuyAppState();
}

class _ANBBuyAppState extends State<ANBBuyApp> {
  final LocaleProvider _localeProvider = LocaleProvider();

  final ThemeProvider _themeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();
    _themeProvider.init();
    _localeProvider.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _localeProvider),
        ChangeNotifierProvider.value(value: _themeProvider),
        ChangeNotifierProvider(create: (_) => MainNavHolderProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, _, _) {
          return Consumer<LocaleProvider>(
            builder: (context, _, _) {
              return MaterialApp(
                title: "ANB Bay",
                home: SplashScreen(),
                initialRoute: SplashScreen.name,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  ...GlobalMaterialLocalizations.delegates,
                ],
                onGenerateRoute: AppRoutes.onGeneateRoute,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: _themeProvider.currentThemeMode,
                supportedLocales: _localeProvider.supportedLocales,
                locale: _localeProvider.currentLocale,
              );
            },
          );
        },
      ),
    );
  }
}
