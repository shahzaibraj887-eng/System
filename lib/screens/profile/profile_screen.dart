import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system/core/theme/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: const Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/dashboard'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Header
            Center(
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.secondary, width: 3),
                    ),
                    child: const Center(
                      child: Text(
                        'W',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Warrior',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'shahzaibraj887',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.rarityLegendary.withOpacity(0.2),
                      border: Border.all(color: AppColors.rarityLegendary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Level 1 - Novice',
                      style: TextStyle(
                        color: AppColors.rarityLegendary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Stats
            _buildStatsSection(),
            const SizedBox(height: 24),
            // Achievements
            _buildAchievementsSection(),
            const SizedBox(height: 24),
            // Action Buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                context.go('/login');
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Statistics',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              _buildStatRow('Total Level', '1'),
              const SizedBox(height: 12),
              _buildStatRow('Total Gold', '100'),
              const SizedBox(height: 12),
              _buildStatRow('Total EXP', '0'),
              const SizedBox(height: 12),
              _buildStatRow('Quests Completed', '0'),
              const SizedBox(height: 12),
              _buildStatRow('Battles Won', '0'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Achievements',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAchievementBadge('🎖️', '1'),
              _buildAchievementBadge('🏆', '0'),
              _buildAchievementBadge('⭐', '0'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementBadge(String icon, String count) {
    return Column(
      children: [
        Text(
          icon,
          style: const TextStyle(fontSize: 32),
        ),
        const SizedBox(height: 4),
        Text(
          count,
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
