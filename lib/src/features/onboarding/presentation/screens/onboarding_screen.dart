import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../src/l10n/generated/app_localizations.dart';
import '../../../../core/presentation/widgets/glass_container.dart';
import '../../../../core/presentation/widgets/language_switcher.dart';
import '../../../../core/storage/shared_prefs_service.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final pages = [
      _OnboardingPageData(
        title: l10n.onboardingTitle1,
        description: l10n.onboardingDesc1,
        imagePath: 'assets/images/onboarding_learn.png',
      ),
      _OnboardingPageData(
        title: l10n.onboardingTitle2,
        description: l10n.onboardingDesc2,
        imagePath: 'assets/images/onboarding_expert.png',
      ),
      _OnboardingPageData(
        title: l10n.onboardingTitle3,
        description: l10n.onboardingDesc3,
        imagePath: 'assets/images/onboarding_interactive.png',
      ),
      _OnboardingPageData(
        title: l10n.onboardingTitle4,
        description: l10n.onboardingDesc4,
        imagePath: 'assets/images/onboarding_certificate.png',
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF2E3192), Color(0xFF1BFFFF)],
              ),
            ),
          ),

          // Page View
          PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final page = pages[index];
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        page.imagePath,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 40),
                    GlassContainer(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Text(
                            page.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            page.description,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: Colors.white.withValues(alpha: 0.9),
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // Top Bar (Language Switcher)
          const Positioned(
            top: 50,
            right: 20,
            child: LanguageSwitcher(),
          ),

          // Bottom Controls
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Dots Indicator
                Row(
                  children: List.generate(
                    pages.length,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 8),
                      width: _currentPage == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                // Next/Done Button
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < pages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      ref
                          .read(sharedPrefsServiceProvider)
                          .setOnboardingComplete();
                      context
                          .go('/register'); // Go to register after onboarding
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF2E3192),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPageData {
  final String title;
  final String description;
  final String imagePath;

  _OnboardingPageData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
