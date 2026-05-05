import 'dart:math';
import 'models/notification_models.dart';

/// All in-app notification copy.  Pure Dart – no network needed.
class NotificationContent {
  NotificationContent._();

  static final _rng = Random();

  // ─── Daily check-ins ────────────────────────────────────────────────────────

  static const _dailyCheckIns = [
    NotificationTemplate(
      type: NotificationType.dailyCheckIn,
      title: 'Good morning! 🌅',
      body: 'How are you feeling today? A quick check-in keeps you on track.',
    ),
    NotificationTemplate(
      type: NotificationType.dailyCheckIn,
      title: 'Daily check-in',
      body: 'Remember your why. What motivated you to start this journey?',
    ),
    NotificationTemplate(
      type: NotificationType.dailyCheckIn,
      title: "You've got this 💪",
      body: 'Another day, another chance to prove how strong you are.',
    ),
    NotificationTemplate(
      type: NotificationType.dailyCheckIn,
      title: 'Rise & shine ☀️',
      body: 'Start today with intention. You are one day closer to freedom.',
    ),
    NotificationTemplate(
      type: NotificationType.dailyCheckIn,
      title: 'Morning check-in',
      body:
      'Take a breath and set your intention for today. You\'re doing amazing.',
    ),
  ];

  // ─── Encouragement ──────────────────────────────────────────────────────────

  static const _encouragement = [
    NotificationTemplate(
      type: NotificationType.encouragement,
      title: "You're doing great! 🌟",
      body: 'Every moment you resist is a victory. Keep going!',
    ),
    NotificationTemplate(
      type: NotificationType.encouragement,
      title: 'Stay strong',
      body: 'Cravings are temporary. Your progress is permanent.',
    ),
    NotificationTemplate(
      type: NotificationType.encouragement,
      title: 'Proud of you! 💙',
      body: "You're stronger than you think. One day at a time.",
    ),
    NotificationTemplate(
      type: NotificationType.encouragement,
      title: 'Keep going!',
      body:
      "The hardest part is behind you. You're building new habits every day.",
    ),
    NotificationTemplate(
      type: NotificationType.encouragement,
      title: "You're not alone",
      body: 'Thousands are on this journey with you. We believe in you!',
    ),
    NotificationTemplate(
      type: NotificationType.encouragement,
      title: 'One moment at a time',
      body:
      "You don't have to win forever today. Just win the next five minutes.",
    ),
    NotificationTemplate(
      type: NotificationType.encouragement,
      title: 'Look how far you\'ve come',
      body: 'Every step forward counts, no matter how small.',
    ),
  ];

  // ─── Milestones ─────────────────────────────────────────────────────────────

  static const _milestones = [
    NotificationTemplate(
      type: NotificationType.milestone,
      title: '🎉 {days} day streak!',
      body: "Amazing work! You've stayed strong for {days} days. Keep it up!",
      requiresUserData: true,
    ),
    NotificationTemplate(
      type: NotificationType.milestone,
      title: '💰 Money saved: \${money}',
      body: "You've saved \${money} so far! What will you treat yourself to?",
      requiresUserData: true,
    ),
    NotificationTemplate(
      type: NotificationType.milestone,
      title: '🏆 New record!',
      body:
      'This is your longest streak yet — {days} days! You\'re crushing it!',
      requiresUserData: true,
    ),
    NotificationTemplate(
      type: NotificationType.milestone,
      title: '🔥 {days} days smoke-free!',
      body:
      'Your lungs are thanking you. {days} days of cleaner air inside your body.',
      requiresUserData: true,
    ),
  ];

  // ─── Craving tips ───────────────────────────────────────────────────────────

