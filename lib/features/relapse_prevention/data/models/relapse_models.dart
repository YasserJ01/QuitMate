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

class PanicStep {
  String title;
  String description;
  String icon;
  PanicActionType actionType;
  int? contactId;
  String? actionData;
  int displayOrder;

  PanicStep({
    required this.title,
    required this.description,
    required this.icon,
    required this.actionType,
    this.contactId,
    this.actionData,
    required this.displayOrder,
  });

  static List<PanicStep> getDefaults() {
    return [
      PanicStep(
        title: 'Take Deep Breaths',
        description: 'Start box breathing: 4 seconds in, 4 hold, 4 out, 4 hold',
        icon: '🫁',
        actionType: PanicActionType.breathing,
        actionData: 'box',
        displayOrder: 0,
      ),
      PanicStep(
        title: 'Ground Yourself',
        description: 'Name 5 things you see, 4 you touch, 3 you hear, 2 you smell, 1 you taste',
        icon: '👁️',
        actionType: PanicActionType.grounding,
        actionData: 'fiveSenses',
        displayOrder: 1,
      ),
      PanicStep(
        title: 'Call Support',
        description: 'Reach out to someone who understands your journey',
        icon: '📞',
        actionType: PanicActionType.contact,
        displayOrder: 2,
      ),
    ];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'icon': icon,
      'actionType': actionType.name,
      'contactId': contactId,
      'actionData': actionData,
      'displayOrder': displayOrder,
    };
  }

  factory PanicStep.fromJson(Map<String, dynamic> json) {
    return PanicStep(
      title: json['title'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      actionType: PanicActionType.values.byName(json['actionType'] as String),
      contactId: json['contactId'] as int?,
      actionData: json['actionData'] as String?,
      displayOrder: json['displayOrder'] as int,
    );
  }
}

class RelapseContact {
  int id;
  String userId;
  String name;
  String? phoneNumber;
  String? relationship;
  String? notes;
  int displayOrder;
  DateTime createdAt;
  DateTime? updatedAt;

  RelapseContact({
    this.id = 0,
    required this.userId,
    required this.name,
    this.phoneNumber,
    this.relationship,
    this.notes,
    this.displayOrder = 0,
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  String get formattedPhone {
    if (phoneNumber == null || phoneNumber!.isEmpty) return '';
    final cleaned = phoneNumber!.replaceAll(RegExp(r'\D'), '');
    if (cleaned.length == 10) {
      return '(${cleaned.substring(0, 3)}) ${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
    }
    return phoneNumber!;
  }

  bool get hasPhone => phoneNumber != null && phoneNumber!.isNotEmpty;
}

class RelapsePlan {
  int id;
  String userId;
  List<String> customSteps;
  List<PanicStep> panicSteps;
  String? notes;
  DateTime? nextReviewDate;
  String? personalRecoveryNote;
  DateTime? lastReviewedAt;
  DateTime createdAt;
  DateTime? updatedAt;

  RelapsePlan({
    this.id = 0,
    required this.userId,
    List<String>? customSteps,
    List<PanicStep>? panicSteps,
    this.notes,
    this.nextReviewDate,
    this.personalRecoveryNote,
    this.lastReviewedAt,
    DateTime? createdAt,
    this.updatedAt,
  })  : customSteps = customSteps ?? getDefaultCustomSteps(),
        panicSteps = panicSteps ?? PanicStep.getDefaults(),
        createdAt = createdAt ?? DateTime.now();

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

    for (int i = 0; i < panicSteps.length; i++) {
      panicSteps[i].displayOrder = i;
    }
  }

  List<Map<String, dynamic>> panicStepsToJson() {
    return panicSteps.map((s) => s.toJson()).toList();
  }

  static List<PanicStep> panicStepsFromJson(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((j) => PanicStep.fromJson(j)).toList();
  }
}
