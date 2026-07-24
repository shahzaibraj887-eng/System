import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system/core/theme/colors.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({Key? key}) : super(key: key);

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _playerHP = 100;
  int _enemyHP = 80;
  bool _isBattleActive = true;
  String _battleLog = 'Battle started!';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _attack() {
    if (!_isBattleActive) return;
    _animationController.forward(from: 0.0);
    int damage = (10 + (DateTime.now().millisecond % 20)).toInt();
    setState(() {
      _enemyHP -= damage;
      _battleLog = 'You dealt $damage damage!';
      if (_enemyHP <= 0) {
        _isBattleActive = false;
        _battleLog = 'Victory! You won 50 gold and 100 exp!';
      } else {
        Future.delayed(const Duration(milliseconds: 800), () {
          _enemyAttack();
        });
      }
    });
  }

  void _enemyAttack() {
    int damage = (5 + (DateTime.now().millisecond % 10)).toInt();
    setState(() {
      _playerHP -= damage;
      _battleLog = 'Enemy dealt $damage damage!';
      if (_playerHP <= 0) {
        _isBattleActive = false;
        _battleLog = 'Defeat! You lost the battle.';
      }
    });
  }

  void _defend() {
    if (!_isBattleActive) return;
    setState(() {
      _battleLog = 'You defended! Damage reduced.';
    });
  }

  void _usePotion() {
    if (!_isBattleActive) return;
    setState(() {
      _playerHP = (_playerHP + 30).clamp(0, 100);
      _battleLog = 'You used a potion! HP +30';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: const Text('Battle'),
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
            // Battle Arena
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Player
                      Column(
                        children: [
                          const Text(
                            'You',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '🗡️',
                            style: TextStyle(fontSize: 48),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceLight,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'Level 1',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                LinearProgressIndicator(
                                  value: _playerHP / 100,
                                  backgroundColor: AppColors.surfaceLight,
                                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.success),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'HP: $_playerHP / 100',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'VS',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      // Enemy
                      Column(
                        children: [
                          const Text(
                            'Goblin',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '👹',
                            style: TextStyle(fontSize: 48),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceLight,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'Level 1',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                LinearProgressIndicator(
                                  value: _enemyHP / 80,
                                  backgroundColor: AppColors.surfaceLight,
                                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.error),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'HP: $_enemyHP / 80',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Battle Log
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      _battleLog,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.info,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Actions
            if (_isBattleActive)
              Column(
                children: [
                  const Text(
                    'Choose an action:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: _attack,
                          child: const Text('Attack'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.info,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: _defend,
                          child: const Text('Defend'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.warning,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: _usePotion,
                          child: const Text('Potion'),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            else
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () {
                  setState(() {
                    _playerHP = 100;
                    _enemyHP = 80;
                    _isBattleActive = true;
                    _battleLog = 'Battle started!';
                  });
                },
                child: const Text('Start New Battle'),
              ),
          ],
        ),
      ),
    );
  }
}
