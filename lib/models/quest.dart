class Quest {
  final String id;
  final String title;
  final String description;
  final String type; // daily, weekly, main, random
  final int requiredLevel;
  final int reward;
  final int expReward;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime? completedAt;

  Quest({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.requiredLevel,
    required this.reward,
    required this.expReward,
    required this.isCompleted,
    required this.createdAt,
    this.completedAt,
  });

  factory Quest.fromMap(Map<String, dynamic> map) {
    return Quest(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      type: map['type'] ?? 'daily',
      requiredLevel: map['requiredLevel'] ?? 1,
      reward: map['reward'] ?? 0,
      expReward: map['expReward'] ?? 0,
      isCompleted: map['isCompleted'] ?? false,
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : DateTime.now(),
      completedAt: map['completedAt'] != null ? DateTime.parse(map['completedAt']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'requiredLevel': requiredLevel,
      'reward': reward,
      'expReward': expReward,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }

  Quest copyWith({
    String? id,
    String? title,
    String? description,
    String? type,
    int? requiredLevel,
    int? reward,
    int? expReward,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return Quest(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      requiredLevel: requiredLevel ?? this.requiredLevel,
      reward: reward ?? this.reward,
      expReward: expReward ?? this.expReward,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}
