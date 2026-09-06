import 'package:ecomapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension UtilityExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
  TextTheme get textTheme => TextTheme.of(this);
}
