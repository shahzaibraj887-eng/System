import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system/core/theme/colors.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  String _selectedCategory = 'all';

  final List<Map<String, dynamic>> _items = [
    {
      'name': 'Iron Sword',
      'type': 'weapon',
      'rarity': 'uncommon',
      'quantity': 1,
      'icon': '⚔️',
    },
    {
      'name': 'Leather Armor',
      'type': 'armor',
      'rarity': 'common',
      'quantity': 1,
      'icon': '🛡️',
    },
    {
      'name': 'Health Potion',
      'type': 'potion',
      'rarity': 'common',
      'quantity': 5,
      'icon': '🧪',
    },
    {
      'name': 'Fireball Tome',
      'type': 'skill_book',
      'rarity': 'rare',
      'quantity': 1,
      'icon': '📖',
    },
    {
      'name': 'Mystery Chest',
      'type': 'chest',
      'rarity': 'legendary',
      'quantity': 1,
      'icon': '📦',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: const Text('Inventory'),
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
            // Category Filter
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ['all', 'weapon', 'armor', 'potion', 'skill_book', 'chest']
                    .map(
                      (category) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Text(category.replaceAll('_', ' ').toUpperCase()),
                          selected: _selectedCategory == category,
                          onSelected: (selected) {
                            setState(() => _selectedCategory = category);
                          },
                          backgroundColor: AppColors.surface,
                          selectedColor: AppColors.primary,
                          labelStyle: TextStyle(
                            color: _selectedCategory == category ? Colors.white : AppColors.textSecondary,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            // Items Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return _buildItemCard(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(Map<String, dynamic> item) {
    final rarityColor = _getRarityColor(item['rarity']);
    return GestureDetector(
      onTap: () {
        _showItemDetail(item);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: rarityColor, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item['icon'],
              style: const TextStyle(fontSize: 36),
            ),
            const SizedBox(height: 8),
            Text(
              item['name'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: rarityColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'x${item['quantity']}',
                style: TextStyle(
                  fontSize: 10,
                  color: rarityColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getRarityColor(String rarity) {
    switch (rarity) {
      case 'common':
        return AppColors.rarityCommon;
      case 'uncommon':
        return AppColors.rarityUncommon;
      case 'rare':
        return AppColors.rarityRare;
      case 'epic':
        return AppColors.rarityEpic;
      case 'legendary':
        return AppColors.rarityLegendary;
      default:
        return AppColors.textSecondary;
    }
  }

  void _showItemDetail(Map<String, dynamic> item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                item['icon'],
                style: const TextStyle(fontSize: 48),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item['name'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Rarity: ${item['rarity'].replaceAll('_', ' ').toUpperCase()}',
              style: TextStyle(
                color: _getRarityColor(item['rarity']),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
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
