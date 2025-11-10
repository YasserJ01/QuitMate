class AppConstants {
  // App Info
  static const String appName = 'QuitMate';
  static const String appVersion = '1.0.0';

  // Default Values
  static const int defaultCigarettesPerPack = 20;
  static const double defaultCostPerPack = 10.0;
  static const int defaultCigarettesPerDay = 10;
  static const int defaultEpisodesPerWeek = 7;

  // Limits
  static const int maxNicknameLength = 20;
  static const int maxCigarettesPerDay = 100;
  static const int maxEpisodesPerWeek = 50;

  // Durations
  static const Duration splashDuration = Duration(seconds: 2);
  static const Duration animationDuration = Duration(milliseconds: 300);

  // Notification IDs
  static const int dailyReminderNotificationId = 1;
  static const int cravingNotificationId = 2;
  static const int milestoneNotificationId = 3;
}

class AppStrings {
  // Onboarding
  static const String welcomeTitle = 'Welcome to QuitMate';
  static const String welcomeSubtitle =
      'Your personal companion for breaking free from habits and building a healthier life.';
  static const String getStarted = 'Get Started';

  // Goal Selection
  static const String selectGoalTitle = 'What\'s your goal?';
  static const String selectGoalSubtitle = 'Choose what you want to work on';

  // Baseline
  static const String baselineTitle = 'Let\'s understand your habits';
  static const String baselineSubtitle = 'This helps us personalize your journey';

  // Quit Date
  static const String quitDateTitle = 'Choose your quit date';
  static const String quitDateSubtitle = 'When do you want to start your journey?';

  // Common
  static const String next = 'Next';
  static const String back = 'Back';
  static const String skip = 'Skip';
  static const String finish = 'Finish';
  static const String cancel = 'Cancel';
  static const String save = 'Save';
}