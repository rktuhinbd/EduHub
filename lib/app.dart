import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/core/router/app_router.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import '../../src/l10n/generated/app_localizations.dart';
import 'src/core/presentation/controllers/locale_controller.dart';
import 'src/core/presentation/theme/app_theme.dart';

class EduHubApp extends ConsumerWidget {
  const EduHubApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final locale = ref.watch(localeControllerProvider);

    return MaterialApp.router(
      title: 'EduHub',
      theme: AppTheme.getTheme(locale),
      routerConfig: router,
      locale: locale,
      supportedLocales: const [
        Locale('en'),
        Locale('bn'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
