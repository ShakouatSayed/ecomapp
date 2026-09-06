import 'package:ecomapp/app/extensions/localization_extension.dart';
import 'package:ecomapp/app/providers/local_provider.dart';
import 'package:ecomapp/app/providers/theme_provider.dart';
import 'package:ecomapp/features/auth/presentation/widgets/app_logo.dart';
import 'package:ecomapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
