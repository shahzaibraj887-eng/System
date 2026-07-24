import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system/core/theme/colors.dart';

class QuestsScreen extends StatefulWidget {
  const QuestsScreen({Key? key}) : super(key: key);

  @override
  State<QuestsScreen> createState() => _QuestsScreenState();
}

class _QuestsScreenState extends State<QuestsScreen> {
  String _selectedFilter = 'all';

  final List<Map<String, dynamic>> _quests = [
    {
      'title': 'Defeat Goblin Squad',
      'description': 'Defeat 5 goblins in the forest',
      'type': 'daily',
      'reward': 50,
      'exp': 100,
      'completed': false,
    },
    {
      'title': 'Collect Herbs',
      'description': 'Find 10 rare herbs',
      'type': 'weekly',
      'reward': 200,
      'exp': 300,
      'completed': false,
    },
    {
      'title': 'Prove Your Worth',
      'description': 'Main quest - Begin your adventure',
      'type': 'main',
      'reward': 500,
      'exp': 1000,
      'completed': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: const Text('Quests'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/dashboard'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Filter Buttons
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ['all', 'daily', 'weekly', 'main']
                    .map(
                      (filter) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Text(filter.toUpperCase()),
                          selected: _selectedFilter == filter,
                          onSelected: (selected) {
                            setState(() => _selectedFilter = filter);
                          },
                          backgroundColor: AppColors.surface,
                          selectedColor: AppColors.primary,
                          labelStyle: TextStyle(
                            color: _selectedFilter == filter ? Colors.white : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            // Quest List
            Expanded(
              child: ListView.builder(
                itemCount: _quests.length,
                itemBuilder: (context, index) {
                  final quest = _quests[index];
                  return _buildQuestCard(quest, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestCard(Map<String, dynamic> quest, int index) {
    final color = _getQuestColor(quest['type']);
    return GestureDetector(
      onTap: () {
        _showQuestDetail(quest);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.2),
                              border: Border.all(color: color),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              quest['type'].toUpperCase(),
                              style: TextStyle(
                                color: color,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (quest['completed'])
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.success,
                              size: 16,
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        quest['title'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        quest['description'],
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
                Row(
                  children: [
                    const Icon(Icons.coins, size: 16, color: AppColors.accent),
                    const SizedBox(width: 4),
                    Text(
                      '${quest['reward']}',
                      style: const TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.flash_on, size: 16, color: AppColors.success),
                    const SizedBox(width: 4),
                    Text(
                      '${quest['exp']}',
                      style: const TextStyle(
                        color: AppColors.success,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: quest['completed']
                      ? null
                      : () {
                          setState(() {
                            _quests[_quests.indexOf(quest)]['completed'] = true;
                          });
                        },
                  child: Text(
                    quest['completed'] ? 'Done' : 'Accept',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getQuestColor(String type) {
    switch (type) {
      case 'daily':
        return AppColors.info;
      case 'weekly':
        return AppColors.warning;
      case 'main':
        return AppColors.rarityLegendary;
      default:
        return AppColors.secondary;
    }
  }

  void _showQuestDetail(Map<String, dynamic> quest) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quest Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              quest['title'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              quest['description'],
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                fullWidthButton: true,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
