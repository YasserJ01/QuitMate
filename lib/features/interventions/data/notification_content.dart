import 'models/notification_models.dart';

class NotificationContent {
  // ============= DAILY CHECK-INS =============

  static const List<NotificationTemplate> dailyCheckIns = [
    NotificationTemplate(
      type: NotificationType.dailyCheckIn,
      title: 'Good Morning! 🌅',
      body: 'How are you feeling today? Take a moment to check in with yourself.',
    ),
    NotificationTemplate(
      type: NotificationType.dailyCheckIn,
      title: 'Daily Check-in',
      body: 'Remember your why. What motivated you to start this journey?',
    ),
    NotificationTemplate(
      type: NotificationType.dailyCheckIn,
      title: 'You\'ve Got This! 💪',
      body: 'Another day, another opportunity to stay strong.',
    ),
  ];

  // ============= ENCOURAGEMENT =============

  static const List<NotificationTemplate> encouragement = [
    NotificationTemplate(
      type: NotificationType.encouragement,
      title: 'You\'re Doing Great! 🌟',
      body: 'Every moment you resist is a victory. Keep going!',
    ),
    NotificationTemplate(
      type: NotificationType.encouragement,
      title: 'Stay Strong',
      body: 'Cravings are temporary, but your progress is permanent.',
    ),
    NotificationTemplate(
      type: NotificationType.encouragement,
      title: 'Proud of You! 💙',
      body: 'You\'re stronger than you think. One day at a time.',
    ),
    NotificationTemplate(
      type: NotificationType.encouragement,
      title: 'Keep Going!',
      body: 'The hardest part is behind you. You\'re building new habits every day.',
    ),
    NotificationTemplate(
      type: NotificationType.encouragement,
      title: 'You\'re Not Alone',
      body: 'Thousands of people are on this journey with you. We believe in you!',
    ),
  ];

  // ============= MILESTONES =============

  static const List<NotificationTemplate> milestones = [
    NotificationTemplate(
      type: NotificationType.milestone,
      title: '🎉 {days} Day Streak!',
      body: 'Amazing work! You\'ve stayed strong for {days} days. Keep it up!',
      requiresUserData: true,
    ),
    NotificationTemplate(
      type: NotificationType.milestone,
      title: '💰 Money Saved: \${money}',
      body: 'You\'ve saved \${money} so far! What will you do with it?',
      requiresUserData: true,
    ),
    NotificationTemplate(
      type: NotificationType.milestone,
      title: '🏆 New Record!',
      body: 'This is your longest streak yet: {days} days! You\'re crushing it!',
      requiresUserData: true,
    ),
  ];

  // ============= CRAVING TIPS =============

  static const List<NotificationTemplate> cravingTips = [
    NotificationTemplate(
      type: NotificationType.cravingTip,
      title: 'Craving Tip 💡',
      body: 'Try the 5-4-3-2-1 grounding technique when a craving hits.',
    ),
    NotificationTemplate(
      type: NotificationType.cravingTip,
      title: 'Beat Cravings',
      body: 'Drink a glass of water. Sometimes thirst feels like cravings.',
    ),
    NotificationTemplate(
      type: NotificationType.cravingTip,
      title: 'Quick Tip 🎯',
      body: 'Most cravings pass in 3-5 minutes. Ride the wave!',
    ),
    NotificationTemplate(
      type: NotificationType.cravingTip,
      title: 'Craving Management',
      body: 'Change your environment. Go for a quick walk or move to another room.',
    ),
    NotificationTemplate(
      type: NotificationType.cravingTip,
      title: 'Stay Strong 💪',
      body: 'Call or text a friend when cravings hit. Connection helps!',
    ),
  ];

  // ============= MICRO CHALLENGES =============

  static const List<MicroChallenge> microChallenges = [
    MicroChallenge(
      title: '2-Minute Breathing',
      description: 'Take 2 minutes right now for box breathing. Open the app to start.',
      durationMinutes: 2,
      actionType: 'breathing',
    ),
    MicroChallenge(
      title: '5-Minute Walk',
      description: 'Step outside for 5 minutes. Fresh air does wonders!',
      durationMinutes: 5,
      actionType: 'physical',
    ),
    MicroChallenge(
      title: 'Gratitude Moment',
      description: 'Name 3 things you\'re grateful for today.',
      durationMinutes: 1,
      actionType: 'mindful',
    ),
    MicroChallenge(
      title: 'Body Scan',
      description: 'Quick body scan: notice tension and breathe into it.',
      durationMinutes: 3,
      actionType: 'grounding',
    ),
    MicroChallenge(
      title: 'Hydration Check',
      description: 'Drink a full glass of water right now.',
      durationMinutes: 1,
      actionType: 'physical',
    ),
  ];

