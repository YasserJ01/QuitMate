import '../../data/models/notification_models.dart';

/// Static audit utility that scans all notification templates for
/// shame-inducing or stigmatising language.
///
/// This is a **release gate** — CI must fail if violations exist.
///
/// Usage:
/// ```dart
/// final violations = ContentAuditService.audit(NotificationContent.allTemplates);
/// expect(violations, isEmpty);
/// ```
class ContentAuditService {
  ContentAuditService._();

  /// Phrases that MUST NOT appear in any notification copy.
  /// All checks are case-insensitive.
  static const _bannedPhrases = [
    'failed',
    'failure',
    'weak',
    'pathetic',
    'addict',
    'disgusting',
    'shameful',
    'give up',
    'loser',
    'worthless',
    'you should be',
    'you must',
    'sin',
    'immoral',
    'dirty',
    'filthy',
    'wrong',
    'bad person',
    'broken',
    'relapsed again',
  ];

  /// Returns all violations found. Empty list = PASS.
  static List<ContentViolation> audit(
    List<NotificationTemplate> templates,
  ) {
    final violations = <ContentViolation>[];

    for (final template in templates) {
      for (final phrase in _bannedPhrases) {
        final lowerTitle = template.title.toLowerCase();
        final lowerBody = template.body.toLowerCase();

        if (lowerTitle.contains(phrase)) {
          violations.add(
            ContentViolation(
              templateType: template.type,
              field: 'title',
              phrase: phrase,
              snippet: template.title,
            ),
          );
        }
        if (lowerBody.contains(phrase)) {
          violations.add(
            ContentViolation(
              templateType: template.type,
              field: 'body',
              phrase: phrase,
              snippet: template.body,
            ),
          );
        }
      }
    }

    return violations;
  }
}

/// A single shame-language violation found in a notification template.
class ContentViolation {
  final NotificationType templateType;
  final String field; // 'title' or 'body'
  final String phrase;
  final String snippet;

  const ContentViolation({
    required this.templateType,
    required this.field,
    required this.phrase,
    required this.snippet,
  });

  @override
  String toString() =>
      'ContentViolation($templateType, $field): "$phrase" in "$snippet"';
}