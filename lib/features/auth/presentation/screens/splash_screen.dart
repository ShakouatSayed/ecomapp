import 'package:ecomapp/app/extensions/utility_extension.dart';
import 'package:ecomapp/app/providers/local_provider.dart';
import 'package:ecomapp/app/providers/theme_provider.dart';
import 'package:ecomapp/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/screens/main_nav_holder_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainNavHolderScreen.name,
      (predicate) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localization;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            LocaleChangerDropdown(),
            ThemeChangerDropdown(),
            Spacer(),
            CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text('${localizations.version} 1.0.0'),
          ],
        ),
      ),
    );
  }
}

class LocaleChangerDropdown extends StatelessWidget {
  const LocaleChangerDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, _) {
        return DropdownButton<Locale>(
          value: localeProvider.currentLocale,
          items: localeProvider.supportedLocales.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e.languageCode.toLowerCase()),
            );
          }).toList(),
          onChanged: (Locale? newLocale) {
            if (newLocale != null) {
              localeProvider.changeLocale(newLocale);
            }
          },
        );
      },
    );
  }
}

class ThemeChangerDropdown extends StatelessWidget {
  const ThemeChangerDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return DropdownButton<ThemeMode>(
          value: themeProvider.currentThemeMode,
          items: themeProvider.themeMode.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e.toString().toLowerCase()),
            );
          }).toList(),
          onChanged: (ThemeMode? newThemeMode) {
            if (newThemeMode != null) {
              themeProvider.changeThemeMode(newThemeMode);
            }
          },
        );
      },
    );
  }
}
