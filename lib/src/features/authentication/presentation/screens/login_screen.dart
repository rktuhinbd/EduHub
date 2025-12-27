import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../src/l10n/generated/app_localizations.dart';
import '../../../../core/presentation/widgets/glass_container.dart';
import '../../../../core/presentation/widgets/language_switcher.dart';
import '../controllers/auth_controller.dart';

/// Screen regarding the Login Flow.
/// Displays a glassmorphic form centered on a gradient background.
/// Handles user input validation and delegates login logic to [AuthController].
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
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

    // Listen to AuthController state changes for side effects (navigation, error snackbars)
    ref.listen(authControllerProvider, (previous, next) {
      next.maybeWhen(
        data: (user) {
          // Successful login is handled by AppRouter redirect, but we can also force it here
          // context.go('/explore'); // Router handles this now
        },
        error: (e, st) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Login failed: ${e.toString().replaceAll('Exception:', '').trim()}'),
              backgroundColor: Colors.redAccent,
            ),
          );
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
            child: Stack(
              children: [
                // Top Right Language Switcher
                const Positioned(
                  top: 16,
                  right: 16,
                  child: LanguageSwitcher(),
                ),

                // Centered Form
                Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: GlassContainer(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.school,
                                size: 48, color: Colors.white),
                            const SizedBox(height: 16),
                            Text(
                              l10n.loginTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              l10n.loginSubtitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.white70,
                                  ),
                            ),
                            const SizedBox(height: 24),
                            Form(
                              key: _formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  _buildTextField(
                                    _emailController,
                                    l10n.emailLabel,
                                    Icons.email,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  _buildTextField(
                                    _passwordController,
                                    l10n.passwordLabel,
                                    Icons.lock,
                                    isPassword: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            authState.maybeWhen(
                              loading: () => const CircularProgressIndicator(
                                  color: Colors.white),
                              orElse: () => SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      ref
                                          .read(authControllerProvider.notifier)
                                          .login(
                                            _emailController.text,
                                            _passwordController.text,
                                          );
                                    }
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
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(l10n.dontHaveAccount,
                                    style:
                                        const TextStyle(color: Colors.white)),
                                TextButton(
                                  onPressed: () => context.go('/register'),
                                  child: Text(
                                    l10n.signUp,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        errorMaxLines: 2,
      ),
      validator: validator,
    );
  }
}
