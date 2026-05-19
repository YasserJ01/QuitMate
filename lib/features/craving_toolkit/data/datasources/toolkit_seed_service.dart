import 'package:drift/drift.dart';
import '../../../../core/services/database/app_database.dart';

class ToolkitSeedService {
  final AppDatabase db;

  ToolkitSeedService(this.db);

  Future<void> seedIfNeeded() async {
    final rows = await db.select(db.toolkitExercises).get();
    if (rows.length >= _catalogue.length) return;

    final existingIds = rows.map((r) => r.exerciseId).toSet();

    await db.transaction(() async {
      for (final entry in _catalogue) {
        if (!existingIds.contains(entry.exerciseId)) {
          await db.into(db.toolkitExercises).insert(
                ToolkitExercisesCompanion(
                  exerciseId: Value(entry.exerciseId),
                  name: Value(entry.name),
                  category: Value(entry.category),
                  isFavorite: Value(entry.isFavorite),
                  lastUsedAt: Value(entry.lastUsedAt),
                  durationEstimateSeconds: Value(entry.durationEstimateSeconds),
                  isSharedBothModes: Value(entry.isSharedBothModes),
                  modeFilter: Value(entry.modeFilter),
                  shortDescription: Value(entry.shortDescription),
                  fullInstructions: Value(entry.fullInstructions),
                  modeSpecificNote: Value(entry.modeSpecificNote),
                  seededAt: Value(entry.seededAt),
                ),
                mode: InsertMode.insertOrIgnore,
              );
        }
      }
    });
  }