  static const _cravingTips = [
    NotificationTemplate(
      type: NotificationType.cravingTip,
      title: 'Craving tip 💡',
      body:
      'Try the 5-4-3-2-1 grounding technique when a craving hits. Open the app to start.',
    ),
    NotificationTemplate(
      type: NotificationType.cravingTip,
      title: 'Beat cravings',
      body:
      'Drink a full glass of water. Thirst and cravings feel surprisingly similar.',
    ),
    NotificationTemplate(
      type: NotificationType.cravingTip,
      title: 'Quick tip 🎯',
      body: 'Most cravings peak and pass within 3–5 minutes. Ride the wave!',
    ),
    NotificationTemplate(
      type: NotificationType.cravingTip,
      title: 'Change your scene',
      body:
      'Move to a different room or step outside. Environment shifts break craving cycles.',
    ),
    NotificationTemplate(
      type: NotificationType.cravingTip,
      title: 'Connect to resist 📱',
      body:
      'Call or text a friend when a craving hits. Human connection helps enormously.',
    ),
    NotificationTemplate(
      type: NotificationType.cravingTip,
      title: 'Delay & distract',
      body:
      'Tell yourself to wait 10 minutes. Then 10 more. Cravings rarely survive that.',
    ),
    NotificationTemplate(
      type: NotificationType.cravingTip,
      title: 'Box breathing',
      body:
      'Inhale 4 s · hold 4 s · exhale 4 s · hold 4 s. Repeat 4 times. Open the app to guide you.',
    ),
  ];

  // ─── Micro-challenges ───────────────────────────────────────────────────────

  static const microChallenges = [
    MicroChallenge(
      title: '2-minute breathing',
      description:
      'Take 2 minutes right now for box breathing. Open the app to start.',
      durationMinutes: 2,
      actionType: 'breathing',
    ),
    MicroChallenge(
      title: '5-minute walk',
      description: 'Step outside for 5 minutes. Fresh air does wonders!',
      durationMinutes: 5,
      actionType: 'physical',
    ),
    MicroChallenge(
      title: 'Gratitude moment',
      description: 'Name 3 things you are grateful for right now.',
      durationMinutes: 1,
      actionType: 'mindful',
    ),
    MicroChallenge(
      title: 'Body scan',
      description: 'Notice any tension and breathe into it for 3 minutes.',
      durationMinutes: 3,
      actionType: 'grounding',
    ),
    MicroChallenge(
      title: 'Hydration check',
      description: 'Drink a full glass of water right now. Simple and effective.',
      durationMinutes: 1,
      actionType: 'physical',
    ),
    MicroChallenge(
      title: 'Stretch break',
      description:
      'Stand up and stretch your neck, shoulders and back for 2 minutes.',
      durationMinutes: 2,
      actionType: 'physical',
    ),
    MicroChallenge(
      title: '5-4-3-2-1 grounding',
      description:
      'Name 5 things you see, 4 you feel, 3 you hear, 2 you smell, 1 you taste.',
      durationMinutes: 3,
      actionType: 'grounding',
    ),
  ];

  // ─── Health facts ───────────────────────────────────────────────────────────

  static const _healthFacts = [
    NotificationTemplate(
      type: NotificationType.healthFact,
      title: 'Health update 🫁',
      body:
      'After 20 minutes smoke-free, your heart rate drops back to normal.',
    ),
    NotificationTemplate(
      type: NotificationType.healthFact,
      title: 'Your body is healing',
      body:
      'After 12 hours, carbon monoxide levels in your blood return to normal.',
    ),
    NotificationTemplate(
      type: NotificationType.healthFact,
      title: 'Good news! 💚',
      body: 'After 2 weeks, circulation and lung function begin to improve.',
    ),
    NotificationTemplate(
      type: NotificationType.healthFact,
      title: 'Health win',
      body:
      'After 1 month, coughing and shortness of breath decrease significantly.',
    ),
    NotificationTemplate(
      type: NotificationType.healthFact,
      title: 'Major milestone 🎉',
      body: 'After 1 year, your risk of heart disease is cut in half!',
    ),
    NotificationTemplate(
      type: NotificationType.healthFact,
      title: 'Brain chemistry',
      body:
      'After 3 days, nicotine leaves your body completely — the physical addiction is broken.',
    ),
    NotificationTemplate(
      type: NotificationType.healthFact,
      title: 'Taste & smell',
      body:
      'After 48 hours, your nerve endings begin regenerating. Food tastes better!',
    ),
  ];

