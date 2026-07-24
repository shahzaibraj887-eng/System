class InventoryItem {
  final String id;
  final String name;
  final String description;
  final String type; // weapon, armor, potion, skill_book, chest
  final String rarity; // common, uncommon, rare, epic, legendary
  final int quantity;
  final int value;
  final Map<String, int> stats;
  final DateTime acquiredAt;

  InventoryItem({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.rarity,
    required this.quantity,
    required this.value,
    required this.stats,
    required this.acquiredAt,
  });

  factory InventoryItem.fromMap(Map<String, dynamic> map) {
    return InventoryItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      type: map['type'] ?? 'weapon',
      rarity: map['rarity'] ?? 'common',
      quantity: map['quantity'] ?? 1,
      value: map['value'] ?? 0,
      stats: Map<String, int>.from(map['stats'] ?? {}),
      acquiredAt: map['acquiredAt'] != null ? DateTime.parse(map['acquiredAt']) : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'rarity': rarity,
      'quantity': quantity,
      'value': value,
      'stats': stats,
      'acquiredAt': acquiredAt.toIso8601String(),
    };
  }

  InventoryItem copyWith({
    String? id,
    String? name,
    String? description,
    String? type,
    String? rarity,
    int? quantity,
    int? value,
    Map<String, int>? stats,
    DateTime? acquiredAt,
  }) {
    return InventoryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      rarity: rarity ?? this.rarity,
      quantity: quantity ?? this.quantity,
      value: value ?? this.value,
      stats: stats ?? this.stats,
      acquiredAt: acquiredAt ?? this.acquiredAt,
    );
  }
}
