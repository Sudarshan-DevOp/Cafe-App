import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stitch_crave_cafe/theme/app_theme.dart';
import 'package:stitch_crave_cafe/screens/landing_page.dart';
import 'package:stitch_crave_cafe/screens/login_sign_up.dart';
import 'package:stitch_crave_cafe/screens/menu_showcase.dart';
import 'package:stitch_crave_cafe/screens/book_a_table.dart';
import 'package:stitch_crave_cafe/screens/my_profile.dart';
import 'package:stitch_crave_cafe/screens/admin_dashboard.dart';

void main() {
  runApp(const TheHearthApp());
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: LandingPage(),
          ),
        ),
        GoRoute(
          path: '/menu',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MenuShowcasePage(),
          ),
        ),
        GoRoute(
          path: '/book',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: BookATablePage(),
          ),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MyProfilePage(),
          ),
        ),
        GoRoute(
          path: '/admin',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AdminDashboardPage(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginSignUpPage(),
    ),
  ],
);

class TheHearthApp extends StatelessWidget {
  const TheHearthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'The Hearth',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerConfig: goRouter,
    );
  }
}

class MainShell extends StatefulWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: Icons.home,
                label: 'Home',
                isActive: _currentIndex == 0,
                onTap: () => _onItemTapped(0, '/'),
              ),
              _NavItem(
                icon: Icons.restaurant_menu,
                label: 'Menu',
                isActive: _currentIndex == 1,
                onTap: () => _onItemTapped(1, '/menu'),
              ),
              _NavItem(
                icon: Icons.event_seat,
                label: 'Book',
                isActive: _currentIndex == 2,
                onTap: () => _onItemTapped(2, '/book'),
              ),
              _NavItem(
                icon: Icons.person,
                label: 'Profile',
                isActive: _currentIndex == 3,
                onTap: () => _onItemTapped(3, '/profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index, String path) {
    setState(() {
      _currentIndex = index;
    });
    context.go(path);
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isActive ? AppColors.secondaryContainer : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: isActive ? AppColors.tertiary : AppColors.primary.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: isActive ? AppColors.tertiary : AppColors.primary.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}