  static final _catalogue = <_SeedEntry>[
    _SeedEntry(
      id: 'breathing-box',
      name: 'Box Breathing',
      category: 'breathing',
      duration: 120,
      shared: true,
      shortDesc: 'Equal breathing used by Navy SEALs. Great for stress.',
      fullInstr:
          'Inhale for 4 seconds, hold for 4, exhale for 4, hold for 4. '
          'Repeat for the selected duration. This pattern calms your '
          'nervous system and improves focus.',
    ),
    _SeedEntry(
      id: 'breathing-relaxing',
      name: '4-7-8 Relaxing Breath',
      category: 'breathing',
      duration: 180,
      shared: true,
      shortDesc: 'Proven to reduce anxiety. Perfect for bedtime.',
      fullInstr:
          'Inhale quietly through your nose for 4 seconds. Hold your '
          'breath for 7 seconds. Exhale completely through your mouth '
          'for 8 seconds. This activates your parasympathetic nervous system.',
    ),
    _SeedEntry(
      id: 'breathing-energizing',
      name: 'Energizing Breath',
      category: 'breathing',
      duration: 120,
      shared: true,
      shortDesc: 'Quick breaths to boost energy and alertness.',
      fullInstr:
          'Inhale deeply for 6 seconds, then exhale quickly for 2 seconds. '
          'This pattern increases oxygen flow and wakes up your body.',
    ),
    _SeedEntry(
      id: 'breathing-calm',
      name: 'Calming Breath',
      category: 'breathing',
      duration: 120,
      shared: true,
      shortDesc: 'Gentle pattern to restore calm and balance.',
      fullInstr:
          'Inhale for 4 seconds, then exhale slowly for 6 seconds. '
          'The extended exhale triggers your relaxation response.',
    ),
    _SeedEntry(
      id: 'grounding-fivesenses',
      name: '5-4-3-2-1 Grounding',
      category: 'grounding',
      duration: 120,
      shared: true,
      shortDesc: 'Use your senses to anchor yourself in the present moment.',
      fullInstr:
          'Name 5 things you can SEE right now. Then 4 things you can '
          'TOUCH. Then 3 things you can HEAR. Then 2 things you can SMELL. '
          'Finally, 1 thing you can TASTE. This interrupts anxious thoughts.',
    ),
    _SeedEntry(
      id: 'grounding-bodyscan',
      name: 'Body Scan',
      category: 'grounding',
      duration: 180,
      shared: true,
      shortDesc: 'Scan your body from head to toe to release tension.',
      fullInstr:
          'Close your eyes. Slowly bring your attention to your feet. '
          'Notice any sensations — warmth, pressure, tingling. Move up '
          'through your legs, torso, arms, neck, and head. Breathe into '
          'any areas of tension.',
    ),
    _SeedEntry(
      id: 'grounding-objectfocus',
      name: 'Object Focus',
      category: 'grounding',
      duration: 60,
      shared: true,
      shortDesc: 'Study one object in detail for 60 seconds.',
      fullInstr:
          'Pick any object within reach. Study its colour, texture, weight, '
          'temperature, and shape. Notice details you have never seen before. '
          'This redirects your mind away from the craving.',
    ),
    _SeedEntry(
      id: 'urge-surfing-smoking',
      name: 'Urge Surfing',
      category: 'urgeSurfing',
      duration: 300,
      shared: false,
      modeFilter: 'quitSmoking',
      shortDesc:
          'Ride the nicotine craving wave. Peak passes in 3-5 minutes.',
      fullInstr:
          'Nicotine cravings peak within 3–5 minutes. '
          'Set a timer. Notice where you feel the urge in your body. '
          'Observe it without judgment. Watch it change. '
          'You are not the urge — you are the observer.',
      modeNote:
          'Nicotine cravings typically peak within 3–5 minutes. '
          'You do not need to fight it — just observe it.',
    ),
    _SeedEntry(
      id: 'urge-surfing-reduction',
      name: 'Urge Surfing',
      category: 'urgeSurfing',
      duration: 300,
      shared: false,
      modeFilter: 'reduceMasturbation',
      shortDesc: 'Urges are waves. They rise, peak, and fall.',
      fullInstr:
          'Urges follow the same wave pattern. '
          'They rise, peak, and fall. You are not the urge. '
          'Set a timer. Notice where you feel the urge in your body. '
          'Observe it without judgment.',
      modeNote:
          'Urges follow the same wave pattern. '
          'They rise, peak, and fall. You are not the urge.',
    ),
    _SeedEntry(
      id: 'delay-distract-smoking',
      name: 'Delay & Distract',
      category: 'delayAndDistract',
      duration: 300,
      shared: false,
      modeFilter: 'quitSmoking',
      shortDesc:
          'Tell yourself to wait 10 minutes. Cravings rarely survive that.',
      fullInstr:
          'Set a timer for 5–10 minutes. Choose a distraction activity: '
          'drink water, chew gum, do push-ups, call a friend, or step outside. '
          'When the timer ends, check if the craving has passed.',
      modeNote:
          'Try oral substitutes: sugar-free gum, carrot sticks, or a toothpick. '
          'Keep your hands busy.',
    ),
    _SeedEntry(
      id: 'delay-distract-reduction',
      name: 'Delay & Distract',
      category: 'delayAndDistract',
      duration: 300,
      shared: false,
      modeFilter: 'reduceMasturbation',
      shortDesc:
          'Tell yourself to wait 10 minutes. Cravings rarely survive that.',
      fullInstr:
          'Set a timer for 5–10 minutes. Choose a distraction activity: '
          'drink water, do push-ups, call a friend, or step outside. '
          'When the timer ends, check if the urge has passed.',
      modeNote:
          'Try physical activity: 10 push-ups, a brisk walk, or stretching. '
          'Physical exertion can short-circuit an urge.',
    ),
    _SeedEntry(
      id: 'cognitive-thoughtchallenge',
      name: 'Thought Challenge',
      category: 'cognitiveReframing',
      duration: 120,
      shared: true,
      shortDesc: 'Question and reframe automatic negative thoughts.',
      fullInstr:
          'Identify the automatic thought. Ask: Is this thought 100% true? '
          'What is the evidence for and against it? What would you tell a '
          'friend who had this thought? Create a more balanced perspective.',
    ),
    _SeedEntry(
      id: 'cognitive-consequence',
      name: 'Play the Tape Forward',
      category: 'cognitiveReframing',
      duration: 120,
      shared: true,
      shortDesc: 'Think through what happens if you give in vs. resist.',
      fullInstr:
          'Imagine giving in to the craving. What happens in 5 minutes? '
          'In 1 hour? Tomorrow? Now imagine resisting. How do you feel '
          'in 5 minutes? In 1 hour? Tomorrow? Compare the two paths.',
    ),
    _SeedEntry(
      id: 'cognitive-alternative',
      name: 'Alternative Actions',
      category: 'cognitiveReframing',
      duration: 60,
      shared: true,
      shortDesc: 'Replace the urge with a healthy alternative.',
      fullInstr:
          'List 3 healthy activities you can do right now instead. '
          'Pick one and do it immediately. The key is to replace the '
          'habit loop with a positive alternative.',
    ),
    _SeedEntry(
      id: 'journaling',
      name: 'Journaling',
      category: 'journaling',
      duration: 300,
      shared: true,
      shortDesc: 'Write freely about what you are experiencing right now.',
      fullInstr:
          'Open a blank page and write whatever comes to mind. '
          'How are you feeling? What triggered the craving? What would '
          'help right now? There are no rules — just let the words flow.',
    ),
    _SeedEntry(
      id: 'relapse-recovery-plan',
      name: 'Recovery Plan Exercise',
      category: 'relapseRecoveryPlanning',
      duration: 600,
      shared: true,
      shortDesc: 'Write your personal plan for getting back on track.',
      fullInstr:
          'This is a data point, not a failure. Take time to write your '
          'personal recovery plan: What triggered this? What can you learn? '
          'Who can you reach out to? What will you do differently next time? '
          'Set a new intention and move forward with self-compassion.',
    ),
    _SeedEntry(
      id: 'grounding-coldwater',
      name: 'Cold Water Reset',
      category: 'grounding',
      duration: 60,
      shared: true,
      shortDesc: 'Use cold water to activate your calming response.',
      fullInstr:
          'Splash cold water on your face. Hold your breath briefly. '
          'This activates the mammalian dive reflex, which slows your '
          'heart rate and calms your nervous system. Evidence-based and '
          'effective within seconds.',
    ),
    _SeedEntry(
      id: 'grounding-counting',
      name: 'Counting (Backwards by 7)',
      category: 'grounding',
      duration: 120,
      shared: true,
      shortDesc: 'Count backwards by 7s to reset your focus.',
      fullInstr:
          'Start from a large number and count backwards by 7. '
          'This engages your brain in a focused task that distracts '
          'from cravings. Choose easy (107), medium (500), or hard (1000).',
    ),
  ];
}

class _SeedEntry {
  final String id;
  final String name;
  final String category;
  final int duration;
  final bool shared;
  final String? modeFilter;
  final String shortDesc;
  final String fullInstr;
  final String? modeNote;

  _SeedEntry({
    required this.id,
    required this.name,
    required this.category,
    required this.duration,
    required this.shared,
    this.modeFilter,
    required this.shortDesc,
    required this.fullInstr,
    this.modeNote,
  });

  String get exerciseId => id;
  bool get isFavorite => false;
  int get durationEstimateSeconds => duration;
  bool get isSharedBothModes => shared;
  String get shortDescription => shortDesc;
  String get fullInstructions => fullInstr;
  String? get modeSpecificNote => modeNote;
  DateTime? get lastUsedAt => null;
  DateTime get seededAt => DateTime.now();
}
