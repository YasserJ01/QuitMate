/// Generates a 3–5 sentence motivational summary from statistics and profile
/// data. Pure Dart — no Flutter dependencies, no LLM.
///
/// Templates are selected based on mode, streak length, available data,
/// and confidence level. The closing sentence rotates deterministically
/// based on the date so it doesn't feel random.
class MotivationalSummaryEngine {
  String generate({
    required int currentStreak,
    required int recoveryCount,
    required double moneySaved,
    required int cigarettesAvoided,
    required int urgesResisted,
    required int timeReclaimedMinutes,
    required int confidence, // 1–10
    required String mode, // 'quitSmoking' or 'reduceMasturbation'
    required DateTime forDate,
  }) {
    final isSmoking = mode == 'quitSmoking';

    final opening = _openingSentence(isSmoking, currentStreak);
    final body = _bodySentence(isSmoking, currentStreak, moneySaved,
        cigarettesAvoided, urgesResisted, timeReclaimedMinutes);
    final recovery = recoveryCount > 0 ? _recoverySentence(recoveryCount) : null;
    final closing = _closingSentence(forDate, confidence);

    return [opening, body, recovery, closing]
        .whereType<String>()
        .join(' ');
  }

  // ── Opening ──────────────────────────────────────────────────────────

  String _openingSentence(bool isSmoking, int days) {
    if (days == 0) {
      return isSmoking
          ? 'Today is the beginning of something important.'
          : 'Every day is a chance to realign with your values.';
    }
    if (days == 1) {
      return isSmoking
          ? 'You completed your first smoke-free day.'
          : 'You kept to your values for one day.';
    }
    if (days < 7) {
      return isSmoking
          ? 'You\'ve made it $days days smoke-free.'
          : 'You\'ve kept to your values for $days days.';
    }
    if (days < 30) {
      final weeks = days ~/ 7;
      return isSmoking
          ? 'You are $days days smoke-free — that\'s $weeks ${weeks == 1 ? 'week' : 'weeks'}.'
          : 'You have maintained your commitment for $days days.';
    }
    final months = days ~/ 30;
    return isSmoking
        ? 'You are $days days smoke-free — that\'s $months ${months == 1 ? 'month' : 'months'} of choosing yourself.'
        : 'You\'ve sustained self-directed focus for $days days.';
  }

  // ── Body ─────────────────────────────────────────────────────────────

  String _bodySentence(
    bool isSmoking,
    int days,
    double moneySaved,
    int cigsAvoided,
    int urgesResisted,
    int timeReclaimed,
  ) {
    if (isSmoking) {
      if (moneySaved > 0 && cigsAvoided > 0) {
        return 'You\'ve redirected about £${moneySaved.toStringAsFixed(0)} away from cigarettes and avoided roughly $cigsAvoided cigarettes.';
      }
      if (moneySaved > 0) {
        return 'You\'ve redirected about £${moneySaved.toStringAsFixed(0)} away from cigarettes.';
      }
      if (cigsAvoided > 0) {
        return 'That\'s roughly $cigsAvoided cigarettes you chose not to smoke.';
      }
      return 'Every day you don\'t smoke is a day your body continues to heal.';
    } else {
      if (timeReclaimed > 60) {
        final hours = timeReclaimed ~/ 60;
        return 'You\'ve reclaimed approximately $hours hours of your time.';
      }
      if (urgesResisted > 0) {
        return 'You\'ve resisted $urgesResisted urges — each one is a choice in your favor.';
      }
      return 'Every day of self-control builds the version of yourself you want to be.';
    }
  }

  // ── Recovery ─────────────────────────────────────────────────────────

  String _recoverySentence(int count) {
    if (count == 1) {
      return 'You got back up once. That\'s resilience.';
    }
    return 'You\'ve recovered $count times. Resilience isn\'t the absence of struggle — it\'s choosing to continue.';
  }

  // ── Closing ──────────────────────────────────────────────────────────

  static const _closings = [
    'Keep going. You\'re building something real.',
    'One day at a time — and today counts.',
    'Your journey is yours. No one can take your progress away.',
    'Whatever comes next, you have tools to handle it.',
    'You chose your values again today. That matters.',
    'Progress isn\'t linear, but you\'re moving forward.',
    'The version of you a month from now is grateful for today.',
    'Small wins compound. You\'re proving that to yourself.',
  ];

  String _closingSentence(DateTime forDate, int confidence) {
    // Deterministic rotation based on date — doesn't feel random
    final index = (forDate.day + forDate.month * 31) % _closings.length;
    return _closings[index];
  }
}