  // ============= HEALTH FACTS =============

  static const List<NotificationTemplate> healthFacts = [
    NotificationTemplate(
      type: NotificationType.healthFact,
      title: 'Health Update 🫁',
      body: 'After 20 minutes smoke-free, your heart rate drops to normal levels.',
    ),
    NotificationTemplate(
      type: NotificationType.healthFact,
      title: 'Your Body is Healing',
      body: 'After 12 hours, carbon monoxide levels in your blood return to normal.',
    ),
    NotificationTemplate(
      type: NotificationType.healthFact,
      title: 'Good News! 💚',
      body: 'After 2 weeks, your circulation and lung function begin to improve.',
    ),
    NotificationTemplate(
      type: NotificationType.healthFact,
      title: 'Health Win',
      body: 'After 1 month, coughing and shortness of breath decrease significantly.',
    ),
    NotificationTemplate(
      type: NotificationType.healthFact,
      title: 'Major Milestone 🎉',
      body: 'After 1 year, your risk of heart disease is cut in half!',
    ),
  ];

  // ============= MOTIVATIONAL QUOTES =============

  static const List<NotificationTemplate> motivationalQuotes = [
    NotificationTemplate(
      type: NotificationType.motivationalQuote,
      title: 'Daily Inspiration ✨',
      body: '"The secret of change is to focus all your energy not on fighting the old, but on building the new."',
    ),
    NotificationTemplate(
      type: NotificationType.motivationalQuote,
      title: 'Words of Wisdom',
      body: '"It does not matter how slowly you go as long as you do not stop." - Confucius',
    ),
    NotificationTemplate(
      type: NotificationType.motivationalQuote,
      title: 'Motivation 💪',
      body: '"You are braver than you believe, stronger than you seem, and smarter than you think."',
    ),
    NotificationTemplate(
      type: NotificationType.motivationalQuote,
      title: 'Remember This',
      body: '"Fall seven times, stand up eight." - Japanese Proverb',
    ),
    NotificationTemplate(
      type: NotificationType.motivationalQuote,
      title: 'Keep Going',
      body: '"The only impossible journey is the one you never begin." - Tony Robbins',
    ),
  ];

  // ============= PROGRESS UPDATES =============

  static const List<NotificationTemplate> progressUpdates = [
    NotificationTemplate(
      type: NotificationType.progressUpdate,
      title: 'Weekly Progress 📊',
      body: 'You resisted {cravings} cravings this week. That\'s amazing!',
      requiresUserData: true,
    ),
    NotificationTemplate(
      type: NotificationType.progressUpdate,
      title: 'Your Stats',
      body: 'You\'ve logged into the app {days} days in a row. Consistency wins!',
      requiresUserData: true,
    ),
    NotificationTemplate(
      type: NotificationType.progressUpdate,
      title: 'Progress Check',
      body: 'Your craving resistance rate is {rate}%. You\'re getting stronger!',
      requiresUserData: true,
    ),
  ];

  // ============= STREAK REMINDERS =============

  static const List<NotificationTemplate> streakReminders = [
    NotificationTemplate(
      type: NotificationType.streakReminder,
      title: 'Don\'t Break Your Streak! 🔥',
      body: 'You\'re on a {days} day streak. Keep it going!',
      requiresUserData: true,
    ),
    NotificationTemplate(
      type: NotificationType.streakReminder,
      title: 'Streak Alert',
      body: 'Check in to maintain your {days} day streak!',
      requiresUserData: true,
    ),
  ];

  // ============= HELPER METHODS =============

  static NotificationTemplate getRandomTemplate(NotificationType type) {
    List<NotificationTemplate> templates;

    switch (type) {
      case NotificationType.dailyCheckIn:
        templates = dailyCheckIns;
        break;
      case NotificationType.encouragement:
        templates = encouragement;
        break;
      case NotificationType.milestone:
        templates = milestones;
        break;
      case NotificationType.cravingTip:
        templates = cravingTips;
        break;
      case NotificationType.healthFact:
        templates = healthFacts;
        break;
      case NotificationType.motivationalQuote:
        templates = motivationalQuotes;
        break;
      case NotificationType.progressUpdate:
        templates = progressUpdates;
        break;
      case NotificationType.streakReminder:
        templates = streakReminders;
        break;
      default:
        templates = encouragement;
    }

    templates.shuffle();
    return templates.first;
  }

  static MicroChallenge getRandomMicroChallenge() {
    final challenges = List<MicroChallenge>.from(microChallenges)..shuffle();
    return challenges.first;
  }
}