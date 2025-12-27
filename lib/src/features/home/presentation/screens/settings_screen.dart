import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/presentation/controllers/locale_controller.dart';
import '../../../../core/presentation/controllers/theme_controller.dart';
import '../../../../core/presentation/widgets/glass_container.dart';
import '../../../authentication/presentation/controllers/auth_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.settingsTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),

              // Profile Section
              GlassContainer(
                child: ListTile(
                  leading: Icon(Icons.person_outline,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text(l10n.myProfile),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => context.push('/profile'),
                ),
              ),
              const SizedBox(height: 16),

              // Appearance Section
              Text(
                l10n.appearance,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              GlassContainer(
                child: Column(
                  children: [
                    // Theme
                    ListTile(
                      leading: Icon(Icons.dark_mode_outlined,
                          color: Theme.of(context).colorScheme.primary),
                      title: Text(l10n.theme),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () => _showThemeSelector(context, ref, l10n),
                    ),
                    const Divider(height: 1),
                    // Language
                    ListTile(
                      leading: Icon(Icons.language,
                          color: Theme.of(context).colorScheme.primary),
                      title: Text(l10n.language),
                      subtitle: Text(locale.languageCode == 'en'
                          ? l10n.english
                          : l10n.bengali),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () => ref
                          .read(localeControllerProvider.notifier)
                          .toggleLocale(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Sign Out
              GlassContainer(
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent),
                  title: Text(l10n.signOut,
                      style: const TextStyle(color: Colors.redAccent)),
                  onTap: () => _showLogoutConfirmation(context, ref, l10n),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showThemeSelector(
      BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final currentTheme = ref.watch(themeControllerProvider);
          final primaryColor = Theme.of(context).colorScheme.primary;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(l10n.selectTheme,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.brightness_auto),
                title: Text(l10n.systemDefault),
                trailing: currentTheme == ThemeMode.system
                    ? Icon(Icons.check, color: primaryColor)
                    : null,
                onTap: () {
                  ref
                      .read(themeControllerProvider.notifier)
                      .setThemeMode(ThemeMode.system);
                  context.pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.light_mode),
                title: Text(l10n.light),
                trailing: currentTheme == ThemeMode.light
                    ? Icon(Icons.check, color: primaryColor)
                    : null,
                onTap: () {
                  ref
                      .read(themeControllerProvider.notifier)
                      .setThemeMode(ThemeMode.light);
                  context.pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: Text(l10n.dark),
                trailing: currentTheme == ThemeMode.dark
                    ? Icon(Icons.check, color: primaryColor)
                    : null,
                onTap: () {
                  ref
                      .read(themeControllerProvider.notifier)
                      .setThemeMode(ThemeMode.dark);
                  context.pop();
                },
              ),
              const SizedBox(height: 20),
            ],
          );
        });
      },
    );
  }

  void _showLogoutConfirmation(
      BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.signOut),
        content: Text(l10n.signOutConfirmation),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              context.pop(); // Close dialog
              await ref.read(authControllerProvider.notifier).logout();
              // Router will handle redirection automatically
            },
            child:
                Text(l10n.signOut, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
