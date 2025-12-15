import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/locale_controller.dart';
import '../widgets/glass_container.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeControllerProvider);

    return GestureDetector(
      onTap: () {
        ref.read(localeControllerProvider.notifier).toggleLocale();
      },
      child: GlassContainer(
        borderRadius: BorderRadius.circular(20),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              locale.languageCode == 'en' ? '🇺🇸 EN' : '🇧🇩 BN',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.language, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }
}
