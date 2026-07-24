import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system/core/theme/colors.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> passiveSkills = const [
    {
      'name': 'Iron Skin',
      'description': 'Increases defense by 5',
      'level': 1,
      'maxLevel': 10,
      'icon': '🛡️',
    },
    {
      'name': 'Sharp Blade',
      'description': 'Increases attack by 10',
      'level': 1,
      'maxLevel': 10,
      'icon': '⚔️',
    },
  ];

  final List<Map<String, dynamic>> activeSkills = const [
    {
      'name': 'Power Strike',
      'description': 'Deal 30 damage',
      'cost': 10,
      'level': 1,
      'maxLevel': 5,
      'icon': '💥',
    },
    {
      'name': 'Quick Slash',
      'description': 'Deal 20 damage with 50% crit',
      'cost': 8,
      'level': 1,
      'maxLevel': 5,
      'icon': '⚡',
    },
  ];

  final List<Map<String, dynamic>> ultimateSkills = const [
    {
      'name': 'Berserk',
      'description': 'Deal massive damage',
      'cost': 50,
      'level': 0,
      'maxLevel': 1,
      'icon': '🔥',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.surface,
          elevation: 0,
          title: const Text('Skills'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/dashboard'),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Passive'),
              Tab(text: 'Active'),
              Tab(text: 'Ultimate'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildSkillList(passiveSkills),
            _buildSkillList(activeSkills),
            _buildSkillList(ultimateSkills),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillList(List<Map<String, dynamic>> skills) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        final skill = skills[index];
        return _buildSkillCard(skill);
      },
    );
  }

  Widget _buildSkillCard(Map<String, dynamic> skill) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                skill['icon'] ?? '',
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skill['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      skill['description'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Level',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${skill['level']} / ${skill['maxLevel']}',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (skill['cost'] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'MP Cost',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${skill['cost']}',
                      style: const TextStyle(
                        color: AppColors.info,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
