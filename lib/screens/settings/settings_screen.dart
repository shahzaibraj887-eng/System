import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system/core/theme/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: const Text('Settings'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/dashboard'),
        ),
      ),
      body: ListView(
        children: [
          // Notifications Section
          _buildSectionHeader('Notifications'),
          _buildToggleSetting(
            'Push Notifications',
            'Receive game notifications',
            _notificationsEnabled,
            (value) => setState(() => _notificationsEnabled = value),
          ),
          _buildToggleSetting(
            'Sound Effects',
            'Enable in-game sounds',
            _soundEnabled,
            (value) => setState(() => _soundEnabled = value),
          ),
          _buildToggleSetting(
            'Vibration',
            'Enable device vibration',
            _vibrationEnabled,
            (value) => setState(() => _vibrationEnabled = value),
          ),
          const Divider(color: AppColors.surfaceLight, height: 32),
          // Game Settings
          _buildSectionHeader('Game'),
          _buildSettingItem(
            'Graphics Quality',
            'High',
            Icons.videogame_asset,
          ),
          _buildSettingItem(
            'Difficulty',
            'Normal',
            Icons.gaming,
          ),
          const Divider(color: AppColors.surfaceLight, height: 32),
          // Account Section
          _buildSectionHeader('Account'),
          _buildSettingItem(
            'Change Password',
            null,
            Icons.security,
            onTap: () {},
          ),
          _buildSettingItem(
            'Privacy Policy',
            null,
            Icons.privacy_tip,
            onTap: () {},
          ),
          _buildSettingItem(
            'Terms of Service',
            null,
            Icons.description,
            onTap: () {},
          ),
          const Divider(color: AppColors.surfaceLight, height: 32),
          // App Info
          _buildSectionHeader('About'),
          _buildSettingItem(
            'Version',
            '1.0.0',
            Icons.info,
          ),
          _buildSettingItem(
            'Developer',
            'Shahzaib Rajput',
            Icons.code,
          ),
          const SizedBox(height: 24),
          // Logout Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
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
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildToggleSetting(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: SwitchListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primary,
        tileColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildSettingItem(
    String title,
    String? subtitle,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
              )
            : null,
        trailing: subtitle == null
            ? const Icon(Icons.arrow_forward_ios, color: AppColors.textSecondary, size: 16)
            : null,
        tileColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onTap: onTap,
      ),
    );
  }
}
