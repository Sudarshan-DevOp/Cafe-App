import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stitch_crave_cafe/theme/app_theme.dart';

class LoginSignUpPage extends StatefulWidget {
  const LoginSignUpPage({super.key});

  @override
  State<LoginSignUpPage> createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  bool _isLogin = true;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            return Row(
              children: [
                Expanded(flex: 1, child: _buildImageSection()),
                Expanded(flex: 1, child: _buildFormSection()),
              ],
            );
          }
          return _buildFormSection();
        },
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      color: AppColors.surfaceContainerLow,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_side.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: AppColors.surfaceContainerLow);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  AppColors.surface.withValues(alpha: 0.9),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          const Positioned(
            top: 48,
            left: 48,
            child: Text(
              'The Hearth',
              style: TextStyle(
                fontFamily: 'Noto Serif',
                fontSize: 36,
                fontStyle: FontStyle.italic,
                color: AppColors.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Text(
            'Welcome \nBack.',
            style: TextStyle(
              fontFamily: 'Noto Serif',
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _isLogin
                ? 'Sign in to reserve your table.'
                : 'Create an account to get started.',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.onSecondaryContainer,
            ),
          ),
          const SizedBox(height: 32),
          _buildInputField('Email Address', 'your@email.com'),
          const SizedBox(height: 16),
          _buildPasswordField(),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    activeColor: AppColors.primary,
                  ),
                  const Text('Remember me', style: TextStyle(fontSize: 14)),
                ],
              ),
              if (_isLogin)
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                  ),
                  child: const Text('Forgot password?'),
                ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.go('/'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.tertiary,
                foregroundColor: AppColors.onTertiary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(_isLogin ? 'Sign In' : 'Sign Up'),
            ),
          ),
          const SizedBox(height: 32),
          const Center(
            child: Text(
              'Or continue with',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.onSecondaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: _socialButton(Icons.account_circle, 'Google')),
              const SizedBox(width: 16),
              Expanded(child: _socialButton(Icons.apple, 'Apple')),
            ],
          ),
          const SizedBox(height: 32),
          Center(
            child: GestureDetector(
              onTap: () => setState(() => _isLogin = !_isLogin),
              child: Text(
                _isLogin ? 'New to The Hearth? ' : 'Already have an account? ',
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () => setState(() => _isLogin = !_isLogin),
              child: Text(
                _isLogin ? 'Sign up for an account' : 'Sign in',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hint) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '••••••••',
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () =>
              setState(() => _obscurePassword = !_obscurePassword),
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon, String label) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        backgroundColor: AppColors.surfaceContainerHighest,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide.none,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
