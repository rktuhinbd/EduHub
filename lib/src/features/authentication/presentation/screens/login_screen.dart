import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../src/l10n/generated/app_localizations.dart';
import '../../../../core/presentation/widgets/glass_container.dart';
import '../../../../core/presentation/widgets/language_switcher.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine l10n. context might not be fully initialized during build for l, 
    // but typically safe in build().
    final l10n = AppLocalizations.of(context);
    
    // Fallback if l10n is null (e.g. during manual fast-reload or race condition)
    // though with MaterialApp wired properly this shouldn't happen.
    if (l10n == null) return const SizedBox.shrink();

    ref.listen(authControllerProvider, (previous, next) {
      next.maybeWhen(
        data: (user) {
          context.go('/home');
        },
        error: (e, st) {
          // Requirement: "failue or success redirect to home screen"
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('Login failed ($e). Redirecting to home...')),
          );
          Future.delayed(const Duration(seconds: 1), () {
            if (mounted) context.go('/home');
          });
        },
        orElse: () {},
      );
    });

    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF2E3192), Color(0xFF1BFFFF)],
              ),
            ),
          ),
          
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                   const Align(
                    alignment: Alignment.topRight,
                    child: LanguageSwitcher(),
                  ),
                  const SizedBox(height: 48),
                  
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: GlassContainer(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.school, size: 64, color: Colors.white),
                          const SizedBox(height: 24),
                          Text(
                            l10n.loginTitle,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            l10n.loginSubtitle,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.white70,
                                ),
                          ),
                          const SizedBox(height: 32),
                          
                          TextField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: l10n.emailLabel,
                              labelStyle: const TextStyle(color: Colors.white70),
                              filled: true,
                              fillColor: Colors.white.withValues(alpha: 0.1),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              prefixIcon: const Icon(Icons.email, color: Colors.white70),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _passwordController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: l10n.passwordLabel,
                              labelStyle: const TextStyle(color: Colors.white70),
                              filled: true,
                              fillColor: Colors.white.withValues(alpha: 0.1),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 24),
                          
                          authState.maybeWhen(
                            loading: () => const CircularProgressIndicator(color: Colors.white),
                            orElse: () => SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                  ref.read(authControllerProvider.notifier).login(
                                        _emailController.text,
                                        _passwordController.text,
                                      );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2E3192),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(l10n.loginButton),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),
                  
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(l10n.dontHaveAccount, style: const TextStyle(color: Colors.white)),
                              TextButton(
                                onPressed: () => context.go('/register'),
                                child: Text(
                                  l10n.signUp,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