  // ─── Motivational quotes ────────────────────────────────────────────────────

  static const _motivationalQuotes = [
    NotificationTemplate(
      type: NotificationType.motivationalQuote,
      title: 'Daily inspiration ✨',
      body:
      '"The secret of change is to focus all your energy not on fighting the old, but on building the new."',
    ),
    NotificationTemplate(
      type: NotificationType.motivationalQuote,
      title: 'Words of wisdom',
      body:
      '"It does not matter how slowly you go as long as you do not stop." — Confucius',
    ),
    NotificationTemplate(
      type: NotificationType.motivationalQuote,
      title: 'Motivation 💪',
      body:
      '"You are braver than you believe, stronger than you seem, and smarter than you think."',
    ),
    NotificationTemplate(
      type: NotificationType.motivationalQuote,
      title: 'Remember this',
      body: '"Fall seven times, stand up eight." — Japanese Proverb',
    ),
    NotificationTemplate(
      type: NotificationType.motivationalQuote,
      title: 'Keep going',
      body:
      '"The only impossible journey is the one you never begin." — Tony Robbins',
    ),
    NotificationTemplate(
      type: NotificationType.motivationalQuote,
      title: 'One step at a time',
      body: '"A journey of a thousand miles begins with a single step." — Laozi',
    ),
    NotificationTemplate(
      type: NotificationType.motivationalQuote,
      title: 'Progress over perfection',
      body:
      '"Striving for excellence motivates you; striving for perfection demoralises you." — Harriet Braiker',
    ),
  ];

  // ─── Progress updates ───────────────────────────────────────────────────────

  static const _progressUpdates = [
    NotificationTemplate(
      type: NotificationType.progressUpdate,
      title: 'Weekly progress 📊',
      body: "You resisted {cravings} cravings this week. That's amazing!",
      requiresUserData: true,
    ),
    NotificationTemplate(
      type: NotificationType.progressUpdate,
      title: 'Your stats',
      body:
      "You've been logging for {days} days in a row. Consistency wins!",
      requiresUserData: true,
    ),
    NotificationTemplate(
      type: NotificationType.progressUpdate,
      title: 'Progress check',
      body: "Your craving resistance rate is {rate}%. You're getting stronger!",
      requiresUserData: true,
    ),
  ];

  // ─── Streak reminders ───────────────────────────────────────────────────────

  static const _streakReminders = [
    NotificationTemplate(
      type: NotificationType.streakReminder,
      title: "Don't break your streak! 🔥",
      body: "You're on a {days}-day streak. Keep it going!",
      requiresUserData: true,
    ),
    NotificationTemplate(
      type: NotificationType.streakReminder,
      title: 'Streak alert',
      body: "Check in to maintain your {days}-day streak!",
      requiresUserData: true,
    ),
    NotificationTemplate(
      type: NotificationType.streakReminder,
      title: '{days} days strong 🔥',
      body: "Don't let today break what you've built. You've got this.",
      requiresUserData: true,
    ),
  ];

  // ─── Public API ─────────────────────────────────────────────────────────────

  static NotificationTemplate randomTemplate(NotificationType type) {
    final pool = _poolFor(type);
    return pool[_rng.nextInt(pool.length)];
  }

  static MicroChallenge randomMicroChallenge() =>
      microChallenges[_rng.nextInt(microChallenges.length)];

  static List<NotificationTemplate> _poolFor(NotificationType type) {
    return switch (type) {
      NotificationType.dailyCheckIn => _dailyCheckIns,
      NotificationType.encouragement => _encouragement,
      NotificationType.milestone => _milestones,
      NotificationType.cravingTip => _cravingTips,
      NotificationType.healthFact => _healthFacts,
      NotificationType.motivationalQuote => _motivationalQuotes,
      NotificationType.progressUpdate => _progressUpdates,
      NotificationType.streakReminder => _streakReminders,
      NotificationType.microChallenge => _encouragement, // fallback
    };
  }
}