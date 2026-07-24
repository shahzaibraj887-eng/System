abstract class AppConstants {
  // App Info
  static const String appName = 'SYSTEM';
  static const String appVersion = '1.0.0';

  // Firebase Collections
  static const String playersCollection = 'players';
  static const String questsCollection = 'quests';
  static const String inventoryCollection = 'inventory';
  static const String achievementsCollection = 'achievements';
  static const String skillsCollection = 'skills';
  static const String battlesCollection = 'battles';

  // Player Stats
  static const int maxLevel = 100;
  static const int maxHP = 1000;
  static const int maxMP = 500;
  static const int startingGold = 100;
  static const int startingEXP = 0;

  // Experience
  static const int expPerQuest = 100;
  static const int expPerBattle = 50;
  static const int expPerDungeon = 200;
  static const int expForNextLevel = 1000;

  // Quest Types
  static const String dailyQuest = 'daily';
  static const String weeklyQuest = 'weekly';
  static const String mainQuest = 'main';
  static const String randomQuest = 'random';

  // API Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration authTimeout = Duration(seconds: 60);

  // Storage Keys
  static const String userIdKey = 'user_id';
  static const String authTokenKey = 'auth_token';
  static const String playerDataKey = 'player_data';
}
