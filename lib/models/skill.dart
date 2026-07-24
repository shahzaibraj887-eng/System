class Skill {
  final String id;
  final String name;
  final String description;
  final String type; // passive, active, ultimate
  final int level;
  final int maxLevel;
  final int costMp;
  final int damage;
  final int cooldown;
  final bool isUnlocked;
  final DateTime acquiredAt;

  Skill({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.level,
    required this.maxLevel,
    required this.costMp,
    required this.damage,
    required this.cooldown,
    required this.isUnlocked,
    required this.acquiredAt,
  });

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      type: map['type'] ?? 'active',
      level: map['level'] ?? 1,
      maxLevel: map['maxLevel'] ?? 10,
      costMp: map['costMp'] ?? 0,
      damage: map['damage'] ?? 0,
      cooldown: map['cooldown'] ?? 0,
      isUnlocked: map['isUnlocked'] ?? false,
      acquiredAt: map['acquiredAt'] != null ? DateTime.parse(map['acquiredAt']) : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'level': level,
      'maxLevel': maxLevel,
      'costMp': costMp,
      'damage': damage,
      'cooldown': cooldown,
      'isUnlocked': isUnlocked,
      'acquiredAt': acquiredAt.toIso8601String(),
    };
  }

  Skill copyWith({
    String? id,
    String? name,
    String? description,
    String? type,
    int? level,
    int? maxLevel,
    int? costMp,
    int? damage,
    int? cooldown,
    bool? isUnlocked,
    DateTime? acquiredAt,
  }) {
    return Skill(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      level: level ?? this.level,
      maxLevel: maxLevel ?? this.maxLevel,
      costMp: costMp ?? this.costMp,
      damage: damage ?? this.damage,
      cooldown: cooldown ?? this.cooldown,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      acquiredAt: acquiredAt ?? this.acquiredAt,
    );
  }
}
