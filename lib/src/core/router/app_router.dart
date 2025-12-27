import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/authentication/domain/entities/user_entity.dart';
import '../../features/authentication/presentation/controllers/auth_controller.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/authentication/presentation/screens/registration_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/home/presentation/screens/explore_screen.dart';
import '../../features/home/presentation/screens/learn_screen.dart';
import '../../features/home/presentation/screens/downloads_screen.dart';
import '../../features/home/presentation/screens/settings_screen.dart';
import '../../features/home/presentation/screens/profile_screen.dart';
import '../../features/home/presentation/screens/home_shell_screen.dart';
import '../storage/shared_prefs_service.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(Ref ref) {
  // Use a ValueNotifier to bridge Riverpod state to GoRouter's Listenable
  final authNotifier =
      ValueNotifier<AsyncValue<UserEntity?>>(const AsyncValue.loading());

  // Listen to authController and update the notifier
  // This listener persists as long as this provider is alive.
  ref.listen(
    authControllerProvider,
    (_, next) => authNotifier.value = next,
    fireImmediately: true,
  );

  final sharedPrefsService = ref.watch(sharedPrefsServiceProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/onboarding',
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final isOnboardingComplete = sharedPrefsService.isOnboardingComplete;

      // Read current state from the notifier WITHOUT watching the provider in the body
      final authState = authNotifier.value;

      final currentUserEmail =
          authState.asData?.value?.email ?? sharedPrefsService.currentUserEmail;
      final isGoingToOnboarding = state.uri.path == '/onboarding';
      final isGoingToAuth =
          state.uri.path == '/login' || state.uri.path == '/register';

      // If logged in, redirect to Explore if trying to access Auth/Onboarding
      if (currentUserEmail != null && (isGoingToAuth || isGoingToOnboarding)) {
        return '/explore';
      }

      // If not logged in but onboarding complete, redirect to Login if trying to access Onboarding
      if (currentUserEmail == null &&
          isOnboardingComplete &&
          isGoingToOnboarding) {
        return '/login';
      }

      // If not logged in and trying to access a protected route (not auth, not onboarding)
      if (currentUserEmail == null && !isGoingToAuth && !isGoingToOnboarding) {
        return '/login';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegistrationScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return HomeShellScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/explore',
            builder: (context, state) => const ExploreScreen(),
          ),
          GoRoute(
            path: '/learn',
            builder: (context, state) => const LearnScreen(),
          ),
          GoRoute(
            path: '/downloads',
            builder: (context, state) => const DownloadsScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}
