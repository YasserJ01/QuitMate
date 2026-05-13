import 'package:isar/isar.dart';

part 'relapse_models.g.dart';

// ============= PANIC STEP (EMBEDDED) =============

enum PanicActionType {
  breathing,
  contact,
  grounding,
  cbt,
  custom;

  String get displayName {
    switch (this) {
      case PanicActionType.breathing:
        return 'Breathing Exercise';
      case PanicActionType.contact:
        return 'Call Contact';
      case PanicActionType.grounding:
        return 'Grounding Exercise';
      case PanicActionType.cbt:
        return 'CBT Technique';
      case PanicActionType.custom:
        return 'Custom Action';
    }
  }
}

@embedded
class PanicStep {
  late String title;
  late String description;
  late String icon; // Emoji or icon name
  
  @Enumerated(EnumType.name)
  late PanicActionType actionType;
  
  // Optional: ID of contact to call (if actionType is contact)
  int? contactId;
  
  // Optional: Specific breathing pattern or grounding exercise
  String? actionData;
  
  late int displayOrder;

  PanicStep();

  // Helper to create default panic steps
  static List<PanicStep> getDefaults() {
    return [
      PanicStep()
        ..title = 'Take Deep Breaths'
        ..description = 'Start box breathing: 4 seconds in, 4 hold, 4 out, 4 hold'
        ..icon = '🫁'
        ..actionType = PanicActionType.breathing
        ..actionData = 'box'
        ..displayOrder = 0,
      PanicStep()
        ..title = 'Ground Yourself'
        ..description = 'Name 5 things you see, 4 you touch, 3 you hear, 2 you smell, 1 you taste'
        ..icon = '👁️'
        ..actionType = PanicActionType.grounding
        ..actionData = 'fiveSenses'
        ..displayOrder = 1,
      PanicStep()
        ..title = 'Call Support'
        ..description = 'Reach out to someone who understands your journey'
        ..icon = '📞'
        ..actionType = PanicActionType.contact
        ..displayOrder = 2,
    ];
  }
}

// ============= RELAPSE CONTACT =============

@collection
class RelapseContact {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  late String name;
  String? phoneNumber; // Optional
  String? relationship; // e.g., "Friend", "Sponsor", "Family"
  String? notes;
  
  late int displayOrder;
  
  late DateTime createdAt;
  DateTime? updatedAt;

  RelapseContact() {
    createdAt = DateTime.now();
    displayOrder = 0;
  }

  // Helper to format phone number for display
  String get formattedPhone {
    if (phoneNumber == null || phoneNumber!.isEmpty) return '';
    // Simple formatting - can be enhanced
    final cleaned = phoneNumber!.replaceAll(RegExp(r'\D'), '');
    if (cleaned.length == 10) {
      return '(${cleaned.substring(0, 3)}) ${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
    }
    return phoneNumber!;
  }

  bool get hasPhone => phoneNumber != null && phoneNumber!.isNotEmpty;
}

// ============= RELAPSE PLAN =============

@collection
class RelapsePlan {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String userId;

  // Custom relapse prevention steps (user-defined)
  List<String> customSteps = [];

  // Panic mode steps (3 quick steps)
  List<PanicStep> panicSteps = [];

  // Additional notes/reflections
  String? notes;

  // When to review the plan
  DateTime? nextReviewDate;

  // User-written personal recovery guide (optional).
  String? personalRecoveryNote;

  // Timestamp of the last time the user reviewed this plan.
  DateTime? lastReviewedAt;

  late DateTime createdAt;
  DateTime? updatedAt;

  RelapsePlan() {
    createdAt = DateTime.now();
    // Initialize with default panic steps
    panicSteps = PanicStep.getDefaults();
  }

  // Helper to get default custom steps
  static List<String> getDefaultCustomSteps() {
    return [
      'Acknowledge the slip without judgment',
      'Identify what triggered the relapse',
      'Review my reasons for quitting',
      'Reach out to my support network',
      'Use my coping strategies from the toolkit',
      'Set a new quit date if needed',
      'Learn from this experience',
    ];
  }

  // Ensure we always have exactly 3 panic steps
  void ensureThreePanicSteps() {
    if (panicSteps.isEmpty) {
      panicSteps = PanicStep.getDefaults();
    } else if (panicSteps.length < 3) {
      final defaults = PanicStep.getDefaults();
      while (panicSteps.length < 3) {
        panicSteps.add(defaults[panicSteps.length]);
      }
    } else if (panicSteps.length > 3) {
      panicSteps = panicSteps.sublist(0, 3);
    }
    
    // Ensure correct display order
    for (int i = 0; i < panicSteps.length; i++) {
      panicSteps[i].displayOrder = i;
    }
  }
}
