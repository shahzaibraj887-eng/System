import 'package:go_router/go_router.dart';
import 'package:system/screens/splash/splash_screen.dart';
import 'package:system/screens/auth/login_screen.dart';
import 'package:system/screens/auth/register_screen.dart';
import 'package:system/screens/home/dashboard_screen.dart';
import 'package:system/screens/profile/profile_screen.dart';
import 'package:system/screens/quests/quests_screen.dart';
import 'package:system/screens/inventory/inventory_screen.dart';
import 'package:system/screens/battle/battle_screen.dart';
import 'package:system/screens/skills/skills_screen.dart';
import 'package:system/screens/settings/settings_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const SplashScreen(),
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      name: 'dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/quests',
      name: 'quests',
      builder: (context, state) => const QuestsScreen(),
    ),
    GoRoute(
      path: '/inventory',
      name: 'inventory',
      builder: (context, state) => const InventoryScreen(),
    ),
    GoRoute(
      path: '/battle',
      name: 'battle',
      builder: (context, state) => const BattleScreen(),
    ),
    GoRoute(
      path: '/skills',
      name: 'skills',
      builder: (context, state) => const SkillsScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
