class Player {
  final String id;
  final String username;
  final String email;
  final int level;
  final int exp;
  final int hp;
  final int maxHp;
  final int mp;
  final int maxMp;
  final int gold;
  final int attack;
  final int defense;
  final int speed;
  final int stamina;
  final List<String> achievements;
  final List<String> skills;
  final DateTime createdAt;
  final DateTime updatedAt;

  Player({
    required this.id,
    required this.username,
    required this.email,
    required this.level,
    required this.exp,
    required this.hp,
    required this.maxHp,
    required this.mp,
    required this.maxMp,
    required this.gold,
    required this.attack,
    required this.defense,
    required this.speed,
    required this.stamina,
    required this.achievements,
    required this.skills,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      level: map['level'] ?? 1,
      exp: map['exp'] ?? 0,
      hp: map['hp'] ?? 100,
      maxHp: map['maxHp'] ?? 100,
      mp: map['mp'] ?? 50,
      maxMp: map['maxMp'] ?? 50,
      gold: map['gold'] ?? 0,
      attack: map['attack'] ?? 10,
      defense: map['defense'] ?? 5,
      speed: map['speed'] ?? 8,
      stamina: map['stamina'] ?? 20,
      achievements: List<String>.from(map['achievements'] ?? []),
      skills: List<String>.from(map['skills'] ?? []),
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : DateTime.now(),
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'level': level,
      'exp': exp,
      'hp': hp,
      'maxHp': maxHp,
      'mp': mp,
      'maxMp': maxMp,
      'gold': gold,
      'attack': attack,
      'defense': defense,
      'speed': speed,
      'stamina': stamina,
      'achievements': achievements,
      'skills': skills,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Player copyWith({
    String? id,
    String? username,
    String? email,
    int? level,
    int? exp,
    int? hp,
    int? maxHp,
    int? mp,
    int? maxMp,
    int? gold,
    int? attack,
    int? defense,
    int? speed,
    int? stamina,
    List<String>? achievements,
    List<String>? skills,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Player(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      level: level ?? this.level,
      exp: exp ?? this.exp,
      hp: hp ?? this.hp,
      maxHp: maxHp ?? this.maxHp,
      mp: mp ?? this.mp,
      maxMp: maxMp ?? this.maxMp,
      gold: gold ?? this.gold,
      attack: attack ?? this.attack,
      defense: defense ?? this.defense,
      speed: speed ?? this.speed,
      stamina: stamina ?? this.stamina,
      achievements: achievements ?? this.achievements,
      skills: skills ?? this.skills,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
