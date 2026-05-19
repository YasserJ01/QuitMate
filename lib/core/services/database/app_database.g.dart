// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, DbUserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _goalTypeMeta = const VerificationMeta(
    'goalType',
  );
  @override
  late final GeneratedColumn<String> goalType = GeneratedColumn<String>(
    'goal_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modeLockedMeta = const VerificationMeta(
    'modeLocked',
  );
  @override
  late final GeneratedColumn<bool> modeLocked = GeneratedColumn<bool>(
    'mode_locked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("mode_locked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _longestStreakDaysMeta = const VerificationMeta(
    'longestStreakDays',
  );
  @override
  late final GeneratedColumn<int> longestStreakDays = GeneratedColumn<int>(
    'longest_streak_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _recoveryCountMeta = const VerificationMeta(
    'recoveryCount',
  );
  @override
  late final GeneratedColumn<int> recoveryCount = GeneratedColumn<int>(
    'recovery_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastLapseAtMeta = const VerificationMeta(
    'lastLapseAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastLapseAt = GeneratedColumn<DateTime>(
    'last_lapse_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cigarettesPerDayMeta = const VerificationMeta(
    'cigarettesPerDay',
  );
  @override
  late final GeneratedColumn<int> cigarettesPerDay = GeneratedColumn<int>(
    'cigarettes_per_day',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cigarettesPerPackMeta = const VerificationMeta(
    'cigarettesPerPack',
  );
  @override
  late final GeneratedColumn<int> cigarettesPerPack = GeneratedColumn<int>(
    'cigarettes_per_pack',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _costPerPackMeta = const VerificationMeta(
    'costPerPack',
  );
  @override
  late final GeneratedColumn<double> costPerPack = GeneratedColumn<double>(
    'cost_per_pack',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ttfcMinutesIndexMeta = const VerificationMeta(
    'ttfcMinutesIndex',
  );
  @override
  late final GeneratedColumn<int> ttfcMinutesIndex = GeneratedColumn<int>(
    'ttfc_minutes_index',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yearsSmokingMeta = const VerificationMeta(
    'yearsSmoking',
  );
  @override
  late final GeneratedColumn<int> yearsSmoking = GeneratedColumn<int>(
    'years_smoking',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reductionPlanJsonMeta = const VerificationMeta(
    'reductionPlanJson',
  );
  @override
  late final GeneratedColumn<String> reductionPlanJson =
      GeneratedColumn<String>(
        'reduction_plan_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _previousQuitAttemptsMeta =
      const VerificationMeta('previousQuitAttempts');
  @override
  late final GeneratedColumn<int> previousQuitAttempts = GeneratedColumn<int>(
    'previous_quit_attempts',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  previousAids = GeneratedColumn<String>(
    'previous_aids',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<String>?>($UserProfilesTable.$converterpreviousAidsn);
  static const VerificationMeta _confidenceToQuitMeta = const VerificationMeta(
    'confidenceToQuit',
  );
  @override
  late final GeneratedColumn<int> confidenceToQuit = GeneratedColumn<int>(
    'confidence_to_quit',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  smokingWindows = GeneratedColumn<String>(
    'smoking_windows',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<String>?>($UserProfilesTable.$convertersmokingWindowsn);
  static const VerificationMeta _episodesPerWeekMeta = const VerificationMeta(
    'episodesPerWeek',
  );
  @override
  late final GeneratedColumn<int> episodesPerWeek = GeneratedColumn<int>(
    'episodes_per_week',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _episodeDurationMinutesMeta =
      const VerificationMeta('episodeDurationMinutes');
  @override
  late final GeneratedColumn<int> episodeDurationMinutes = GeneratedColumn<int>(
    'episode_duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pornInvolvementFlagMeta =
      const VerificationMeta('pornInvolvementFlag');
  @override
  late final GeneratedColumn<bool> pornInvolvementFlag = GeneratedColumn<bool>(
    'porn_involvement_flag',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("porn_involvement_flag" IN (0, 1))',
    ),
  );
  static const VerificationMeta _distressLevelMeta = const VerificationMeta(
    'distressLevel',
  );
  @override
  late final GeneratedColumn<int> distressLevel = GeneratedColumn<int>(
    'distress_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sleepEffectIndexMeta = const VerificationMeta(
    'sleepEffectIndex',
  );
  @override
  late final GeneratedColumn<int> sleepEffectIndex = GeneratedColumn<int>(
    'sleep_effect_index',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _focusEffectIndexMeta = const VerificationMeta(
    'focusEffectIndex',
  );
  @override
  late final GeneratedColumn<int> focusEffectIndex = GeneratedColumn<int>(
    'focus_effect_index',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relationshipEffectIndexMeta =
      const VerificationMeta('relationshipEffectIndex');
  @override
  late final GeneratedColumn<int> relationshipEffectIndex =
      GeneratedColumn<int>(
        'relationship_effect_index',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _previousReductionAttemptsMeta =
      const VerificationMeta('previousReductionAttempts');
  @override
  late final GeneratedColumn<int> previousReductionAttempts =
      GeneratedColumn<int>(
        'previous_reduction_attempts',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _confidenceToReduceMeta =
      const VerificationMeta('confidenceToReduce');
  @override
  late final GeneratedColumn<int> confidenceToReduce = GeneratedColumn<int>(
    'confidence_to_reduce',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frequencyTargetMeta = const VerificationMeta(
    'frequencyTarget',
  );
  @override
  late final GeneratedColumn<int> frequencyTarget = GeneratedColumn<int>(
    'frequency_target',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  timeOfDayPatterns =
      GeneratedColumn<String>(
        'time_of_day_patterns',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>(
        $UserProfilesTable.$convertertimeOfDayPatternsn,
      );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> values =
      GeneratedColumn<String>(
        'values',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>($UserProfilesTable.$convertervaluesn);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> triggers =
      GeneratedColumn<String>(
        'triggers',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>($UserProfilesTable.$convertertriggersn);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> reasons =
      GeneratedColumn<String>(
        'reasons',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>($UserProfilesTable.$converterreasonsn);
  static const VerificationMeta _quitDateMeta = const VerificationMeta(
    'quitDate',
  );
  @override
  late final GeneratedColumn<DateTime> quitDate = GeneratedColumn<DateTime>(
    'quit_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    nickname,
    goalType,
    modeLocked,
    longestStreakDays,
    recoveryCount,
    lastLapseAt,
    cigarettesPerDay,
    cigarettesPerPack,
    costPerPack,
    ttfcMinutesIndex,
    yearsSmoking,
    reductionPlanJson,
    previousQuitAttempts,
    previousAids,
    confidenceToQuit,
    smokingWindows,
    episodesPerWeek,
    episodeDurationMinutes,
    pornInvolvementFlag,
    distressLevel,
    sleepEffectIndex,
    focusEffectIndex,
    relationshipEffectIndex,
    previousReductionAttempts,
    confidenceToReduce,
    frequencyTarget,
    timeOfDayPatterns,
    values,
    triggers,
    reasons,
    quitDate,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbUserProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    }
    if (data.containsKey('goal_type')) {
      context.handle(
        _goalTypeMeta,
        goalType.isAcceptableOrUnknown(data['goal_type']!, _goalTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_goalTypeMeta);
    }
    if (data.containsKey('mode_locked')) {
      context.handle(
        _modeLockedMeta,
        modeLocked.isAcceptableOrUnknown(data['mode_locked']!, _modeLockedMeta),
      );
    }
    if (data.containsKey('longest_streak_days')) {
      context.handle(
        _longestStreakDaysMeta,
        longestStreakDays.isAcceptableOrUnknown(
          data['longest_streak_days']!,
          _longestStreakDaysMeta,
        ),
      );
    }
    if (data.containsKey('recovery_count')) {
      context.handle(
        _recoveryCountMeta,
        recoveryCount.isAcceptableOrUnknown(
          data['recovery_count']!,
          _recoveryCountMeta,
        ),
      );
    }
    if (data.containsKey('last_lapse_at')) {
      context.handle(
        _lastLapseAtMeta,
        lastLapseAt.isAcceptableOrUnknown(
          data['last_lapse_at']!,
          _lastLapseAtMeta,
        ),
      );
    }
    if (data.containsKey('cigarettes_per_day')) {
      context.handle(
        _cigarettesPerDayMeta,
        cigarettesPerDay.isAcceptableOrUnknown(
          data['cigarettes_per_day']!,
          _cigarettesPerDayMeta,
        ),
      );
    }
    if (data.containsKey('cigarettes_per_pack')) {
      context.handle(
        _cigarettesPerPackMeta,
        cigarettesPerPack.isAcceptableOrUnknown(
          data['cigarettes_per_pack']!,
          _cigarettesPerPackMeta,
        ),
      );
    }
    if (data.containsKey('cost_per_pack')) {
      context.handle(
        _costPerPackMeta,
        costPerPack.isAcceptableOrUnknown(
          data['cost_per_pack']!,
          _costPerPackMeta,
        ),
      );
    }
    if (data.containsKey('ttfc_minutes_index')) {
      context.handle(
        _ttfcMinutesIndexMeta,
        ttfcMinutesIndex.isAcceptableOrUnknown(
          data['ttfc_minutes_index']!,
          _ttfcMinutesIndexMeta,
        ),
      );
    }
    if (data.containsKey('years_smoking')) {
      context.handle(
        _yearsSmokingMeta,
        yearsSmoking.isAcceptableOrUnknown(
          data['years_smoking']!,
          _yearsSmokingMeta,
        ),
      );
    }
    if (data.containsKey('reduction_plan_json')) {
      context.handle(
        _reductionPlanJsonMeta,
        reductionPlanJson.isAcceptableOrUnknown(
          data['reduction_plan_json']!,
          _reductionPlanJsonMeta,
        ),
      );
    }
    if (data.containsKey('previous_quit_attempts')) {
      context.handle(
        _previousQuitAttemptsMeta,
        previousQuitAttempts.isAcceptableOrUnknown(
          data['previous_quit_attempts']!,
          _previousQuitAttemptsMeta,
        ),
      );
    }
    if (data.containsKey('confidence_to_quit')) {
      context.handle(
        _confidenceToQuitMeta,
        confidenceToQuit.isAcceptableOrUnknown(
          data['confidence_to_quit']!,
          _confidenceToQuitMeta,
        ),
      );
    }
    if (data.containsKey('episodes_per_week')) {
      context.handle(
        _episodesPerWeekMeta,
        episodesPerWeek.isAcceptableOrUnknown(
          data['episodes_per_week']!,
          _episodesPerWeekMeta,
        ),
      );
    }
    if (data.containsKey('episode_duration_minutes')) {
      context.handle(
        _episodeDurationMinutesMeta,
        episodeDurationMinutes.isAcceptableOrUnknown(
          data['episode_duration_minutes']!,
          _episodeDurationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('porn_involvement_flag')) {
      context.handle(
        _pornInvolvementFlagMeta,
        pornInvolvementFlag.isAcceptableOrUnknown(
          data['porn_involvement_flag']!,
          _pornInvolvementFlagMeta,
        ),
      );
    }
    if (data.containsKey('distress_level')) {
      context.handle(
        _distressLevelMeta,
        distressLevel.isAcceptableOrUnknown(
          data['distress_level']!,
          _distressLevelMeta,
        ),
      );
    }
    if (data.containsKey('sleep_effect_index')) {
      context.handle(
        _sleepEffectIndexMeta,
        sleepEffectIndex.isAcceptableOrUnknown(
          data['sleep_effect_index']!,
          _sleepEffectIndexMeta,
        ),
      );
    }
    if (data.containsKey('focus_effect_index')) {
      context.handle(
        _focusEffectIndexMeta,
        focusEffectIndex.isAcceptableOrUnknown(
          data['focus_effect_index']!,
          _focusEffectIndexMeta,
        ),
      );
    }
    if (data.containsKey('relationship_effect_index')) {
      context.handle(
        _relationshipEffectIndexMeta,
        relationshipEffectIndex.isAcceptableOrUnknown(
          data['relationship_effect_index']!,
          _relationshipEffectIndexMeta,
        ),
      );
    }
    if (data.containsKey('previous_reduction_attempts')) {
      context.handle(
        _previousReductionAttemptsMeta,
        previousReductionAttempts.isAcceptableOrUnknown(
          data['previous_reduction_attempts']!,
          _previousReductionAttemptsMeta,
        ),
      );
    }
    if (data.containsKey('confidence_to_reduce')) {
      context.handle(
        _confidenceToReduceMeta,
        confidenceToReduce.isAcceptableOrUnknown(
          data['confidence_to_reduce']!,
          _confidenceToReduceMeta,
        ),
      );
    }
    if (data.containsKey('frequency_target')) {
      context.handle(
        _frequencyTargetMeta,
        frequencyTarget.isAcceptableOrUnknown(
          data['frequency_target']!,
          _frequencyTargetMeta,
        ),
      );
    }
    if (data.containsKey('quit_date')) {
      context.handle(
        _quitDateMeta,
        quitDate.isAcceptableOrUnknown(data['quit_date']!, _quitDateMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbUserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbUserProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      ),
      goalType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal_type'],
      )!,
      modeLocked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}mode_locked'],
      )!,
      longestStreakDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}longest_streak_days'],
      )!,
      recoveryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recovery_count'],
      )!,
      lastLapseAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_lapse_at'],
      ),
      cigarettesPerDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cigarettes_per_day'],
      ),
      cigarettesPerPack: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cigarettes_per_pack'],
      ),
      costPerPack: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_per_pack'],
      ),
      ttfcMinutesIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ttfc_minutes_index'],
      ),
      yearsSmoking: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}years_smoking'],
      ),
      reductionPlanJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reduction_plan_json'],
      ),
      previousQuitAttempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}previous_quit_attempts'],
      ),
      previousAids: $UserProfilesTable.$converterpreviousAidsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}previous_aids'],
        ),
      ),
      confidenceToQuit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}confidence_to_quit'],
      ),
      smokingWindows: $UserProfilesTable.$convertersmokingWindowsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}smoking_windows'],
        ),
      ),
      episodesPerWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episodes_per_week'],
      ),
      episodeDurationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode_duration_minutes'],
      ),
      pornInvolvementFlag: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}porn_involvement_flag'],
      ),
      distressLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}distress_level'],
      ),
      sleepEffectIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sleep_effect_index'],
      ),
      focusEffectIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}focus_effect_index'],
      ),
      relationshipEffectIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}relationship_effect_index'],
      ),
      previousReductionAttempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}previous_reduction_attempts'],
      ),
      confidenceToReduce: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}confidence_to_reduce'],
      ),
      frequencyTarget: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}frequency_target'],
      ),
      timeOfDayPatterns: $UserProfilesTable.$convertertimeOfDayPatternsn
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}time_of_day_patterns'],
            ),
          ),
      values: $UserProfilesTable.$convertervaluesn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}values'],
        ),
      ),
      triggers: $UserProfilesTable.$convertertriggersn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}triggers'],
        ),
      ),
      reasons: $UserProfilesTable.$converterreasonsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reasons'],
        ),
      ),
      quitDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}quit_date'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterpreviousAids =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterpreviousAidsn =
      NullAwareTypeConverter.wrap($converterpreviousAids);
  static TypeConverter<List<String>, String> $convertersmokingWindows =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $convertersmokingWindowsn =
      NullAwareTypeConverter.wrap($convertersmokingWindows);
  static TypeConverter<List<String>, String> $convertertimeOfDayPatterns =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $convertertimeOfDayPatternsn =
      NullAwareTypeConverter.wrap($convertertimeOfDayPatterns);
  static TypeConverter<List<String>, String> $convertervalues =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $convertervaluesn =
      NullAwareTypeConverter.wrap($convertervalues);
  static TypeConverter<List<String>, String> $convertertriggers =
      const TriggerTypeListConverter();
  static TypeConverter<List<String>?, String?> $convertertriggersn =
      NullAwareTypeConverter.wrap($convertertriggers);
  static TypeConverter<List<String>, String> $converterreasons =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterreasonsn =
      NullAwareTypeConverter.wrap($converterreasons);
}

class DbUserProfile extends DataClass implements Insertable<DbUserProfile> {
  final int id;
  final String userId;
  final String? nickname;
  final String goalType;
  final bool modeLocked;
  final int longestStreakDays;
  final int recoveryCount;
  final DateTime? lastLapseAt;
  final int? cigarettesPerDay;
  final int? cigarettesPerPack;
  final double? costPerPack;
  final int? ttfcMinutesIndex;
  final int? yearsSmoking;
  final String? reductionPlanJson;
  final int? previousQuitAttempts;
  final List<String>? previousAids;
  final int? confidenceToQuit;
  final List<String>? smokingWindows;
  final int? episodesPerWeek;
  final int? episodeDurationMinutes;
  final bool? pornInvolvementFlag;
  final int? distressLevel;
  final int? sleepEffectIndex;
  final int? focusEffectIndex;
  final int? relationshipEffectIndex;
  final int? previousReductionAttempts;
  final int? confidenceToReduce;
  final int? frequencyTarget;
  final List<String>? timeOfDayPatterns;
  final List<String>? values;
  final List<String>? triggers;
  final List<String>? reasons;
  final DateTime? quitDate;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const DbUserProfile({
    required this.id,
    required this.userId,
    this.nickname,
    required this.goalType,
    required this.modeLocked,
    required this.longestStreakDays,
    required this.recoveryCount,
    this.lastLapseAt,
    this.cigarettesPerDay,
    this.cigarettesPerPack,
    this.costPerPack,
    this.ttfcMinutesIndex,
    this.yearsSmoking,
    this.reductionPlanJson,
    this.previousQuitAttempts,
    this.previousAids,
    this.confidenceToQuit,
    this.smokingWindows,
    this.episodesPerWeek,
    this.episodeDurationMinutes,
    this.pornInvolvementFlag,
    this.distressLevel,
    this.sleepEffectIndex,
    this.focusEffectIndex,
    this.relationshipEffectIndex,
    this.previousReductionAttempts,
    this.confidenceToReduce,
    this.frequencyTarget,
    this.timeOfDayPatterns,
    this.values,
    this.triggers,
    this.reasons,
    this.quitDate,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || nickname != null) {
      map['nickname'] = Variable<String>(nickname);
    }
    map['goal_type'] = Variable<String>(goalType);
    map['mode_locked'] = Variable<bool>(modeLocked);
    map['longest_streak_days'] = Variable<int>(longestStreakDays);
    map['recovery_count'] = Variable<int>(recoveryCount);
    if (!nullToAbsent || lastLapseAt != null) {
      map['last_lapse_at'] = Variable<DateTime>(lastLapseAt);
    }
    if (!nullToAbsent || cigarettesPerDay != null) {
      map['cigarettes_per_day'] = Variable<int>(cigarettesPerDay);
    }
    if (!nullToAbsent || cigarettesPerPack != null) {
      map['cigarettes_per_pack'] = Variable<int>(cigarettesPerPack);
    }
    if (!nullToAbsent || costPerPack != null) {
      map['cost_per_pack'] = Variable<double>(costPerPack);
    }
    if (!nullToAbsent || ttfcMinutesIndex != null) {
      map['ttfc_minutes_index'] = Variable<int>(ttfcMinutesIndex);
    }
    if (!nullToAbsent || yearsSmoking != null) {
      map['years_smoking'] = Variable<int>(yearsSmoking);
    }
    if (!nullToAbsent || reductionPlanJson != null) {
      map['reduction_plan_json'] = Variable<String>(reductionPlanJson);
    }
    if (!nullToAbsent || previousQuitAttempts != null) {
      map['previous_quit_attempts'] = Variable<int>(previousQuitAttempts);
    }
    if (!nullToAbsent || previousAids != null) {
      map['previous_aids'] = Variable<String>(
        $UserProfilesTable.$converterpreviousAidsn.toSql(previousAids),
      );
    }
    if (!nullToAbsent || confidenceToQuit != null) {
      map['confidence_to_quit'] = Variable<int>(confidenceToQuit);
    }
    if (!nullToAbsent || smokingWindows != null) {
      map['smoking_windows'] = Variable<String>(
        $UserProfilesTable.$convertersmokingWindowsn.toSql(smokingWindows),
      );
    }
    if (!nullToAbsent || episodesPerWeek != null) {
      map['episodes_per_week'] = Variable<int>(episodesPerWeek);
    }
    if (!nullToAbsent || episodeDurationMinutes != null) {
      map['episode_duration_minutes'] = Variable<int>(episodeDurationMinutes);
    }
    if (!nullToAbsent || pornInvolvementFlag != null) {
      map['porn_involvement_flag'] = Variable<bool>(pornInvolvementFlag);
    }
    if (!nullToAbsent || distressLevel != null) {
      map['distress_level'] = Variable<int>(distressLevel);
    }
    if (!nullToAbsent || sleepEffectIndex != null) {
      map['sleep_effect_index'] = Variable<int>(sleepEffectIndex);
    }
    if (!nullToAbsent || focusEffectIndex != null) {
      map['focus_effect_index'] = Variable<int>(focusEffectIndex);
    }
    if (!nullToAbsent || relationshipEffectIndex != null) {
      map['relationship_effect_index'] = Variable<int>(relationshipEffectIndex);
    }
    if (!nullToAbsent || previousReductionAttempts != null) {
      map['previous_reduction_attempts'] = Variable<int>(
        previousReductionAttempts,
      );
    }
    if (!nullToAbsent || confidenceToReduce != null) {
      map['confidence_to_reduce'] = Variable<int>(confidenceToReduce);
    }
    if (!nullToAbsent || frequencyTarget != null) {
      map['frequency_target'] = Variable<int>(frequencyTarget);
    }
    if (!nullToAbsent || timeOfDayPatterns != null) {
      map['time_of_day_patterns'] = Variable<String>(
        $UserProfilesTable.$convertertimeOfDayPatternsn.toSql(
          timeOfDayPatterns,
        ),
      );
    }
    if (!nullToAbsent || values != null) {
      map['values'] = Variable<String>(
        $UserProfilesTable.$convertervaluesn.toSql(values),
      );
    }
    if (!nullToAbsent || triggers != null) {
      map['triggers'] = Variable<String>(
        $UserProfilesTable.$convertertriggersn.toSql(triggers),
      );
    }
    if (!nullToAbsent || reasons != null) {
      map['reasons'] = Variable<String>(
        $UserProfilesTable.$converterreasonsn.toSql(reasons),
      );
    }
    if (!nullToAbsent || quitDate != null) {
      map['quit_date'] = Variable<DateTime>(quitDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      userId: Value(userId),
      nickname: nickname == null && nullToAbsent
          ? const Value.absent()
          : Value(nickname),
      goalType: Value(goalType),
      modeLocked: Value(modeLocked),
      longestStreakDays: Value(longestStreakDays),
      recoveryCount: Value(recoveryCount),
      lastLapseAt: lastLapseAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLapseAt),
      cigarettesPerDay: cigarettesPerDay == null && nullToAbsent
          ? const Value.absent()
          : Value(cigarettesPerDay),
      cigarettesPerPack: cigarettesPerPack == null && nullToAbsent
          ? const Value.absent()
          : Value(cigarettesPerPack),
      costPerPack: costPerPack == null && nullToAbsent
          ? const Value.absent()
          : Value(costPerPack),
      ttfcMinutesIndex: ttfcMinutesIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(ttfcMinutesIndex),
      yearsSmoking: yearsSmoking == null && nullToAbsent
          ? const Value.absent()
          : Value(yearsSmoking),
      reductionPlanJson: reductionPlanJson == null && nullToAbsent
          ? const Value.absent()
          : Value(reductionPlanJson),
      previousQuitAttempts: previousQuitAttempts == null && nullToAbsent
          ? const Value.absent()
          : Value(previousQuitAttempts),
      previousAids: previousAids == null && nullToAbsent
          ? const Value.absent()
          : Value(previousAids),
      confidenceToQuit: confidenceToQuit == null && nullToAbsent
          ? const Value.absent()
          : Value(confidenceToQuit),
      smokingWindows: smokingWindows == null && nullToAbsent
          ? const Value.absent()
          : Value(smokingWindows),
      episodesPerWeek: episodesPerWeek == null && nullToAbsent
          ? const Value.absent()
          : Value(episodesPerWeek),
      episodeDurationMinutes: episodeDurationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(episodeDurationMinutes),
      pornInvolvementFlag: pornInvolvementFlag == null && nullToAbsent
          ? const Value.absent()
          : Value(pornInvolvementFlag),
      distressLevel: distressLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(distressLevel),
      sleepEffectIndex: sleepEffectIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepEffectIndex),
      focusEffectIndex: focusEffectIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(focusEffectIndex),
      relationshipEffectIndex: relationshipEffectIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(relationshipEffectIndex),
      previousReductionAttempts:
          previousReductionAttempts == null && nullToAbsent
          ? const Value.absent()
          : Value(previousReductionAttempts),
      confidenceToReduce: confidenceToReduce == null && nullToAbsent
          ? const Value.absent()
          : Value(confidenceToReduce),
      frequencyTarget: frequencyTarget == null && nullToAbsent
          ? const Value.absent()
          : Value(frequencyTarget),
      timeOfDayPatterns: timeOfDayPatterns == null && nullToAbsent
          ? const Value.absent()
          : Value(timeOfDayPatterns),
      values: values == null && nullToAbsent
          ? const Value.absent()
          : Value(values),
      triggers: triggers == null && nullToAbsent
          ? const Value.absent()
          : Value(triggers),
      reasons: reasons == null && nullToAbsent
          ? const Value.absent()
          : Value(reasons),
      quitDate: quitDate == null && nullToAbsent
          ? const Value.absent()
          : Value(quitDate),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbUserProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbUserProfile(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      nickname: serializer.fromJson<String?>(json['nickname']),
      goalType: serializer.fromJson<String>(json['goalType']),
      modeLocked: serializer.fromJson<bool>(json['modeLocked']),
      longestStreakDays: serializer.fromJson<int>(json['longestStreakDays']),
      recoveryCount: serializer.fromJson<int>(json['recoveryCount']),
      lastLapseAt: serializer.fromJson<DateTime?>(json['lastLapseAt']),
      cigarettesPerDay: serializer.fromJson<int?>(json['cigarettesPerDay']),
      cigarettesPerPack: serializer.fromJson<int?>(json['cigarettesPerPack']),
      costPerPack: serializer.fromJson<double?>(json['costPerPack']),
      ttfcMinutesIndex: serializer.fromJson<int?>(json['ttfcMinutesIndex']),
      yearsSmoking: serializer.fromJson<int?>(json['yearsSmoking']),
      reductionPlanJson: serializer.fromJson<String?>(
        json['reductionPlanJson'],
      ),
      previousQuitAttempts: serializer.fromJson<int?>(
        json['previousQuitAttempts'],
      ),
      previousAids: serializer.fromJson<List<String>?>(json['previousAids']),
      confidenceToQuit: serializer.fromJson<int?>(json['confidenceToQuit']),
      smokingWindows: serializer.fromJson<List<String>?>(
        json['smokingWindows'],
      ),
      episodesPerWeek: serializer.fromJson<int?>(json['episodesPerWeek']),
      episodeDurationMinutes: serializer.fromJson<int?>(
        json['episodeDurationMinutes'],
      ),
      pornInvolvementFlag: serializer.fromJson<bool?>(
        json['pornInvolvementFlag'],
      ),
      distressLevel: serializer.fromJson<int?>(json['distressLevel']),
      sleepEffectIndex: serializer.fromJson<int?>(json['sleepEffectIndex']),
      focusEffectIndex: serializer.fromJson<int?>(json['focusEffectIndex']),
      relationshipEffectIndex: serializer.fromJson<int?>(
        json['relationshipEffectIndex'],
      ),
      previousReductionAttempts: serializer.fromJson<int?>(
        json['previousReductionAttempts'],
      ),
      confidenceToReduce: serializer.fromJson<int?>(json['confidenceToReduce']),
      frequencyTarget: serializer.fromJson<int?>(json['frequencyTarget']),
      timeOfDayPatterns: serializer.fromJson<List<String>?>(
        json['timeOfDayPatterns'],
      ),
      values: serializer.fromJson<List<String>?>(json['values']),
      triggers: serializer.fromJson<List<String>?>(json['triggers']),
      reasons: serializer.fromJson<List<String>?>(json['reasons']),
      quitDate: serializer.fromJson<DateTime?>(json['quitDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'nickname': serializer.toJson<String?>(nickname),
      'goalType': serializer.toJson<String>(goalType),
      'modeLocked': serializer.toJson<bool>(modeLocked),
      'longestStreakDays': serializer.toJson<int>(longestStreakDays),
      'recoveryCount': serializer.toJson<int>(recoveryCount),
      'lastLapseAt': serializer.toJson<DateTime?>(lastLapseAt),
      'cigarettesPerDay': serializer.toJson<int?>(cigarettesPerDay),
      'cigarettesPerPack': serializer.toJson<int?>(cigarettesPerPack),
      'costPerPack': serializer.toJson<double?>(costPerPack),
      'ttfcMinutesIndex': serializer.toJson<int?>(ttfcMinutesIndex),
      'yearsSmoking': serializer.toJson<int?>(yearsSmoking),
      'reductionPlanJson': serializer.toJson<String?>(reductionPlanJson),
      'previousQuitAttempts': serializer.toJson<int?>(previousQuitAttempts),
      'previousAids': serializer.toJson<List<String>?>(previousAids),
      'confidenceToQuit': serializer.toJson<int?>(confidenceToQuit),
      'smokingWindows': serializer.toJson<List<String>?>(smokingWindows),
      'episodesPerWeek': serializer.toJson<int?>(episodesPerWeek),
      'episodeDurationMinutes': serializer.toJson<int?>(episodeDurationMinutes),
      'pornInvolvementFlag': serializer.toJson<bool?>(pornInvolvementFlag),
      'distressLevel': serializer.toJson<int?>(distressLevel),
      'sleepEffectIndex': serializer.toJson<int?>(sleepEffectIndex),
      'focusEffectIndex': serializer.toJson<int?>(focusEffectIndex),
      'relationshipEffectIndex': serializer.toJson<int?>(
        relationshipEffectIndex,
      ),
      'previousReductionAttempts': serializer.toJson<int?>(
        previousReductionAttempts,
      ),
      'confidenceToReduce': serializer.toJson<int?>(confidenceToReduce),
      'frequencyTarget': serializer.toJson<int?>(frequencyTarget),
      'timeOfDayPatterns': serializer.toJson<List<String>?>(timeOfDayPatterns),
      'values': serializer.toJson<List<String>?>(values),
      'triggers': serializer.toJson<List<String>?>(triggers),
      'reasons': serializer.toJson<List<String>?>(reasons),
      'quitDate': serializer.toJson<DateTime?>(quitDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  DbUserProfile copyWith({
    int? id,
    String? userId,
    Value<String?> nickname = const Value.absent(),
    String? goalType,
    bool? modeLocked,
    int? longestStreakDays,
    int? recoveryCount,
    Value<DateTime?> lastLapseAt = const Value.absent(),
    Value<int?> cigarettesPerDay = const Value.absent(),
    Value<int?> cigarettesPerPack = const Value.absent(),
    Value<double?> costPerPack = const Value.absent(),
    Value<int?> ttfcMinutesIndex = const Value.absent(),
    Value<int?> yearsSmoking = const Value.absent(),
    Value<String?> reductionPlanJson = const Value.absent(),
    Value<int?> previousQuitAttempts = const Value.absent(),
    Value<List<String>?> previousAids = const Value.absent(),
    Value<int?> confidenceToQuit = const Value.absent(),
    Value<List<String>?> smokingWindows = const Value.absent(),
    Value<int?> episodesPerWeek = const Value.absent(),
    Value<int?> episodeDurationMinutes = const Value.absent(),
    Value<bool?> pornInvolvementFlag = const Value.absent(),
    Value<int?> distressLevel = const Value.absent(),
    Value<int?> sleepEffectIndex = const Value.absent(),
    Value<int?> focusEffectIndex = const Value.absent(),
    Value<int?> relationshipEffectIndex = const Value.absent(),
    Value<int?> previousReductionAttempts = const Value.absent(),
    Value<int?> confidenceToReduce = const Value.absent(),
    Value<int?> frequencyTarget = const Value.absent(),
    Value<List<String>?> timeOfDayPatterns = const Value.absent(),
    Value<List<String>?> values = const Value.absent(),
    Value<List<String>?> triggers = const Value.absent(),
    Value<List<String>?> reasons = const Value.absent(),
    Value<DateTime?> quitDate = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => DbUserProfile(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    nickname: nickname.present ? nickname.value : this.nickname,
    goalType: goalType ?? this.goalType,
    modeLocked: modeLocked ?? this.modeLocked,
    longestStreakDays: longestStreakDays ?? this.longestStreakDays,
    recoveryCount: recoveryCount ?? this.recoveryCount,
    lastLapseAt: lastLapseAt.present ? lastLapseAt.value : this.lastLapseAt,
    cigarettesPerDay: cigarettesPerDay.present
        ? cigarettesPerDay.value
        : this.cigarettesPerDay,
    cigarettesPerPack: cigarettesPerPack.present
        ? cigarettesPerPack.value
        : this.cigarettesPerPack,
    costPerPack: costPerPack.present ? costPerPack.value : this.costPerPack,
    ttfcMinutesIndex: ttfcMinutesIndex.present
        ? ttfcMinutesIndex.value
        : this.ttfcMinutesIndex,
    yearsSmoking: yearsSmoking.present ? yearsSmoking.value : this.yearsSmoking,
    reductionPlanJson: reductionPlanJson.present
        ? reductionPlanJson.value
        : this.reductionPlanJson,
    previousQuitAttempts: previousQuitAttempts.present
        ? previousQuitAttempts.value
        : this.previousQuitAttempts,
    previousAids: previousAids.present ? previousAids.value : this.previousAids,
    confidenceToQuit: confidenceToQuit.present
        ? confidenceToQuit.value
        : this.confidenceToQuit,
    smokingWindows: smokingWindows.present
        ? smokingWindows.value
        : this.smokingWindows,
    episodesPerWeek: episodesPerWeek.present
        ? episodesPerWeek.value
        : this.episodesPerWeek,
    episodeDurationMinutes: episodeDurationMinutes.present
        ? episodeDurationMinutes.value
        : this.episodeDurationMinutes,
    pornInvolvementFlag: pornInvolvementFlag.present
        ? pornInvolvementFlag.value
        : this.pornInvolvementFlag,
    distressLevel: distressLevel.present
        ? distressLevel.value
        : this.distressLevel,
    sleepEffectIndex: sleepEffectIndex.present
        ? sleepEffectIndex.value
        : this.sleepEffectIndex,
    focusEffectIndex: focusEffectIndex.present
        ? focusEffectIndex.value
        : this.focusEffectIndex,
    relationshipEffectIndex: relationshipEffectIndex.present
        ? relationshipEffectIndex.value
        : this.relationshipEffectIndex,
    previousReductionAttempts: previousReductionAttempts.present
        ? previousReductionAttempts.value
        : this.previousReductionAttempts,
    confidenceToReduce: confidenceToReduce.present
        ? confidenceToReduce.value
        : this.confidenceToReduce,
    frequencyTarget: frequencyTarget.present
        ? frequencyTarget.value
        : this.frequencyTarget,
    timeOfDayPatterns: timeOfDayPatterns.present
        ? timeOfDayPatterns.value
        : this.timeOfDayPatterns,
    values: values.present ? values.value : this.values,
    triggers: triggers.present ? triggers.value : this.triggers,
    reasons: reasons.present ? reasons.value : this.reasons,
    quitDate: quitDate.present ? quitDate.value : this.quitDate,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbUserProfile copyWithCompanion(UserProfilesCompanion data) {
    return DbUserProfile(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      goalType: data.goalType.present ? data.goalType.value : this.goalType,
      modeLocked: data.modeLocked.present
          ? data.modeLocked.value
          : this.modeLocked,
      longestStreakDays: data.longestStreakDays.present
          ? data.longestStreakDays.value
          : this.longestStreakDays,
      recoveryCount: data.recoveryCount.present
          ? data.recoveryCount.value
          : this.recoveryCount,
      lastLapseAt: data.lastLapseAt.present
          ? data.lastLapseAt.value
          : this.lastLapseAt,
      cigarettesPerDay: data.cigarettesPerDay.present
          ? data.cigarettesPerDay.value
          : this.cigarettesPerDay,
      cigarettesPerPack: data.cigarettesPerPack.present
          ? data.cigarettesPerPack.value
          : this.cigarettesPerPack,
      costPerPack: data.costPerPack.present
          ? data.costPerPack.value
          : this.costPerPack,
      ttfcMinutesIndex: data.ttfcMinutesIndex.present
          ? data.ttfcMinutesIndex.value
          : this.ttfcMinutesIndex,
      yearsSmoking: data.yearsSmoking.present
          ? data.yearsSmoking.value
          : this.yearsSmoking,
      reductionPlanJson: data.reductionPlanJson.present
          ? data.reductionPlanJson.value
          : this.reductionPlanJson,
      previousQuitAttempts: data.previousQuitAttempts.present
          ? data.previousQuitAttempts.value
          : this.previousQuitAttempts,
      previousAids: data.previousAids.present
          ? data.previousAids.value
          : this.previousAids,
      confidenceToQuit: data.confidenceToQuit.present
          ? data.confidenceToQuit.value
          : this.confidenceToQuit,
      smokingWindows: data.smokingWindows.present
          ? data.smokingWindows.value
          : this.smokingWindows,
      episodesPerWeek: data.episodesPerWeek.present
          ? data.episodesPerWeek.value
          : this.episodesPerWeek,
      episodeDurationMinutes: data.episodeDurationMinutes.present
          ? data.episodeDurationMinutes.value
          : this.episodeDurationMinutes,
      pornInvolvementFlag: data.pornInvolvementFlag.present
          ? data.pornInvolvementFlag.value
          : this.pornInvolvementFlag,
      distressLevel: data.distressLevel.present
          ? data.distressLevel.value
          : this.distressLevel,
      sleepEffectIndex: data.sleepEffectIndex.present
          ? data.sleepEffectIndex.value
          : this.sleepEffectIndex,
      focusEffectIndex: data.focusEffectIndex.present
          ? data.focusEffectIndex.value
          : this.focusEffectIndex,
      relationshipEffectIndex: data.relationshipEffectIndex.present
          ? data.relationshipEffectIndex.value
          : this.relationshipEffectIndex,
      previousReductionAttempts: data.previousReductionAttempts.present
          ? data.previousReductionAttempts.value
          : this.previousReductionAttempts,
      confidenceToReduce: data.confidenceToReduce.present
          ? data.confidenceToReduce.value
          : this.confidenceToReduce,
      frequencyTarget: data.frequencyTarget.present
          ? data.frequencyTarget.value
          : this.frequencyTarget,
      timeOfDayPatterns: data.timeOfDayPatterns.present
          ? data.timeOfDayPatterns.value
          : this.timeOfDayPatterns,
      values: data.values.present ? data.values.value : this.values,
      triggers: data.triggers.present ? data.triggers.value : this.triggers,
      reasons: data.reasons.present ? data.reasons.value : this.reasons,
      quitDate: data.quitDate.present ? data.quitDate.value : this.quitDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbUserProfile(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('nickname: $nickname, ')
          ..write('goalType: $goalType, ')
          ..write('modeLocked: $modeLocked, ')
          ..write('longestStreakDays: $longestStreakDays, ')
          ..write('recoveryCount: $recoveryCount, ')
          ..write('lastLapseAt: $lastLapseAt, ')
          ..write('cigarettesPerDay: $cigarettesPerDay, ')
          ..write('cigarettesPerPack: $cigarettesPerPack, ')
          ..write('costPerPack: $costPerPack, ')
          ..write('ttfcMinutesIndex: $ttfcMinutesIndex, ')
          ..write('yearsSmoking: $yearsSmoking, ')
          ..write('reductionPlanJson: $reductionPlanJson, ')
          ..write('previousQuitAttempts: $previousQuitAttempts, ')
          ..write('previousAids: $previousAids, ')
          ..write('confidenceToQuit: $confidenceToQuit, ')
          ..write('smokingWindows: $smokingWindows, ')
          ..write('episodesPerWeek: $episodesPerWeek, ')
          ..write('episodeDurationMinutes: $episodeDurationMinutes, ')
          ..write('pornInvolvementFlag: $pornInvolvementFlag, ')
          ..write('distressLevel: $distressLevel, ')
          ..write('sleepEffectIndex: $sleepEffectIndex, ')
          ..write('focusEffectIndex: $focusEffectIndex, ')
          ..write('relationshipEffectIndex: $relationshipEffectIndex, ')
          ..write('previousReductionAttempts: $previousReductionAttempts, ')
          ..write('confidenceToReduce: $confidenceToReduce, ')
          ..write('frequencyTarget: $frequencyTarget, ')
          ..write('timeOfDayPatterns: $timeOfDayPatterns, ')
          ..write('values: $values, ')
          ..write('triggers: $triggers, ')
          ..write('reasons: $reasons, ')
          ..write('quitDate: $quitDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    userId,
    nickname,
    goalType,
    modeLocked,
    longestStreakDays,
    recoveryCount,
    lastLapseAt,
    cigarettesPerDay,
    cigarettesPerPack,
    costPerPack,
    ttfcMinutesIndex,
    yearsSmoking,
    reductionPlanJson,
    previousQuitAttempts,
    previousAids,
    confidenceToQuit,
    smokingWindows,
    episodesPerWeek,
    episodeDurationMinutes,
    pornInvolvementFlag,
    distressLevel,
    sleepEffectIndex,
    focusEffectIndex,
    relationshipEffectIndex,
    previousReductionAttempts,
    confidenceToReduce,
    frequencyTarget,
    timeOfDayPatterns,
    values,
    triggers,
    reasons,
    quitDate,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbUserProfile &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.nickname == this.nickname &&
          other.goalType == this.goalType &&
          other.modeLocked == this.modeLocked &&
          other.longestStreakDays == this.longestStreakDays &&
          other.recoveryCount == this.recoveryCount &&
          other.lastLapseAt == this.lastLapseAt &&
          other.cigarettesPerDay == this.cigarettesPerDay &&
          other.cigarettesPerPack == this.cigarettesPerPack &&
          other.costPerPack == this.costPerPack &&
          other.ttfcMinutesIndex == this.ttfcMinutesIndex &&
          other.yearsSmoking == this.yearsSmoking &&
          other.reductionPlanJson == this.reductionPlanJson &&
          other.previousQuitAttempts == this.previousQuitAttempts &&
          other.previousAids == this.previousAids &&
          other.confidenceToQuit == this.confidenceToQuit &&
          other.smokingWindows == this.smokingWindows &&
          other.episodesPerWeek == this.episodesPerWeek &&
          other.episodeDurationMinutes == this.episodeDurationMinutes &&
          other.pornInvolvementFlag == this.pornInvolvementFlag &&
          other.distressLevel == this.distressLevel &&
          other.sleepEffectIndex == this.sleepEffectIndex &&
          other.focusEffectIndex == this.focusEffectIndex &&
          other.relationshipEffectIndex == this.relationshipEffectIndex &&
          other.previousReductionAttempts == this.previousReductionAttempts &&
          other.confidenceToReduce == this.confidenceToReduce &&
          other.frequencyTarget == this.frequencyTarget &&
          other.timeOfDayPatterns == this.timeOfDayPatterns &&
          other.values == this.values &&
          other.triggers == this.triggers &&
          other.reasons == this.reasons &&
          other.quitDate == this.quitDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserProfilesCompanion extends UpdateCompanion<DbUserProfile> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String?> nickname;
  final Value<String> goalType;
  final Value<bool> modeLocked;
  final Value<int> longestStreakDays;
  final Value<int> recoveryCount;
  final Value<DateTime?> lastLapseAt;
  final Value<int?> cigarettesPerDay;
  final Value<int?> cigarettesPerPack;
  final Value<double?> costPerPack;
  final Value<int?> ttfcMinutesIndex;
  final Value<int?> yearsSmoking;
  final Value<String?> reductionPlanJson;
  final Value<int?> previousQuitAttempts;
  final Value<List<String>?> previousAids;
  final Value<int?> confidenceToQuit;
  final Value<List<String>?> smokingWindows;
  final Value<int?> episodesPerWeek;
  final Value<int?> episodeDurationMinutes;
  final Value<bool?> pornInvolvementFlag;
  final Value<int?> distressLevel;
  final Value<int?> sleepEffectIndex;
  final Value<int?> focusEffectIndex;
  final Value<int?> relationshipEffectIndex;
  final Value<int?> previousReductionAttempts;
  final Value<int?> confidenceToReduce;
  final Value<int?> frequencyTarget;
  final Value<List<String>?> timeOfDayPatterns;
  final Value<List<String>?> values;
  final Value<List<String>?> triggers;
  final Value<List<String>?> reasons;
  final Value<DateTime?> quitDate;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.nickname = const Value.absent(),
    this.goalType = const Value.absent(),
    this.modeLocked = const Value.absent(),
    this.longestStreakDays = const Value.absent(),
    this.recoveryCount = const Value.absent(),
    this.lastLapseAt = const Value.absent(),
    this.cigarettesPerDay = const Value.absent(),
    this.cigarettesPerPack = const Value.absent(),
    this.costPerPack = const Value.absent(),
    this.ttfcMinutesIndex = const Value.absent(),
    this.yearsSmoking = const Value.absent(),
    this.reductionPlanJson = const Value.absent(),
    this.previousQuitAttempts = const Value.absent(),
    this.previousAids = const Value.absent(),
    this.confidenceToQuit = const Value.absent(),
    this.smokingWindows = const Value.absent(),
    this.episodesPerWeek = const Value.absent(),
    this.episodeDurationMinutes = const Value.absent(),
    this.pornInvolvementFlag = const Value.absent(),
    this.distressLevel = const Value.absent(),
    this.sleepEffectIndex = const Value.absent(),
    this.focusEffectIndex = const Value.absent(),
    this.relationshipEffectIndex = const Value.absent(),
    this.previousReductionAttempts = const Value.absent(),
    this.confidenceToReduce = const Value.absent(),
    this.frequencyTarget = const Value.absent(),
    this.timeOfDayPatterns = const Value.absent(),
    this.values = const Value.absent(),
    this.triggers = const Value.absent(),
    this.reasons = const Value.absent(),
    this.quitDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    this.nickname = const Value.absent(),
    required String goalType,
    this.modeLocked = const Value.absent(),
    this.longestStreakDays = const Value.absent(),
    this.recoveryCount = const Value.absent(),
    this.lastLapseAt = const Value.absent(),
    this.cigarettesPerDay = const Value.absent(),
    this.cigarettesPerPack = const Value.absent(),
    this.costPerPack = const Value.absent(),
    this.ttfcMinutesIndex = const Value.absent(),
    this.yearsSmoking = const Value.absent(),
    this.reductionPlanJson = const Value.absent(),
    this.previousQuitAttempts = const Value.absent(),
    this.previousAids = const Value.absent(),
    this.confidenceToQuit = const Value.absent(),
    this.smokingWindows = const Value.absent(),
    this.episodesPerWeek = const Value.absent(),
    this.episodeDurationMinutes = const Value.absent(),
    this.pornInvolvementFlag = const Value.absent(),
    this.distressLevel = const Value.absent(),
    this.sleepEffectIndex = const Value.absent(),
    this.focusEffectIndex = const Value.absent(),
    this.relationshipEffectIndex = const Value.absent(),
    this.previousReductionAttempts = const Value.absent(),
    this.confidenceToReduce = const Value.absent(),
    this.frequencyTarget = const Value.absent(),
    this.timeOfDayPatterns = const Value.absent(),
    this.values = const Value.absent(),
    this.triggers = const Value.absent(),
    this.reasons = const Value.absent(),
    this.quitDate = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
  }) : userId = Value(userId),
       goalType = Value(goalType),
       createdAt = Value(createdAt);
  static Insertable<DbUserProfile> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? nickname,
    Expression<String>? goalType,
    Expression<bool>? modeLocked,
    Expression<int>? longestStreakDays,
    Expression<int>? recoveryCount,
    Expression<DateTime>? lastLapseAt,
    Expression<int>? cigarettesPerDay,
    Expression<int>? cigarettesPerPack,
    Expression<double>? costPerPack,
    Expression<int>? ttfcMinutesIndex,
    Expression<int>? yearsSmoking,
    Expression<String>? reductionPlanJson,
    Expression<int>? previousQuitAttempts,
    Expression<String>? previousAids,
    Expression<int>? confidenceToQuit,
    Expression<String>? smokingWindows,
    Expression<int>? episodesPerWeek,
    Expression<int>? episodeDurationMinutes,
    Expression<bool>? pornInvolvementFlag,
    Expression<int>? distressLevel,
    Expression<int>? sleepEffectIndex,
    Expression<int>? focusEffectIndex,
    Expression<int>? relationshipEffectIndex,
    Expression<int>? previousReductionAttempts,
    Expression<int>? confidenceToReduce,
    Expression<int>? frequencyTarget,
    Expression<String>? timeOfDayPatterns,
    Expression<String>? values,
    Expression<String>? triggers,
    Expression<String>? reasons,
    Expression<DateTime>? quitDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (nickname != null) 'nickname': nickname,
      if (goalType != null) 'goal_type': goalType,
      if (modeLocked != null) 'mode_locked': modeLocked,
      if (longestStreakDays != null) 'longest_streak_days': longestStreakDays,
      if (recoveryCount != null) 'recovery_count': recoveryCount,
      if (lastLapseAt != null) 'last_lapse_at': lastLapseAt,
      if (cigarettesPerDay != null) 'cigarettes_per_day': cigarettesPerDay,
      if (cigarettesPerPack != null) 'cigarettes_per_pack': cigarettesPerPack,
      if (costPerPack != null) 'cost_per_pack': costPerPack,
      if (ttfcMinutesIndex != null) 'ttfc_minutes_index': ttfcMinutesIndex,
      if (yearsSmoking != null) 'years_smoking': yearsSmoking,
      if (reductionPlanJson != null) 'reduction_plan_json': reductionPlanJson,
      if (previousQuitAttempts != null)
        'previous_quit_attempts': previousQuitAttempts,
      if (previousAids != null) 'previous_aids': previousAids,
      if (confidenceToQuit != null) 'confidence_to_quit': confidenceToQuit,
      if (smokingWindows != null) 'smoking_windows': smokingWindows,
      if (episodesPerWeek != null) 'episodes_per_week': episodesPerWeek,
      if (episodeDurationMinutes != null)
        'episode_duration_minutes': episodeDurationMinutes,
      if (pornInvolvementFlag != null)
        'porn_involvement_flag': pornInvolvementFlag,
      if (distressLevel != null) 'distress_level': distressLevel,
      if (sleepEffectIndex != null) 'sleep_effect_index': sleepEffectIndex,
      if (focusEffectIndex != null) 'focus_effect_index': focusEffectIndex,
      if (relationshipEffectIndex != null)
        'relationship_effect_index': relationshipEffectIndex,
      if (previousReductionAttempts != null)
        'previous_reduction_attempts': previousReductionAttempts,
      if (confidenceToReduce != null)
        'confidence_to_reduce': confidenceToReduce,
      if (frequencyTarget != null) 'frequency_target': frequencyTarget,
      if (timeOfDayPatterns != null) 'time_of_day_patterns': timeOfDayPatterns,
      if (values != null) 'values': values,
      if (triggers != null) 'triggers': triggers,
      if (reasons != null) 'reasons': reasons,
      if (quitDate != null) 'quit_date': quitDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String?>? nickname,
    Value<String>? goalType,
    Value<bool>? modeLocked,
    Value<int>? longestStreakDays,
    Value<int>? recoveryCount,
    Value<DateTime?>? lastLapseAt,
    Value<int?>? cigarettesPerDay,
    Value<int?>? cigarettesPerPack,
    Value<double?>? costPerPack,
    Value<int?>? ttfcMinutesIndex,
    Value<int?>? yearsSmoking,
    Value<String?>? reductionPlanJson,
    Value<int?>? previousQuitAttempts,
    Value<List<String>?>? previousAids,
    Value<int?>? confidenceToQuit,
    Value<List<String>?>? smokingWindows,
    Value<int?>? episodesPerWeek,
    Value<int?>? episodeDurationMinutes,
    Value<bool?>? pornInvolvementFlag,
    Value<int?>? distressLevel,
    Value<int?>? sleepEffectIndex,
    Value<int?>? focusEffectIndex,
    Value<int?>? relationshipEffectIndex,
    Value<int?>? previousReductionAttempts,
    Value<int?>? confidenceToReduce,
    Value<int?>? frequencyTarget,
    Value<List<String>?>? timeOfDayPatterns,
    Value<List<String>?>? values,
    Value<List<String>?>? triggers,
    Value<List<String>?>? reasons,
    Value<DateTime?>? quitDate,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      nickname: nickname ?? this.nickname,
      goalType: goalType ?? this.goalType,
      modeLocked: modeLocked ?? this.modeLocked,
      longestStreakDays: longestStreakDays ?? this.longestStreakDays,
      recoveryCount: recoveryCount ?? this.recoveryCount,
      lastLapseAt: lastLapseAt ?? this.lastLapseAt,
      cigarettesPerDay: cigarettesPerDay ?? this.cigarettesPerDay,
      cigarettesPerPack: cigarettesPerPack ?? this.cigarettesPerPack,
      costPerPack: costPerPack ?? this.costPerPack,
      ttfcMinutesIndex: ttfcMinutesIndex ?? this.ttfcMinutesIndex,
      yearsSmoking: yearsSmoking ?? this.yearsSmoking,
      reductionPlanJson: reductionPlanJson ?? this.reductionPlanJson,
      previousQuitAttempts: previousQuitAttempts ?? this.previousQuitAttempts,
      previousAids: previousAids ?? this.previousAids,
      confidenceToQuit: confidenceToQuit ?? this.confidenceToQuit,
      smokingWindows: smokingWindows ?? this.smokingWindows,
      episodesPerWeek: episodesPerWeek ?? this.episodesPerWeek,
      episodeDurationMinutes:
          episodeDurationMinutes ?? this.episodeDurationMinutes,
      pornInvolvementFlag: pornInvolvementFlag ?? this.pornInvolvementFlag,
      distressLevel: distressLevel ?? this.distressLevel,
      sleepEffectIndex: sleepEffectIndex ?? this.sleepEffectIndex,
      focusEffectIndex: focusEffectIndex ?? this.focusEffectIndex,
      relationshipEffectIndex:
          relationshipEffectIndex ?? this.relationshipEffectIndex,
      previousReductionAttempts:
          previousReductionAttempts ?? this.previousReductionAttempts,
      confidenceToReduce: confidenceToReduce ?? this.confidenceToReduce,
      frequencyTarget: frequencyTarget ?? this.frequencyTarget,
      timeOfDayPatterns: timeOfDayPatterns ?? this.timeOfDayPatterns,
      values: values ?? this.values,
      triggers: triggers ?? this.triggers,
      reasons: reasons ?? this.reasons,
      quitDate: quitDate ?? this.quitDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (goalType.present) {
      map['goal_type'] = Variable<String>(goalType.value);
    }
    if (modeLocked.present) {
      map['mode_locked'] = Variable<bool>(modeLocked.value);
    }
    if (longestStreakDays.present) {
      map['longest_streak_days'] = Variable<int>(longestStreakDays.value);
    }
    if (recoveryCount.present) {
      map['recovery_count'] = Variable<int>(recoveryCount.value);
    }
    if (lastLapseAt.present) {
      map['last_lapse_at'] = Variable<DateTime>(lastLapseAt.value);
    }
    if (cigarettesPerDay.present) {
      map['cigarettes_per_day'] = Variable<int>(cigarettesPerDay.value);
    }
    if (cigarettesPerPack.present) {
      map['cigarettes_per_pack'] = Variable<int>(cigarettesPerPack.value);
    }
    if (costPerPack.present) {
      map['cost_per_pack'] = Variable<double>(costPerPack.value);
    }
    if (ttfcMinutesIndex.present) {
      map['ttfc_minutes_index'] = Variable<int>(ttfcMinutesIndex.value);
    }
    if (yearsSmoking.present) {
      map['years_smoking'] = Variable<int>(yearsSmoking.value);
    }
    if (reductionPlanJson.present) {
      map['reduction_plan_json'] = Variable<String>(reductionPlanJson.value);
    }
    if (previousQuitAttempts.present) {
      map['previous_quit_attempts'] = Variable<int>(previousQuitAttempts.value);
    }
    if (previousAids.present) {
      map['previous_aids'] = Variable<String>(
        $UserProfilesTable.$converterpreviousAidsn.toSql(previousAids.value),
      );
    }
    if (confidenceToQuit.present) {
      map['confidence_to_quit'] = Variable<int>(confidenceToQuit.value);
    }
    if (smokingWindows.present) {
      map['smoking_windows'] = Variable<String>(
        $UserProfilesTable.$convertersmokingWindowsn.toSql(
          smokingWindows.value,
        ),
      );
    }
    if (episodesPerWeek.present) {
      map['episodes_per_week'] = Variable<int>(episodesPerWeek.value);
    }
    if (episodeDurationMinutes.present) {
      map['episode_duration_minutes'] = Variable<int>(
        episodeDurationMinutes.value,
      );
    }
    if (pornInvolvementFlag.present) {
      map['porn_involvement_flag'] = Variable<bool>(pornInvolvementFlag.value);
    }
    if (distressLevel.present) {
      map['distress_level'] = Variable<int>(distressLevel.value);
    }
    if (sleepEffectIndex.present) {
      map['sleep_effect_index'] = Variable<int>(sleepEffectIndex.value);
    }
    if (focusEffectIndex.present) {
      map['focus_effect_index'] = Variable<int>(focusEffectIndex.value);
    }
    if (relationshipEffectIndex.present) {
      map['relationship_effect_index'] = Variable<int>(
        relationshipEffectIndex.value,
      );
    }
    if (previousReductionAttempts.present) {
      map['previous_reduction_attempts'] = Variable<int>(
        previousReductionAttempts.value,
      );
    }
    if (confidenceToReduce.present) {
      map['confidence_to_reduce'] = Variable<int>(confidenceToReduce.value);
    }
    if (frequencyTarget.present) {
      map['frequency_target'] = Variable<int>(frequencyTarget.value);
    }
    if (timeOfDayPatterns.present) {
      map['time_of_day_patterns'] = Variable<String>(
        $UserProfilesTable.$convertertimeOfDayPatternsn.toSql(
          timeOfDayPatterns.value,
        ),
      );
    }
    if (values.present) {
      map['values'] = Variable<String>(
        $UserProfilesTable.$convertervaluesn.toSql(values.value),
      );
    }
    if (triggers.present) {
      map['triggers'] = Variable<String>(
        $UserProfilesTable.$convertertriggersn.toSql(triggers.value),
      );
    }
    if (reasons.present) {
      map['reasons'] = Variable<String>(
        $UserProfilesTable.$converterreasonsn.toSql(reasons.value),
      );
    }
    if (quitDate.present) {
      map['quit_date'] = Variable<DateTime>(quitDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('nickname: $nickname, ')
          ..write('goalType: $goalType, ')
          ..write('modeLocked: $modeLocked, ')
          ..write('longestStreakDays: $longestStreakDays, ')
          ..write('recoveryCount: $recoveryCount, ')
          ..write('lastLapseAt: $lastLapseAt, ')
          ..write('cigarettesPerDay: $cigarettesPerDay, ')
          ..write('cigarettesPerPack: $cigarettesPerPack, ')
          ..write('costPerPack: $costPerPack, ')
          ..write('ttfcMinutesIndex: $ttfcMinutesIndex, ')
          ..write('yearsSmoking: $yearsSmoking, ')
          ..write('reductionPlanJson: $reductionPlanJson, ')
          ..write('previousQuitAttempts: $previousQuitAttempts, ')
          ..write('previousAids: $previousAids, ')
          ..write('confidenceToQuit: $confidenceToQuit, ')
          ..write('smokingWindows: $smokingWindows, ')
          ..write('episodesPerWeek: $episodesPerWeek, ')
          ..write('episodeDurationMinutes: $episodeDurationMinutes, ')
          ..write('pornInvolvementFlag: $pornInvolvementFlag, ')
          ..write('distressLevel: $distressLevel, ')
          ..write('sleepEffectIndex: $sleepEffectIndex, ')
          ..write('focusEffectIndex: $focusEffectIndex, ')
          ..write('relationshipEffectIndex: $relationshipEffectIndex, ')
          ..write('previousReductionAttempts: $previousReductionAttempts, ')
          ..write('confidenceToReduce: $confidenceToReduce, ')
          ..write('frequencyTarget: $frequencyTarget, ')
          ..write('timeOfDayPatterns: $timeOfDayPatterns, ')
          ..write('values: $values, ')
          ..write('triggers: $triggers, ')
          ..write('reasons: $reasons, ')
          ..write('quitDate: $quitDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LogEntriesTable extends LogEntries
    with TableInfo<$LogEntriesTable, DbLogEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<String> mood = GeneratedColumn<String>(
    'mood',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> triggers =
      GeneratedColumn<String>(
        'triggers',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>($LogEntriesTable.$convertertriggersn);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _intensityMeta = const VerificationMeta(
    'intensity',
  );
  @override
  late final GeneratedColumn<int> intensity = GeneratedColumn<int>(
    'intensity',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _distressRatingMeta = const VerificationMeta(
    'distressRating',
  );
  @override
  late final GeneratedColumn<int> distressRating = GeneratedColumn<int>(
    'distress_rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wasResistedMeta = const VerificationMeta(
    'wasResisted',
  );
  @override
  late final GeneratedColumn<bool> wasResisted = GeneratedColumn<bool>(
    'was_resisted',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("was_resisted" IN (0, 1))',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    type,
    timestamp,
    mood,
    triggers,
    notes,
    quantity,
    durationSeconds,
    intensity,
    distressRating,
    location,
    wasResisted,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'log_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbLogEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('mood')) {
      context.handle(
        _moodMeta,
        mood.isAcceptableOrUnknown(data['mood']!, _moodMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('intensity')) {
      context.handle(
        _intensityMeta,
        intensity.isAcceptableOrUnknown(data['intensity']!, _intensityMeta),
      );
    }
    if (data.containsKey('distress_rating')) {
      context.handle(
        _distressRatingMeta,
        distressRating.isAcceptableOrUnknown(
          data['distress_rating']!,
          _distressRatingMeta,
        ),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('was_resisted')) {
      context.handle(
        _wasResistedMeta,
        wasResisted.isAcceptableOrUnknown(
          data['was_resisted']!,
          _wasResistedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbLogEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbLogEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      mood: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mood'],
      ),
      triggers: $LogEntriesTable.$convertertriggersn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}triggers'],
        ),
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      ),
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      ),
      intensity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}intensity'],
      ),
      distressRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}distress_rating'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      wasResisted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}was_resisted'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $LogEntriesTable createAlias(String alias) {
    return $LogEntriesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertriggers =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $convertertriggersn =
      NullAwareTypeConverter.wrap($convertertriggers);
}

class DbLogEntry extends DataClass implements Insertable<DbLogEntry> {
  final int id;
  final String userId;
  final String type;
  final DateTime timestamp;
  final String? mood;
  final List<String>? triggers;
  final String? notes;
  final int? quantity;
  final int? durationSeconds;
  final int? intensity;
  final int? distressRating;
  final String? location;
  final bool? wasResisted;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const DbLogEntry({
    required this.id,
    required this.userId,
    required this.type,
    required this.timestamp,
    this.mood,
    this.triggers,
    this.notes,
    this.quantity,
    this.durationSeconds,
    this.intensity,
    this.distressRating,
    this.location,
    this.wasResisted,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['type'] = Variable<String>(type);
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || mood != null) {
      map['mood'] = Variable<String>(mood);
    }
    if (!nullToAbsent || triggers != null) {
      map['triggers'] = Variable<String>(
        $LogEntriesTable.$convertertriggersn.toSql(triggers),
      );
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    if (!nullToAbsent || intensity != null) {
      map['intensity'] = Variable<int>(intensity);
    }
    if (!nullToAbsent || distressRating != null) {
      map['distress_rating'] = Variable<int>(distressRating);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || wasResisted != null) {
      map['was_resisted'] = Variable<bool>(wasResisted);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  LogEntriesCompanion toCompanion(bool nullToAbsent) {
    return LogEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      type: Value(type),
      timestamp: Value(timestamp),
      mood: mood == null && nullToAbsent ? const Value.absent() : Value(mood),
      triggers: triggers == null && nullToAbsent
          ? const Value.absent()
          : Value(triggers),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      intensity: intensity == null && nullToAbsent
          ? const Value.absent()
          : Value(intensity),
      distressRating: distressRating == null && nullToAbsent
          ? const Value.absent()
          : Value(distressRating),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      wasResisted: wasResisted == null && nullToAbsent
          ? const Value.absent()
          : Value(wasResisted),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbLogEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbLogEntry(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      type: serializer.fromJson<String>(json['type']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      mood: serializer.fromJson<String?>(json['mood']),
      triggers: serializer.fromJson<List<String>?>(json['triggers']),
      notes: serializer.fromJson<String?>(json['notes']),
      quantity: serializer.fromJson<int?>(json['quantity']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      intensity: serializer.fromJson<int?>(json['intensity']),
      distressRating: serializer.fromJson<int?>(json['distressRating']),
      location: serializer.fromJson<String?>(json['location']),
      wasResisted: serializer.fromJson<bool?>(json['wasResisted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'type': serializer.toJson<String>(type),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'mood': serializer.toJson<String?>(mood),
      'triggers': serializer.toJson<List<String>?>(triggers),
      'notes': serializer.toJson<String?>(notes),
      'quantity': serializer.toJson<int?>(quantity),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'intensity': serializer.toJson<int?>(intensity),
      'distressRating': serializer.toJson<int?>(distressRating),
      'location': serializer.toJson<String?>(location),
      'wasResisted': serializer.toJson<bool?>(wasResisted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  DbLogEntry copyWith({
    int? id,
    String? userId,
    String? type,
    DateTime? timestamp,
    Value<String?> mood = const Value.absent(),
    Value<List<String>?> triggers = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<int?> quantity = const Value.absent(),
    Value<int?> durationSeconds = const Value.absent(),
    Value<int?> intensity = const Value.absent(),
    Value<int?> distressRating = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<bool?> wasResisted = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => DbLogEntry(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    type: type ?? this.type,
    timestamp: timestamp ?? this.timestamp,
    mood: mood.present ? mood.value : this.mood,
    triggers: triggers.present ? triggers.value : this.triggers,
    notes: notes.present ? notes.value : this.notes,
    quantity: quantity.present ? quantity.value : this.quantity,
    durationSeconds: durationSeconds.present
        ? durationSeconds.value
        : this.durationSeconds,
    intensity: intensity.present ? intensity.value : this.intensity,
    distressRating: distressRating.present
        ? distressRating.value
        : this.distressRating,
    location: location.present ? location.value : this.location,
    wasResisted: wasResisted.present ? wasResisted.value : this.wasResisted,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbLogEntry copyWithCompanion(LogEntriesCompanion data) {
    return DbLogEntry(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      mood: data.mood.present ? data.mood.value : this.mood,
      triggers: data.triggers.present ? data.triggers.value : this.triggers,
      notes: data.notes.present ? data.notes.value : this.notes,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      intensity: data.intensity.present ? data.intensity.value : this.intensity,
      distressRating: data.distressRating.present
          ? data.distressRating.value
          : this.distressRating,
      location: data.location.present ? data.location.value : this.location,
      wasResisted: data.wasResisted.present
          ? data.wasResisted.value
          : this.wasResisted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbLogEntry(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('mood: $mood, ')
          ..write('triggers: $triggers, ')
          ..write('notes: $notes, ')
          ..write('quantity: $quantity, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('intensity: $intensity, ')
          ..write('distressRating: $distressRating, ')
          ..write('location: $location, ')
          ..write('wasResisted: $wasResisted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    type,
    timestamp,
    mood,
    triggers,
    notes,
    quantity,
    durationSeconds,
    intensity,
    distressRating,
    location,
    wasResisted,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbLogEntry &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.timestamp == this.timestamp &&
          other.mood == this.mood &&
          other.triggers == this.triggers &&
          other.notes == this.notes &&
          other.quantity == this.quantity &&
          other.durationSeconds == this.durationSeconds &&
          other.intensity == this.intensity &&
          other.distressRating == this.distressRating &&
          other.location == this.location &&
          other.wasResisted == this.wasResisted &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LogEntriesCompanion extends UpdateCompanion<DbLogEntry> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> type;
  final Value<DateTime> timestamp;
  final Value<String?> mood;
  final Value<List<String>?> triggers;
  final Value<String?> notes;
  final Value<int?> quantity;
  final Value<int?> durationSeconds;
  final Value<int?> intensity;
  final Value<int?> distressRating;
  final Value<String?> location;
  final Value<bool?> wasResisted;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const LogEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.mood = const Value.absent(),
    this.triggers = const Value.absent(),
    this.notes = const Value.absent(),
    this.quantity = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.intensity = const Value.absent(),
    this.distressRating = const Value.absent(),
    this.location = const Value.absent(),
    this.wasResisted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  LogEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String type,
    required DateTime timestamp,
    this.mood = const Value.absent(),
    this.triggers = const Value.absent(),
    this.notes = const Value.absent(),
    this.quantity = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.intensity = const Value.absent(),
    this.distressRating = const Value.absent(),
    this.location = const Value.absent(),
    this.wasResisted = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
  }) : userId = Value(userId),
       type = Value(type),
       timestamp = Value(timestamp),
       createdAt = Value(createdAt);
  static Insertable<DbLogEntry> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? type,
    Expression<DateTime>? timestamp,
    Expression<String>? mood,
    Expression<String>? triggers,
    Expression<String>? notes,
    Expression<int>? quantity,
    Expression<int>? durationSeconds,
    Expression<int>? intensity,
    Expression<int>? distressRating,
    Expression<String>? location,
    Expression<bool>? wasResisted,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (timestamp != null) 'timestamp': timestamp,
      if (mood != null) 'mood': mood,
      if (triggers != null) 'triggers': triggers,
      if (notes != null) 'notes': notes,
      if (quantity != null) 'quantity': quantity,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (intensity != null) 'intensity': intensity,
      if (distressRating != null) 'distress_rating': distressRating,
      if (location != null) 'location': location,
      if (wasResisted != null) 'was_resisted': wasResisted,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  LogEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? type,
    Value<DateTime>? timestamp,
    Value<String?>? mood,
    Value<List<String>?>? triggers,
    Value<String?>? notes,
    Value<int?>? quantity,
    Value<int?>? durationSeconds,
    Value<int?>? intensity,
    Value<int?>? distressRating,
    Value<String?>? location,
    Value<bool?>? wasResisted,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return LogEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      mood: mood ?? this.mood,
      triggers: triggers ?? this.triggers,
      notes: notes ?? this.notes,
      quantity: quantity ?? this.quantity,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      intensity: intensity ?? this.intensity,
      distressRating: distressRating ?? this.distressRating,
      location: location ?? this.location,
      wasResisted: wasResisted ?? this.wasResisted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (mood.present) {
      map['mood'] = Variable<String>(mood.value);
    }
    if (triggers.present) {
      map['triggers'] = Variable<String>(
        $LogEntriesTable.$convertertriggersn.toSql(triggers.value),
      );
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (intensity.present) {
      map['intensity'] = Variable<int>(intensity.value);
    }
    if (distressRating.present) {
      map['distress_rating'] = Variable<int>(distressRating.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (wasResisted.present) {
      map['was_resisted'] = Variable<bool>(wasResisted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('mood: $mood, ')
          ..write('triggers: $triggers, ')
          ..write('notes: $notes, ')
          ..write('quantity: $quantity, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('intensity: $intensity, ')
          ..write('distressRating: $distressRating, ')
          ..write('location: $location, ')
          ..write('wasResisted: $wasResisted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CravingEntriesTable extends CravingEntries
    with TableInfo<$CravingEntriesTable, DbCravingEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CravingEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _initialIntensityMeta = const VerificationMeta(
    'initialIntensity',
  );
  @override
  late final GeneratedColumn<String> initialIntensity = GeneratedColumn<String>(
    'initial_intensity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finalIntensityMeta = const VerificationMeta(
    'finalIntensity',
  );
  @override
  late final GeneratedColumn<String> finalIntensity = GeneratedColumn<String>(
    'final_intensity',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _outcomeMeta = const VerificationMeta(
    'outcome',
  );
  @override
  late final GeneratedColumn<String> outcome = GeneratedColumn<String>(
    'outcome',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> triggers =
      GeneratedColumn<String>(
        'triggers',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>($CravingEntriesTable.$convertertriggersn);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  copingStrategiesUsed =
      GeneratedColumn<String>(
        'coping_strategies_used',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>(
        $CravingEntriesTable.$convertercopingStrategiesUsedn,
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    startTime,
    endTime,
    initialIntensity,
    finalIntensity,
    outcome,
    triggers,
    copingStrategiesUsed,
    notes,
    location,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'craving_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbCravingEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('initial_intensity')) {
      context.handle(
        _initialIntensityMeta,
        initialIntensity.isAcceptableOrUnknown(
          data['initial_intensity']!,
          _initialIntensityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_initialIntensityMeta);
    }
    if (data.containsKey('final_intensity')) {
      context.handle(
        _finalIntensityMeta,
        finalIntensity.isAcceptableOrUnknown(
          data['final_intensity']!,
          _finalIntensityMeta,
        ),
      );
    }
    if (data.containsKey('outcome')) {
      context.handle(
        _outcomeMeta,
        outcome.isAcceptableOrUnknown(data['outcome']!, _outcomeMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbCravingEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbCravingEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      ),
      initialIntensity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}initial_intensity'],
      )!,
      finalIntensity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}final_intensity'],
      ),
      outcome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outcome'],
      ),
      triggers: $CravingEntriesTable.$convertertriggersn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}triggers'],
        ),
      ),
      copingStrategiesUsed: $CravingEntriesTable.$convertercopingStrategiesUsedn
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}coping_strategies_used'],
            ),
          ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $CravingEntriesTable createAlias(String alias) {
    return $CravingEntriesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertriggers =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $convertertriggersn =
      NullAwareTypeConverter.wrap($convertertriggers);
  static TypeConverter<List<String>, String> $convertercopingStrategiesUsed =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $convertercopingStrategiesUsedn =
      NullAwareTypeConverter.wrap($convertercopingStrategiesUsed);
}

class DbCravingEntry extends DataClass implements Insertable<DbCravingEntry> {
  final int id;
  final String userId;
  final DateTime startTime;
  final DateTime? endTime;
  final String initialIntensity;
  final String? finalIntensity;
  final String? outcome;
  final List<String>? triggers;
  final List<String>? copingStrategiesUsed;
  final String? notes;
  final String? location;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const DbCravingEntry({
    required this.id,
    required this.userId,
    required this.startTime,
    this.endTime,
    required this.initialIntensity,
    this.finalIntensity,
    this.outcome,
    this.triggers,
    this.copingStrategiesUsed,
    this.notes,
    this.location,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    map['initial_intensity'] = Variable<String>(initialIntensity);
    if (!nullToAbsent || finalIntensity != null) {
      map['final_intensity'] = Variable<String>(finalIntensity);
    }
    if (!nullToAbsent || outcome != null) {
      map['outcome'] = Variable<String>(outcome);
    }
    if (!nullToAbsent || triggers != null) {
      map['triggers'] = Variable<String>(
        $CravingEntriesTable.$convertertriggersn.toSql(triggers),
      );
    }
    if (!nullToAbsent || copingStrategiesUsed != null) {
      map['coping_strategies_used'] = Variable<String>(
        $CravingEntriesTable.$convertercopingStrategiesUsedn.toSql(
          copingStrategiesUsed,
        ),
      );
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  CravingEntriesCompanion toCompanion(bool nullToAbsent) {
    return CravingEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      initialIntensity: Value(initialIntensity),
      finalIntensity: finalIntensity == null && nullToAbsent
          ? const Value.absent()
          : Value(finalIntensity),
      outcome: outcome == null && nullToAbsent
          ? const Value.absent()
          : Value(outcome),
      triggers: triggers == null && nullToAbsent
          ? const Value.absent()
          : Value(triggers),
      copingStrategiesUsed: copingStrategiesUsed == null && nullToAbsent
          ? const Value.absent()
          : Value(copingStrategiesUsed),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbCravingEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbCravingEntry(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      initialIntensity: serializer.fromJson<String>(json['initialIntensity']),
      finalIntensity: serializer.fromJson<String?>(json['finalIntensity']),
      outcome: serializer.fromJson<String?>(json['outcome']),
      triggers: serializer.fromJson<List<String>?>(json['triggers']),
      copingStrategiesUsed: serializer.fromJson<List<String>?>(
        json['copingStrategiesUsed'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
      location: serializer.fromJson<String?>(json['location']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'initialIntensity': serializer.toJson<String>(initialIntensity),
      'finalIntensity': serializer.toJson<String?>(finalIntensity),
      'outcome': serializer.toJson<String?>(outcome),
      'triggers': serializer.toJson<List<String>?>(triggers),
      'copingStrategiesUsed': serializer.toJson<List<String>?>(
        copingStrategiesUsed,
      ),
      'notes': serializer.toJson<String?>(notes),
      'location': serializer.toJson<String?>(location),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  DbCravingEntry copyWith({
    int? id,
    String? userId,
    DateTime? startTime,
    Value<DateTime?> endTime = const Value.absent(),
    String? initialIntensity,
    Value<String?> finalIntensity = const Value.absent(),
    Value<String?> outcome = const Value.absent(),
    Value<List<String>?> triggers = const Value.absent(),
    Value<List<String>?> copingStrategiesUsed = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> location = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => DbCravingEntry(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    startTime: startTime ?? this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    initialIntensity: initialIntensity ?? this.initialIntensity,
    finalIntensity: finalIntensity.present
        ? finalIntensity.value
        : this.finalIntensity,
    outcome: outcome.present ? outcome.value : this.outcome,
    triggers: triggers.present ? triggers.value : this.triggers,
    copingStrategiesUsed: copingStrategiesUsed.present
        ? copingStrategiesUsed.value
        : this.copingStrategiesUsed,
    notes: notes.present ? notes.value : this.notes,
    location: location.present ? location.value : this.location,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbCravingEntry copyWithCompanion(CravingEntriesCompanion data) {
    return DbCravingEntry(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      initialIntensity: data.initialIntensity.present
          ? data.initialIntensity.value
          : this.initialIntensity,
      finalIntensity: data.finalIntensity.present
          ? data.finalIntensity.value
          : this.finalIntensity,
      outcome: data.outcome.present ? data.outcome.value : this.outcome,
      triggers: data.triggers.present ? data.triggers.value : this.triggers,
      copingStrategiesUsed: data.copingStrategiesUsed.present
          ? data.copingStrategiesUsed.value
          : this.copingStrategiesUsed,
      notes: data.notes.present ? data.notes.value : this.notes,
      location: data.location.present ? data.location.value : this.location,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbCravingEntry(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('initialIntensity: $initialIntensity, ')
          ..write('finalIntensity: $finalIntensity, ')
          ..write('outcome: $outcome, ')
          ..write('triggers: $triggers, ')
          ..write('copingStrategiesUsed: $copingStrategiesUsed, ')
          ..write('notes: $notes, ')
          ..write('location: $location, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    startTime,
    endTime,
    initialIntensity,
    finalIntensity,
    outcome,
    triggers,
    copingStrategiesUsed,
    notes,
    location,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbCravingEntry &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.initialIntensity == this.initialIntensity &&
          other.finalIntensity == this.finalIntensity &&
          other.outcome == this.outcome &&
          other.triggers == this.triggers &&
          other.copingStrategiesUsed == this.copingStrategiesUsed &&
          other.notes == this.notes &&
          other.location == this.location &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CravingEntriesCompanion extends UpdateCompanion<DbCravingEntry> {
  final Value<int> id;
  final Value<String> userId;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<String> initialIntensity;
  final Value<String?> finalIntensity;
  final Value<String?> outcome;
  final Value<List<String>?> triggers;
  final Value<List<String>?> copingStrategiesUsed;
  final Value<String?> notes;
  final Value<String?> location;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const CravingEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.initialIntensity = const Value.absent(),
    this.finalIntensity = const Value.absent(),
    this.outcome = const Value.absent(),
    this.triggers = const Value.absent(),
    this.copingStrategiesUsed = const Value.absent(),
    this.notes = const Value.absent(),
    this.location = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CravingEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required DateTime startTime,
    this.endTime = const Value.absent(),
    required String initialIntensity,
    this.finalIntensity = const Value.absent(),
    this.outcome = const Value.absent(),
    this.triggers = const Value.absent(),
    this.copingStrategiesUsed = const Value.absent(),
    this.notes = const Value.absent(),
    this.location = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
  }) : userId = Value(userId),
       startTime = Value(startTime),
       initialIntensity = Value(initialIntensity),
       createdAt = Value(createdAt);
  static Insertable<DbCravingEntry> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? initialIntensity,
    Expression<String>? finalIntensity,
    Expression<String>? outcome,
    Expression<String>? triggers,
    Expression<String>? copingStrategiesUsed,
    Expression<String>? notes,
    Expression<String>? location,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (initialIntensity != null) 'initial_intensity': initialIntensity,
      if (finalIntensity != null) 'final_intensity': finalIntensity,
      if (outcome != null) 'outcome': outcome,
      if (triggers != null) 'triggers': triggers,
      if (copingStrategiesUsed != null)
        'coping_strategies_used': copingStrategiesUsed,
      if (notes != null) 'notes': notes,
      if (location != null) 'location': location,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CravingEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<DateTime>? startTime,
    Value<DateTime?>? endTime,
    Value<String>? initialIntensity,
    Value<String?>? finalIntensity,
    Value<String?>? outcome,
    Value<List<String>?>? triggers,
    Value<List<String>?>? copingStrategiesUsed,
    Value<String?>? notes,
    Value<String?>? location,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return CravingEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      initialIntensity: initialIntensity ?? this.initialIntensity,
      finalIntensity: finalIntensity ?? this.finalIntensity,
      outcome: outcome ?? this.outcome,
      triggers: triggers ?? this.triggers,
      copingStrategiesUsed: copingStrategiesUsed ?? this.copingStrategiesUsed,
      notes: notes ?? this.notes,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (initialIntensity.present) {
      map['initial_intensity'] = Variable<String>(initialIntensity.value);
    }
    if (finalIntensity.present) {
      map['final_intensity'] = Variable<String>(finalIntensity.value);
    }
    if (outcome.present) {
      map['outcome'] = Variable<String>(outcome.value);
    }
    if (triggers.present) {
      map['triggers'] = Variable<String>(
        $CravingEntriesTable.$convertertriggersn.toSql(triggers.value),
      );
    }
    if (copingStrategiesUsed.present) {
      map['coping_strategies_used'] = Variable<String>(
        $CravingEntriesTable.$convertercopingStrategiesUsedn.toSql(
          copingStrategiesUsed.value,
        ),
      );
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CravingEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('initialIntensity: $initialIntensity, ')
          ..write('finalIntensity: $finalIntensity, ')
          ..write('outcome: $outcome, ')
          ..write('triggers: $triggers, ')
          ..write('copingStrategiesUsed: $copingStrategiesUsed, ')
          ..write('notes: $notes, ')
          ..write('location: $location, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $WeeklyReviewsTable extends WeeklyReviews
    with TableInfo<$WeeklyReviewsTable, DbWeeklyReview> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeeklyReviewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekStartMeta = const VerificationMeta(
    'weekStart',
  );
  @override
  late final GeneratedColumn<DateTime> weekStart = GeneratedColumn<DateTime>(
    'week_start',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checkInsCountMeta = const VerificationMeta(
    'checkInsCount',
  );
  @override
  late final GeneratedColumn<int> checkInsCount = GeneratedColumn<int>(
    'check_ins_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toolkitSessionsCountMeta =
      const VerificationMeta('toolkitSessionsCount');
  @override
  late final GeneratedColumn<int> toolkitSessionsCount = GeneratedColumn<int>(
    'toolkit_sessions_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cravingsResistedMeta = const VerificationMeta(
    'cravingsResisted',
  );
  @override
  late final GeneratedColumn<int> cravingsResisted = GeneratedColumn<int>(
    'cravings_resisted',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lapseEventsMeta = const VerificationMeta(
    'lapseEvents',
  );
  @override
  late final GeneratedColumn<int> lapseEvents = GeneratedColumn<int>(
    'lapse_events',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topTriggerMeta = const VerificationMeta(
    'topTrigger',
  );
  @override
  late final GeneratedColumn<String> topTrigger = GeneratedColumn<String>(
    'top_trigger',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mostUsedExerciseMeta = const VerificationMeta(
    'mostUsedExercise',
  );
  @override
  late final GeneratedColumn<String> mostUsedExercise = GeneratedColumn<String>(
    'most_used_exercise',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _motivationalSummaryMeta =
      const VerificationMeta('motivationalSummary');
  @override
  late final GeneratedColumn<String> motivationalSummary =
      GeneratedColumn<String>(
        'motivational_summary',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _generatedAtMeta = const VerificationMeta(
    'generatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
    'generated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    weekStart,
    checkInsCount,
    toolkitSessionsCount,
    cravingsResisted,
    lapseEvents,
    topTrigger,
    mostUsedExercise,
    motivationalSummary,
    generatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weekly_reviews';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbWeeklyReview> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('week_start')) {
      context.handle(
        _weekStartMeta,
        weekStart.isAcceptableOrUnknown(data['week_start']!, _weekStartMeta),
      );
    } else if (isInserting) {
      context.missing(_weekStartMeta);
    }
    if (data.containsKey('check_ins_count')) {
      context.handle(
        _checkInsCountMeta,
        checkInsCount.isAcceptableOrUnknown(
          data['check_ins_count']!,
          _checkInsCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_checkInsCountMeta);
    }
    if (data.containsKey('toolkit_sessions_count')) {
      context.handle(
        _toolkitSessionsCountMeta,
        toolkitSessionsCount.isAcceptableOrUnknown(
          data['toolkit_sessions_count']!,
          _toolkitSessionsCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_toolkitSessionsCountMeta);
    }
    if (data.containsKey('cravings_resisted')) {
      context.handle(
        _cravingsResistedMeta,
        cravingsResisted.isAcceptableOrUnknown(
          data['cravings_resisted']!,
          _cravingsResistedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cravingsResistedMeta);
    }
    if (data.containsKey('lapse_events')) {
      context.handle(
        _lapseEventsMeta,
        lapseEvents.isAcceptableOrUnknown(
          data['lapse_events']!,
          _lapseEventsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lapseEventsMeta);
    }
    if (data.containsKey('top_trigger')) {
      context.handle(
        _topTriggerMeta,
        topTrigger.isAcceptableOrUnknown(data['top_trigger']!, _topTriggerMeta),
      );
    }
    if (data.containsKey('most_used_exercise')) {
      context.handle(
        _mostUsedExerciseMeta,
        mostUsedExercise.isAcceptableOrUnknown(
          data['most_used_exercise']!,
          _mostUsedExerciseMeta,
        ),
      );
    }
    if (data.containsKey('motivational_summary')) {
      context.handle(
        _motivationalSummaryMeta,
        motivationalSummary.isAcceptableOrUnknown(
          data['motivational_summary']!,
          _motivationalSummaryMeta,
        ),
      );
    }
    if (data.containsKey('generated_at')) {
      context.handle(
        _generatedAtMeta,
        generatedAt.isAcceptableOrUnknown(
          data['generated_at']!,
          _generatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbWeeklyReview map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbWeeklyReview(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      weekStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}week_start'],
      )!,
      checkInsCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}check_ins_count'],
      )!,
      toolkitSessionsCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}toolkit_sessions_count'],
      )!,
      cravingsResisted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cravings_resisted'],
      )!,
      lapseEvents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lapse_events'],
      )!,
      topTrigger: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}top_trigger'],
      ),
      mostUsedExercise: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}most_used_exercise'],
      ),
      motivationalSummary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}motivational_summary'],
      ),
      generatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}generated_at'],
      )!,
    );
  }

  @override
  $WeeklyReviewsTable createAlias(String alias) {
    return $WeeklyReviewsTable(attachedDatabase, alias);
  }
}

class DbWeeklyReview extends DataClass implements Insertable<DbWeeklyReview> {
  final int id;
  final String userId;
  final DateTime weekStart;
  final int checkInsCount;
  final int toolkitSessionsCount;
  final int cravingsResisted;
  final int lapseEvents;
  final String? topTrigger;
  final String? mostUsedExercise;
  final String? motivationalSummary;
  final DateTime generatedAt;
  const DbWeeklyReview({
    required this.id,
    required this.userId,
    required this.weekStart,
    required this.checkInsCount,
    required this.toolkitSessionsCount,
    required this.cravingsResisted,
    required this.lapseEvents,
    this.topTrigger,
    this.mostUsedExercise,
    this.motivationalSummary,
    required this.generatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['week_start'] = Variable<DateTime>(weekStart);
    map['check_ins_count'] = Variable<int>(checkInsCount);
    map['toolkit_sessions_count'] = Variable<int>(toolkitSessionsCount);
    map['cravings_resisted'] = Variable<int>(cravingsResisted);
    map['lapse_events'] = Variable<int>(lapseEvents);
    if (!nullToAbsent || topTrigger != null) {
      map['top_trigger'] = Variable<String>(topTrigger);
    }
    if (!nullToAbsent || mostUsedExercise != null) {
      map['most_used_exercise'] = Variable<String>(mostUsedExercise);
    }
    if (!nullToAbsent || motivationalSummary != null) {
      map['motivational_summary'] = Variable<String>(motivationalSummary);
    }
    map['generated_at'] = Variable<DateTime>(generatedAt);
    return map;
  }

  WeeklyReviewsCompanion toCompanion(bool nullToAbsent) {
    return WeeklyReviewsCompanion(
      id: Value(id),
      userId: Value(userId),
      weekStart: Value(weekStart),
      checkInsCount: Value(checkInsCount),
      toolkitSessionsCount: Value(toolkitSessionsCount),
      cravingsResisted: Value(cravingsResisted),
      lapseEvents: Value(lapseEvents),
      topTrigger: topTrigger == null && nullToAbsent
          ? const Value.absent()
          : Value(topTrigger),
      mostUsedExercise: mostUsedExercise == null && nullToAbsent
          ? const Value.absent()
          : Value(mostUsedExercise),
      motivationalSummary: motivationalSummary == null && nullToAbsent
          ? const Value.absent()
          : Value(motivationalSummary),
      generatedAt: Value(generatedAt),
    );
  }

  factory DbWeeklyReview.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbWeeklyReview(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      weekStart: serializer.fromJson<DateTime>(json['weekStart']),
      checkInsCount: serializer.fromJson<int>(json['checkInsCount']),
      toolkitSessionsCount: serializer.fromJson<int>(
        json['toolkitSessionsCount'],
      ),
      cravingsResisted: serializer.fromJson<int>(json['cravingsResisted']),
      lapseEvents: serializer.fromJson<int>(json['lapseEvents']),
      topTrigger: serializer.fromJson<String?>(json['topTrigger']),
      mostUsedExercise: serializer.fromJson<String?>(json['mostUsedExercise']),
      motivationalSummary: serializer.fromJson<String?>(
        json['motivationalSummary'],
      ),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'weekStart': serializer.toJson<DateTime>(weekStart),
      'checkInsCount': serializer.toJson<int>(checkInsCount),
      'toolkitSessionsCount': serializer.toJson<int>(toolkitSessionsCount),
      'cravingsResisted': serializer.toJson<int>(cravingsResisted),
      'lapseEvents': serializer.toJson<int>(lapseEvents),
      'topTrigger': serializer.toJson<String?>(topTrigger),
      'mostUsedExercise': serializer.toJson<String?>(mostUsedExercise),
      'motivationalSummary': serializer.toJson<String?>(motivationalSummary),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
    };
  }

  DbWeeklyReview copyWith({
    int? id,
    String? userId,
    DateTime? weekStart,
    int? checkInsCount,
    int? toolkitSessionsCount,
    int? cravingsResisted,
    int? lapseEvents,
    Value<String?> topTrigger = const Value.absent(),
    Value<String?> mostUsedExercise = const Value.absent(),
    Value<String?> motivationalSummary = const Value.absent(),
    DateTime? generatedAt,
  }) => DbWeeklyReview(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    weekStart: weekStart ?? this.weekStart,
    checkInsCount: checkInsCount ?? this.checkInsCount,
    toolkitSessionsCount: toolkitSessionsCount ?? this.toolkitSessionsCount,
    cravingsResisted: cravingsResisted ?? this.cravingsResisted,
    lapseEvents: lapseEvents ?? this.lapseEvents,
    topTrigger: topTrigger.present ? topTrigger.value : this.topTrigger,
    mostUsedExercise: mostUsedExercise.present
        ? mostUsedExercise.value
        : this.mostUsedExercise,
    motivationalSummary: motivationalSummary.present
        ? motivationalSummary.value
        : this.motivationalSummary,
    generatedAt: generatedAt ?? this.generatedAt,
  );
  DbWeeklyReview copyWithCompanion(WeeklyReviewsCompanion data) {
    return DbWeeklyReview(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      weekStart: data.weekStart.present ? data.weekStart.value : this.weekStart,
      checkInsCount: data.checkInsCount.present
          ? data.checkInsCount.value
          : this.checkInsCount,
      toolkitSessionsCount: data.toolkitSessionsCount.present
          ? data.toolkitSessionsCount.value
          : this.toolkitSessionsCount,
      cravingsResisted: data.cravingsResisted.present
          ? data.cravingsResisted.value
          : this.cravingsResisted,
      lapseEvents: data.lapseEvents.present
          ? data.lapseEvents.value
          : this.lapseEvents,
      topTrigger: data.topTrigger.present
          ? data.topTrigger.value
          : this.topTrigger,
      mostUsedExercise: data.mostUsedExercise.present
          ? data.mostUsedExercise.value
          : this.mostUsedExercise,
      motivationalSummary: data.motivationalSummary.present
          ? data.motivationalSummary.value
          : this.motivationalSummary,
      generatedAt: data.generatedAt.present
          ? data.generatedAt.value
          : this.generatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbWeeklyReview(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('weekStart: $weekStart, ')
          ..write('checkInsCount: $checkInsCount, ')
          ..write('toolkitSessionsCount: $toolkitSessionsCount, ')
          ..write('cravingsResisted: $cravingsResisted, ')
          ..write('lapseEvents: $lapseEvents, ')
          ..write('topTrigger: $topTrigger, ')
          ..write('mostUsedExercise: $mostUsedExercise, ')
          ..write('motivationalSummary: $motivationalSummary, ')
          ..write('generatedAt: $generatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    weekStart,
    checkInsCount,
    toolkitSessionsCount,
    cravingsResisted,
    lapseEvents,
    topTrigger,
    mostUsedExercise,
    motivationalSummary,
    generatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWeeklyReview &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.weekStart == this.weekStart &&
          other.checkInsCount == this.checkInsCount &&
          other.toolkitSessionsCount == this.toolkitSessionsCount &&
          other.cravingsResisted == this.cravingsResisted &&
          other.lapseEvents == this.lapseEvents &&
          other.topTrigger == this.topTrigger &&
          other.mostUsedExercise == this.mostUsedExercise &&
          other.motivationalSummary == this.motivationalSummary &&
          other.generatedAt == this.generatedAt);
}

class WeeklyReviewsCompanion extends UpdateCompanion<DbWeeklyReview> {
  final Value<int> id;
  final Value<String> userId;
  final Value<DateTime> weekStart;
  final Value<int> checkInsCount;
  final Value<int> toolkitSessionsCount;
  final Value<int> cravingsResisted;
  final Value<int> lapseEvents;
  final Value<String?> topTrigger;
  final Value<String?> mostUsedExercise;
  final Value<String?> motivationalSummary;
  final Value<DateTime> generatedAt;
  const WeeklyReviewsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.weekStart = const Value.absent(),
    this.checkInsCount = const Value.absent(),
    this.toolkitSessionsCount = const Value.absent(),
    this.cravingsResisted = const Value.absent(),
    this.lapseEvents = const Value.absent(),
    this.topTrigger = const Value.absent(),
    this.mostUsedExercise = const Value.absent(),
    this.motivationalSummary = const Value.absent(),
    this.generatedAt = const Value.absent(),
  });
  WeeklyReviewsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required DateTime weekStart,
    required int checkInsCount,
    required int toolkitSessionsCount,
    required int cravingsResisted,
    required int lapseEvents,
    this.topTrigger = const Value.absent(),
    this.mostUsedExercise = const Value.absent(),
    this.motivationalSummary = const Value.absent(),
    required DateTime generatedAt,
  }) : userId = Value(userId),
       weekStart = Value(weekStart),
       checkInsCount = Value(checkInsCount),
       toolkitSessionsCount = Value(toolkitSessionsCount),
       cravingsResisted = Value(cravingsResisted),
       lapseEvents = Value(lapseEvents),
       generatedAt = Value(generatedAt);
  static Insertable<DbWeeklyReview> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<DateTime>? weekStart,
    Expression<int>? checkInsCount,
    Expression<int>? toolkitSessionsCount,
    Expression<int>? cravingsResisted,
    Expression<int>? lapseEvents,
    Expression<String>? topTrigger,
    Expression<String>? mostUsedExercise,
    Expression<String>? motivationalSummary,
    Expression<DateTime>? generatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (weekStart != null) 'week_start': weekStart,
      if (checkInsCount != null) 'check_ins_count': checkInsCount,
      if (toolkitSessionsCount != null)
        'toolkit_sessions_count': toolkitSessionsCount,
      if (cravingsResisted != null) 'cravings_resisted': cravingsResisted,
      if (lapseEvents != null) 'lapse_events': lapseEvents,
      if (topTrigger != null) 'top_trigger': topTrigger,
      if (mostUsedExercise != null) 'most_used_exercise': mostUsedExercise,
      if (motivationalSummary != null)
        'motivational_summary': motivationalSummary,
      if (generatedAt != null) 'generated_at': generatedAt,
    });
  }

  WeeklyReviewsCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<DateTime>? weekStart,
    Value<int>? checkInsCount,
    Value<int>? toolkitSessionsCount,
    Value<int>? cravingsResisted,
    Value<int>? lapseEvents,
    Value<String?>? topTrigger,
    Value<String?>? mostUsedExercise,
    Value<String?>? motivationalSummary,
    Value<DateTime>? generatedAt,
  }) {
    return WeeklyReviewsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      weekStart: weekStart ?? this.weekStart,
      checkInsCount: checkInsCount ?? this.checkInsCount,
      toolkitSessionsCount: toolkitSessionsCount ?? this.toolkitSessionsCount,
      cravingsResisted: cravingsResisted ?? this.cravingsResisted,
      lapseEvents: lapseEvents ?? this.lapseEvents,
      topTrigger: topTrigger ?? this.topTrigger,
      mostUsedExercise: mostUsedExercise ?? this.mostUsedExercise,
      motivationalSummary: motivationalSummary ?? this.motivationalSummary,
      generatedAt: generatedAt ?? this.generatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (weekStart.present) {
      map['week_start'] = Variable<DateTime>(weekStart.value);
    }
    if (checkInsCount.present) {
      map['check_ins_count'] = Variable<int>(checkInsCount.value);
    }
    if (toolkitSessionsCount.present) {
      map['toolkit_sessions_count'] = Variable<int>(toolkitSessionsCount.value);
    }
    if (cravingsResisted.present) {
      map['cravings_resisted'] = Variable<int>(cravingsResisted.value);
    }
    if (lapseEvents.present) {
      map['lapse_events'] = Variable<int>(lapseEvents.value);
    }
    if (topTrigger.present) {
      map['top_trigger'] = Variable<String>(topTrigger.value);
    }
    if (mostUsedExercise.present) {
      map['most_used_exercise'] = Variable<String>(mostUsedExercise.value);
    }
    if (motivationalSummary.present) {
      map['motivational_summary'] = Variable<String>(motivationalSummary.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyReviewsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('weekStart: $weekStart, ')
          ..write('checkInsCount: $checkInsCount, ')
          ..write('toolkitSessionsCount: $toolkitSessionsCount, ')
          ..write('cravingsResisted: $cravingsResisted, ')
          ..write('lapseEvents: $lapseEvents, ')
          ..write('topTrigger: $topTrigger, ')
          ..write('mostUsedExercise: $mostUsedExercise, ')
          ..write('motivationalSummary: $motivationalSummary, ')
          ..write('generatedAt: $generatedAt')
          ..write(')'))
        .toString();
  }
}

class $AchievementsTable extends Achievements
    with TableInfo<$AchievementsTable, DbAchievement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _achievementIdMeta = const VerificationMeta(
    'achievementId',
  );
  @override
  late final GeneratedColumn<String> achievementId = GeneratedColumn<String>(
    'achievement_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconEmojiMeta = const VerificationMeta(
    'iconEmoji',
  );
  @override
  late final GeneratedColumn<String> iconEmoji = GeneratedColumn<String>(
    'icon_emoji',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modeFilterMeta = const VerificationMeta(
    'modeFilter',
  );
  @override
  late final GeneratedColumn<String> modeFilter = GeneratedColumn<String>(
    'mode_filter',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _progressValueMeta = const VerificationMeta(
    'progressValue',
  );
  @override
  late final GeneratedColumn<int> progressValue = GeneratedColumn<int>(
    'progress_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressMaxMeta = const VerificationMeta(
    'progressMax',
  );
  @override
  late final GeneratedColumn<int> progressMax = GeneratedColumn<int>(
    'progress_max',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isUnlockedMeta = const VerificationMeta(
    'isUnlocked',
  );
  @override
  late final GeneratedColumn<bool> isUnlocked = GeneratedColumn<bool>(
    'is_unlocked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_unlocked" IN (0, 1))',
    ),
  );
  static const VerificationMeta _unlockedAtMeta = const VerificationMeta(
    'unlockedAt',
  );
  @override
  late final GeneratedColumn<DateTime> unlockedAt = GeneratedColumn<DateTime>(
    'unlocked_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    achievementId,
    name,
    description,
    iconEmoji,
    category,
    modeFilter,
    progressValue,
    progressMax,
    isUnlocked,
    unlockedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievements';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbAchievement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('achievement_id')) {
      context.handle(
        _achievementIdMeta,
        achievementId.isAcceptableOrUnknown(
          data['achievement_id']!,
          _achievementIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_achievementIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('icon_emoji')) {
      context.handle(
        _iconEmojiMeta,
        iconEmoji.isAcceptableOrUnknown(data['icon_emoji']!, _iconEmojiMeta),
      );
    } else if (isInserting) {
      context.missing(_iconEmojiMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('mode_filter')) {
      context.handle(
        _modeFilterMeta,
        modeFilter.isAcceptableOrUnknown(data['mode_filter']!, _modeFilterMeta),
      );
    }
    if (data.containsKey('progress_value')) {
      context.handle(
        _progressValueMeta,
        progressValue.isAcceptableOrUnknown(
          data['progress_value']!,
          _progressValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_progressValueMeta);
    }
    if (data.containsKey('progress_max')) {
      context.handle(
        _progressMaxMeta,
        progressMax.isAcceptableOrUnknown(
          data['progress_max']!,
          _progressMaxMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_progressMaxMeta);
    }
    if (data.containsKey('is_unlocked')) {
      context.handle(
        _isUnlockedMeta,
        isUnlocked.isAcceptableOrUnknown(data['is_unlocked']!, _isUnlockedMeta),
      );
    } else if (isInserting) {
      context.missing(_isUnlockedMeta);
    }
    if (data.containsKey('unlocked_at')) {
      context.handle(
        _unlockedAtMeta,
        unlockedAt.isAcceptableOrUnknown(data['unlocked_at']!, _unlockedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbAchievement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbAchievement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      achievementId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}achievement_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      iconEmoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_emoji'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      modeFilter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode_filter'],
      ),
      progressValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}progress_value'],
      )!,
      progressMax: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}progress_max'],
      )!,
      isUnlocked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_unlocked'],
      )!,
      unlockedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}unlocked_at'],
      ),
    );
  }

  @override
  $AchievementsTable createAlias(String alias) {
    return $AchievementsTable(attachedDatabase, alias);
  }
}

class DbAchievement extends DataClass implements Insertable<DbAchievement> {
  final int id;
  final String userId;
  final String achievementId;
  final String name;
  final String description;
  final String iconEmoji;
  final String category;
  final String? modeFilter;
  final int progressValue;
  final int progressMax;
  final bool isUnlocked;
  final DateTime? unlockedAt;
  const DbAchievement({
    required this.id,
    required this.userId,
    required this.achievementId,
    required this.name,
    required this.description,
    required this.iconEmoji,
    required this.category,
    this.modeFilter,
    required this.progressValue,
    required this.progressMax,
    required this.isUnlocked,
    this.unlockedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['achievement_id'] = Variable<String>(achievementId);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['icon_emoji'] = Variable<String>(iconEmoji);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || modeFilter != null) {
      map['mode_filter'] = Variable<String>(modeFilter);
    }
    map['progress_value'] = Variable<int>(progressValue);
    map['progress_max'] = Variable<int>(progressMax);
    map['is_unlocked'] = Variable<bool>(isUnlocked);
    if (!nullToAbsent || unlockedAt != null) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt);
    }
    return map;
  }

  AchievementsCompanion toCompanion(bool nullToAbsent) {
    return AchievementsCompanion(
      id: Value(id),
      userId: Value(userId),
      achievementId: Value(achievementId),
      name: Value(name),
      description: Value(description),
      iconEmoji: Value(iconEmoji),
      category: Value(category),
      modeFilter: modeFilter == null && nullToAbsent
          ? const Value.absent()
          : Value(modeFilter),
      progressValue: Value(progressValue),
      progressMax: Value(progressMax),
      isUnlocked: Value(isUnlocked),
      unlockedAt: unlockedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(unlockedAt),
    );
  }

  factory DbAchievement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbAchievement(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      achievementId: serializer.fromJson<String>(json['achievementId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      iconEmoji: serializer.fromJson<String>(json['iconEmoji']),
      category: serializer.fromJson<String>(json['category']),
      modeFilter: serializer.fromJson<String?>(json['modeFilter']),
      progressValue: serializer.fromJson<int>(json['progressValue']),
      progressMax: serializer.fromJson<int>(json['progressMax']),
      isUnlocked: serializer.fromJson<bool>(json['isUnlocked']),
      unlockedAt: serializer.fromJson<DateTime?>(json['unlockedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'achievementId': serializer.toJson<String>(achievementId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'iconEmoji': serializer.toJson<String>(iconEmoji),
      'category': serializer.toJson<String>(category),
      'modeFilter': serializer.toJson<String?>(modeFilter),
      'progressValue': serializer.toJson<int>(progressValue),
      'progressMax': serializer.toJson<int>(progressMax),
      'isUnlocked': serializer.toJson<bool>(isUnlocked),
      'unlockedAt': serializer.toJson<DateTime?>(unlockedAt),
    };
  }

  DbAchievement copyWith({
    int? id,
    String? userId,
    String? achievementId,
    String? name,
    String? description,
    String? iconEmoji,
    String? category,
    Value<String?> modeFilter = const Value.absent(),
    int? progressValue,
    int? progressMax,
    bool? isUnlocked,
    Value<DateTime?> unlockedAt = const Value.absent(),
  }) => DbAchievement(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    achievementId: achievementId ?? this.achievementId,
    name: name ?? this.name,
    description: description ?? this.description,
    iconEmoji: iconEmoji ?? this.iconEmoji,
    category: category ?? this.category,
    modeFilter: modeFilter.present ? modeFilter.value : this.modeFilter,
    progressValue: progressValue ?? this.progressValue,
    progressMax: progressMax ?? this.progressMax,
    isUnlocked: isUnlocked ?? this.isUnlocked,
    unlockedAt: unlockedAt.present ? unlockedAt.value : this.unlockedAt,
  );
  DbAchievement copyWithCompanion(AchievementsCompanion data) {
    return DbAchievement(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      achievementId: data.achievementId.present
          ? data.achievementId.value
          : this.achievementId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      iconEmoji: data.iconEmoji.present ? data.iconEmoji.value : this.iconEmoji,
      category: data.category.present ? data.category.value : this.category,
      modeFilter: data.modeFilter.present
          ? data.modeFilter.value
          : this.modeFilter,
      progressValue: data.progressValue.present
          ? data.progressValue.value
          : this.progressValue,
      progressMax: data.progressMax.present
          ? data.progressMax.value
          : this.progressMax,
      isUnlocked: data.isUnlocked.present
          ? data.isUnlocked.value
          : this.isUnlocked,
      unlockedAt: data.unlockedAt.present
          ? data.unlockedAt.value
          : this.unlockedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbAchievement(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('achievementId: $achievementId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconEmoji: $iconEmoji, ')
          ..write('category: $category, ')
          ..write('modeFilter: $modeFilter, ')
          ..write('progressValue: $progressValue, ')
          ..write('progressMax: $progressMax, ')
          ..write('isUnlocked: $isUnlocked, ')
          ..write('unlockedAt: $unlockedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    achievementId,
    name,
    description,
    iconEmoji,
    category,
    modeFilter,
    progressValue,
    progressMax,
    isUnlocked,
    unlockedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbAchievement &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.achievementId == this.achievementId &&
          other.name == this.name &&
          other.description == this.description &&
          other.iconEmoji == this.iconEmoji &&
          other.category == this.category &&
          other.modeFilter == this.modeFilter &&
          other.progressValue == this.progressValue &&
          other.progressMax == this.progressMax &&
          other.isUnlocked == this.isUnlocked &&
          other.unlockedAt == this.unlockedAt);
}

class AchievementsCompanion extends UpdateCompanion<DbAchievement> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> achievementId;
  final Value<String> name;
  final Value<String> description;
  final Value<String> iconEmoji;
  final Value<String> category;
  final Value<String?> modeFilter;
  final Value<int> progressValue;
  final Value<int> progressMax;
  final Value<bool> isUnlocked;
  final Value<DateTime?> unlockedAt;
  const AchievementsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.achievementId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.iconEmoji = const Value.absent(),
    this.category = const Value.absent(),
    this.modeFilter = const Value.absent(),
    this.progressValue = const Value.absent(),
    this.progressMax = const Value.absent(),
    this.isUnlocked = const Value.absent(),
    this.unlockedAt = const Value.absent(),
  });
  AchievementsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String achievementId,
    required String name,
    required String description,
    required String iconEmoji,
    required String category,
    this.modeFilter = const Value.absent(),
    required int progressValue,
    required int progressMax,
    required bool isUnlocked,
    this.unlockedAt = const Value.absent(),
  }) : userId = Value(userId),
       achievementId = Value(achievementId),
       name = Value(name),
       description = Value(description),
       iconEmoji = Value(iconEmoji),
       category = Value(category),
       progressValue = Value(progressValue),
       progressMax = Value(progressMax),
       isUnlocked = Value(isUnlocked);
  static Insertable<DbAchievement> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? achievementId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? iconEmoji,
    Expression<String>? category,
    Expression<String>? modeFilter,
    Expression<int>? progressValue,
    Expression<int>? progressMax,
    Expression<bool>? isUnlocked,
    Expression<DateTime>? unlockedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (achievementId != null) 'achievement_id': achievementId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (iconEmoji != null) 'icon_emoji': iconEmoji,
      if (category != null) 'category': category,
      if (modeFilter != null) 'mode_filter': modeFilter,
      if (progressValue != null) 'progress_value': progressValue,
      if (progressMax != null) 'progress_max': progressMax,
      if (isUnlocked != null) 'is_unlocked': isUnlocked,
      if (unlockedAt != null) 'unlocked_at': unlockedAt,
    });
  }

  AchievementsCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? achievementId,
    Value<String>? name,
    Value<String>? description,
    Value<String>? iconEmoji,
    Value<String>? category,
    Value<String?>? modeFilter,
    Value<int>? progressValue,
    Value<int>? progressMax,
    Value<bool>? isUnlocked,
    Value<DateTime?>? unlockedAt,
  }) {
    return AchievementsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      achievementId: achievementId ?? this.achievementId,
      name: name ?? this.name,
      description: description ?? this.description,
      iconEmoji: iconEmoji ?? this.iconEmoji,
      category: category ?? this.category,
      modeFilter: modeFilter ?? this.modeFilter,
      progressValue: progressValue ?? this.progressValue,
      progressMax: progressMax ?? this.progressMax,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      unlockedAt: unlockedAt ?? this.unlockedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (achievementId.present) {
      map['achievement_id'] = Variable<String>(achievementId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconEmoji.present) {
      map['icon_emoji'] = Variable<String>(iconEmoji.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (modeFilter.present) {
      map['mode_filter'] = Variable<String>(modeFilter.value);
    }
    if (progressValue.present) {
      map['progress_value'] = Variable<int>(progressValue.value);
    }
    if (progressMax.present) {
      map['progress_max'] = Variable<int>(progressMax.value);
    }
    if (isUnlocked.present) {
      map['is_unlocked'] = Variable<bool>(isUnlocked.value);
    }
    if (unlockedAt.present) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('achievementId: $achievementId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconEmoji: $iconEmoji, ')
          ..write('category: $category, ')
          ..write('modeFilter: $modeFilter, ')
          ..write('progressValue: $progressValue, ')
          ..write('progressMax: $progressMax, ')
          ..write('isUnlocked: $isUnlocked, ')
          ..write('unlockedAt: $unlockedAt')
          ..write(')'))
        .toString();
  }
}

class $BreathingSessionsTable extends BreathingSessions
    with TableInfo<$BreathingSessionsTable, DbBreathingSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BreathingSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _patternMeta = const VerificationMeta(
    'pattern',
  );
  @override
  late final GeneratedColumn<String> pattern = GeneratedColumn<String>(
    'pattern',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cyclesCompletedMeta = const VerificationMeta(
    'cyclesCompleted',
  );
  @override
  late final GeneratedColumn<int> cyclesCompleted = GeneratedColumn<int>(
    'cycles_completed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cravingIdMeta = const VerificationMeta(
    'cravingId',
  );
  @override
  late final GeneratedColumn<int> cravingId = GeneratedColumn<int>(
    'craving_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _effectivenessRatingMeta =
      const VerificationMeta('effectivenessRating');
  @override
  late final GeneratedColumn<int> effectivenessRating = GeneratedColumn<int>(
    'effectiveness_rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    pattern,
    durationSeconds,
    cyclesCompleted,
    startTime,
    endTime,
    cravingId,
    effectivenessRating,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'breathing_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbBreathingSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('pattern')) {
      context.handle(
        _patternMeta,
        pattern.isAcceptableOrUnknown(data['pattern']!, _patternMeta),
      );
    } else if (isInserting) {
      context.missing(_patternMeta);
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationSecondsMeta);
    }
    if (data.containsKey('cycles_completed')) {
      context.handle(
        _cyclesCompletedMeta,
        cyclesCompleted.isAcceptableOrUnknown(
          data['cycles_completed']!,
          _cyclesCompletedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cyclesCompletedMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('craving_id')) {
      context.handle(
        _cravingIdMeta,
        cravingId.isAcceptableOrUnknown(data['craving_id']!, _cravingIdMeta),
      );
    }
    if (data.containsKey('effectiveness_rating')) {
      context.handle(
        _effectivenessRatingMeta,
        effectivenessRating.isAcceptableOrUnknown(
          data['effectiveness_rating']!,
          _effectivenessRatingMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbBreathingSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbBreathingSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      pattern: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pattern'],
      )!,
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      )!,
      cyclesCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycles_completed'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      ),
      cravingId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}craving_id'],
      ),
      effectivenessRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}effectiveness_rating'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BreathingSessionsTable createAlias(String alias) {
    return $BreathingSessionsTable(attachedDatabase, alias);
  }
}

class DbBreathingSession extends DataClass
    implements Insertable<DbBreathingSession> {
  final int id;
  final String userId;
  final String pattern;
  final int durationSeconds;
  final int cyclesCompleted;
  final DateTime startTime;
  final DateTime? endTime;
  final int? cravingId;
  final int? effectivenessRating;
  final DateTime createdAt;
  const DbBreathingSession({
    required this.id,
    required this.userId,
    required this.pattern,
    required this.durationSeconds,
    required this.cyclesCompleted,
    required this.startTime,
    this.endTime,
    this.cravingId,
    this.effectivenessRating,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['pattern'] = Variable<String>(pattern);
    map['duration_seconds'] = Variable<int>(durationSeconds);
    map['cycles_completed'] = Variable<int>(cyclesCompleted);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    if (!nullToAbsent || cravingId != null) {
      map['craving_id'] = Variable<int>(cravingId);
    }
    if (!nullToAbsent || effectivenessRating != null) {
      map['effectiveness_rating'] = Variable<int>(effectivenessRating);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BreathingSessionsCompanion toCompanion(bool nullToAbsent) {
    return BreathingSessionsCompanion(
      id: Value(id),
      userId: Value(userId),
      pattern: Value(pattern),
      durationSeconds: Value(durationSeconds),
      cyclesCompleted: Value(cyclesCompleted),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      cravingId: cravingId == null && nullToAbsent
          ? const Value.absent()
          : Value(cravingId),
      effectivenessRating: effectivenessRating == null && nullToAbsent
          ? const Value.absent()
          : Value(effectivenessRating),
      createdAt: Value(createdAt),
    );
  }

  factory DbBreathingSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbBreathingSession(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      pattern: serializer.fromJson<String>(json['pattern']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      cyclesCompleted: serializer.fromJson<int>(json['cyclesCompleted']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      cravingId: serializer.fromJson<int?>(json['cravingId']),
      effectivenessRating: serializer.fromJson<int?>(
        json['effectivenessRating'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'pattern': serializer.toJson<String>(pattern),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'cyclesCompleted': serializer.toJson<int>(cyclesCompleted),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'cravingId': serializer.toJson<int?>(cravingId),
      'effectivenessRating': serializer.toJson<int?>(effectivenessRating),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DbBreathingSession copyWith({
    int? id,
    String? userId,
    String? pattern,
    int? durationSeconds,
    int? cyclesCompleted,
    DateTime? startTime,
    Value<DateTime?> endTime = const Value.absent(),
    Value<int?> cravingId = const Value.absent(),
    Value<int?> effectivenessRating = const Value.absent(),
    DateTime? createdAt,
  }) => DbBreathingSession(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    pattern: pattern ?? this.pattern,
    durationSeconds: durationSeconds ?? this.durationSeconds,
    cyclesCompleted: cyclesCompleted ?? this.cyclesCompleted,
    startTime: startTime ?? this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    cravingId: cravingId.present ? cravingId.value : this.cravingId,
    effectivenessRating: effectivenessRating.present
        ? effectivenessRating.value
        : this.effectivenessRating,
    createdAt: createdAt ?? this.createdAt,
  );
  DbBreathingSession copyWithCompanion(BreathingSessionsCompanion data) {
    return DbBreathingSession(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      pattern: data.pattern.present ? data.pattern.value : this.pattern,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      cyclesCompleted: data.cyclesCompleted.present
          ? data.cyclesCompleted.value
          : this.cyclesCompleted,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      cravingId: data.cravingId.present ? data.cravingId.value : this.cravingId,
      effectivenessRating: data.effectivenessRating.present
          ? data.effectivenessRating.value
          : this.effectivenessRating,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbBreathingSession(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('pattern: $pattern, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('cyclesCompleted: $cyclesCompleted, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('cravingId: $cravingId, ')
          ..write('effectivenessRating: $effectivenessRating, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    pattern,
    durationSeconds,
    cyclesCompleted,
    startTime,
    endTime,
    cravingId,
    effectivenessRating,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbBreathingSession &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.pattern == this.pattern &&
          other.durationSeconds == this.durationSeconds &&
          other.cyclesCompleted == this.cyclesCompleted &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.cravingId == this.cravingId &&
          other.effectivenessRating == this.effectivenessRating &&
          other.createdAt == this.createdAt);
}

class BreathingSessionsCompanion extends UpdateCompanion<DbBreathingSession> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> pattern;
  final Value<int> durationSeconds;
  final Value<int> cyclesCompleted;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<int?> cravingId;
  final Value<int?> effectivenessRating;
  final Value<DateTime> createdAt;
  const BreathingSessionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.pattern = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.cyclesCompleted = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.cravingId = const Value.absent(),
    this.effectivenessRating = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BreathingSessionsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String pattern,
    required int durationSeconds,
    required int cyclesCompleted,
    required DateTime startTime,
    this.endTime = const Value.absent(),
    this.cravingId = const Value.absent(),
    this.effectivenessRating = const Value.absent(),
    required DateTime createdAt,
  }) : userId = Value(userId),
       pattern = Value(pattern),
       durationSeconds = Value(durationSeconds),
       cyclesCompleted = Value(cyclesCompleted),
       startTime = Value(startTime),
       createdAt = Value(createdAt);
  static Insertable<DbBreathingSession> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? pattern,
    Expression<int>? durationSeconds,
    Expression<int>? cyclesCompleted,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<int>? cravingId,
    Expression<int>? effectivenessRating,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (pattern != null) 'pattern': pattern,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (cyclesCompleted != null) 'cycles_completed': cyclesCompleted,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (cravingId != null) 'craving_id': cravingId,
      if (effectivenessRating != null)
        'effectiveness_rating': effectivenessRating,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BreathingSessionsCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? pattern,
    Value<int>? durationSeconds,
    Value<int>? cyclesCompleted,
    Value<DateTime>? startTime,
    Value<DateTime?>? endTime,
    Value<int?>? cravingId,
    Value<int?>? effectivenessRating,
    Value<DateTime>? createdAt,
  }) {
    return BreathingSessionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      pattern: pattern ?? this.pattern,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      cyclesCompleted: cyclesCompleted ?? this.cyclesCompleted,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      cravingId: cravingId ?? this.cravingId,
      effectivenessRating: effectivenessRating ?? this.effectivenessRating,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (pattern.present) {
      map['pattern'] = Variable<String>(pattern.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (cyclesCompleted.present) {
      map['cycles_completed'] = Variable<int>(cyclesCompleted.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (cravingId.present) {
      map['craving_id'] = Variable<int>(cravingId.value);
    }
    if (effectivenessRating.present) {
      map['effectiveness_rating'] = Variable<int>(effectivenessRating.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BreathingSessionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('pattern: $pattern, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('cyclesCompleted: $cyclesCompleted, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('cravingId: $cravingId, ')
          ..write('effectivenessRating: $effectivenessRating, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CbtSessionsTable extends CbtSessions
    with TableInfo<$CbtSessionsTable, DbCbtSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CbtSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _techniqueMeta = const VerificationMeta(
    'technique',
  );
  @override
  late final GeneratedColumn<String> technique = GeneratedColumn<String>(
    'technique',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thoughtsBeforeMeta = const VerificationMeta(
    'thoughtsBefore',
  );
  @override
  late final GeneratedColumn<String> thoughtsBefore = GeneratedColumn<String>(
    'thoughts_before',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thoughtsAfterMeta = const VerificationMeta(
    'thoughtsAfter',
  );
  @override
  late final GeneratedColumn<String> thoughtsAfter = GeneratedColumn<String>(
    'thoughts_after',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _consequencesMeta = const VerificationMeta(
    'consequences',
  );
  @override
  late final GeneratedColumn<String> consequences = GeneratedColumn<String>(
    'consequences',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _alternativeChosenMeta = const VerificationMeta(
    'alternativeChosen',
  );
  @override
  late final GeneratedColumn<String> alternativeChosen =
      GeneratedColumn<String>(
        'alternative_chosen',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _cravingIdMeta = const VerificationMeta(
    'cravingId',
  );
  @override
  late final GeneratedColumn<int> cravingId = GeneratedColumn<int>(
    'craving_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wasHelpfulMeta = const VerificationMeta(
    'wasHelpful',
  );
  @override
  late final GeneratedColumn<bool> wasHelpful = GeneratedColumn<bool>(
    'was_helpful',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("was_helpful" IN (0, 1))',
    ),
  );
  static const VerificationMeta _helpfulnessRatingMeta = const VerificationMeta(
    'helpfulnessRating',
  );
  @override
  late final GeneratedColumn<int> helpfulnessRating = GeneratedColumn<int>(
    'helpfulness_rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    technique,
    startTime,
    endTime,
    thoughtsBefore,
    thoughtsAfter,
    consequences,
    alternativeChosen,
    cravingId,
    wasHelpful,
    helpfulnessRating,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cbt_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbCbtSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('technique')) {
      context.handle(
        _techniqueMeta,
        technique.isAcceptableOrUnknown(data['technique']!, _techniqueMeta),
      );
    } else if (isInserting) {
      context.missing(_techniqueMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('thoughts_before')) {
      context.handle(
        _thoughtsBeforeMeta,
        thoughtsBefore.isAcceptableOrUnknown(
          data['thoughts_before']!,
          _thoughtsBeforeMeta,
        ),
      );
    }
    if (data.containsKey('thoughts_after')) {
      context.handle(
        _thoughtsAfterMeta,
        thoughtsAfter.isAcceptableOrUnknown(
          data['thoughts_after']!,
          _thoughtsAfterMeta,
        ),
      );
    }
    if (data.containsKey('consequences')) {
      context.handle(
        _consequencesMeta,
        consequences.isAcceptableOrUnknown(
          data['consequences']!,
          _consequencesMeta,
        ),
      );
    }
    if (data.containsKey('alternative_chosen')) {
      context.handle(
        _alternativeChosenMeta,
        alternativeChosen.isAcceptableOrUnknown(
          data['alternative_chosen']!,
          _alternativeChosenMeta,
        ),
      );
    }
    if (data.containsKey('craving_id')) {
      context.handle(
        _cravingIdMeta,
        cravingId.isAcceptableOrUnknown(data['craving_id']!, _cravingIdMeta),
      );
    }
    if (data.containsKey('was_helpful')) {
      context.handle(
        _wasHelpfulMeta,
        wasHelpful.isAcceptableOrUnknown(data['was_helpful']!, _wasHelpfulMeta),
      );
    }
    if (data.containsKey('helpfulness_rating')) {
      context.handle(
        _helpfulnessRatingMeta,
        helpfulnessRating.isAcceptableOrUnknown(
          data['helpfulness_rating']!,
          _helpfulnessRatingMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbCbtSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbCbtSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      technique: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}technique'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      ),
      thoughtsBefore: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thoughts_before'],
      ),
      thoughtsAfter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thoughts_after'],
      ),
      consequences: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}consequences'],
      ),
      alternativeChosen: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alternative_chosen'],
      ),
      cravingId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}craving_id'],
      ),
      wasHelpful: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}was_helpful'],
      ),
      helpfulnessRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}helpfulness_rating'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CbtSessionsTable createAlias(String alias) {
    return $CbtSessionsTable(attachedDatabase, alias);
  }
}

class DbCbtSession extends DataClass implements Insertable<DbCbtSession> {
  final int id;
  final String userId;
  final String technique;
  final DateTime startTime;
  final DateTime? endTime;
  final String? thoughtsBefore;
  final String? thoughtsAfter;
  final String? consequences;
  final String? alternativeChosen;
  final int? cravingId;
  final bool? wasHelpful;
  final int? helpfulnessRating;
  final DateTime createdAt;
  const DbCbtSession({
    required this.id,
    required this.userId,
    required this.technique,
    required this.startTime,
    this.endTime,
    this.thoughtsBefore,
    this.thoughtsAfter,
    this.consequences,
    this.alternativeChosen,
    this.cravingId,
    this.wasHelpful,
    this.helpfulnessRating,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['technique'] = Variable<String>(technique);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    if (!nullToAbsent || thoughtsBefore != null) {
      map['thoughts_before'] = Variable<String>(thoughtsBefore);
    }
    if (!nullToAbsent || thoughtsAfter != null) {
      map['thoughts_after'] = Variable<String>(thoughtsAfter);
    }
    if (!nullToAbsent || consequences != null) {
      map['consequences'] = Variable<String>(consequences);
    }
    if (!nullToAbsent || alternativeChosen != null) {
      map['alternative_chosen'] = Variable<String>(alternativeChosen);
    }
    if (!nullToAbsent || cravingId != null) {
      map['craving_id'] = Variable<int>(cravingId);
    }
    if (!nullToAbsent || wasHelpful != null) {
      map['was_helpful'] = Variable<bool>(wasHelpful);
    }
    if (!nullToAbsent || helpfulnessRating != null) {
      map['helpfulness_rating'] = Variable<int>(helpfulnessRating);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CbtSessionsCompanion toCompanion(bool nullToAbsent) {
    return CbtSessionsCompanion(
      id: Value(id),
      userId: Value(userId),
      technique: Value(technique),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      thoughtsBefore: thoughtsBefore == null && nullToAbsent
          ? const Value.absent()
          : Value(thoughtsBefore),
      thoughtsAfter: thoughtsAfter == null && nullToAbsent
          ? const Value.absent()
          : Value(thoughtsAfter),
      consequences: consequences == null && nullToAbsent
          ? const Value.absent()
          : Value(consequences),
      alternativeChosen: alternativeChosen == null && nullToAbsent
          ? const Value.absent()
          : Value(alternativeChosen),
      cravingId: cravingId == null && nullToAbsent
          ? const Value.absent()
          : Value(cravingId),
      wasHelpful: wasHelpful == null && nullToAbsent
          ? const Value.absent()
          : Value(wasHelpful),
      helpfulnessRating: helpfulnessRating == null && nullToAbsent
          ? const Value.absent()
          : Value(helpfulnessRating),
      createdAt: Value(createdAt),
    );
  }

  factory DbCbtSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbCbtSession(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      technique: serializer.fromJson<String>(json['technique']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      thoughtsBefore: serializer.fromJson<String?>(json['thoughtsBefore']),
      thoughtsAfter: serializer.fromJson<String?>(json['thoughtsAfter']),
      consequences: serializer.fromJson<String?>(json['consequences']),
      alternativeChosen: serializer.fromJson<String?>(
        json['alternativeChosen'],
      ),
      cravingId: serializer.fromJson<int?>(json['cravingId']),
      wasHelpful: serializer.fromJson<bool?>(json['wasHelpful']),
      helpfulnessRating: serializer.fromJson<int?>(json['helpfulnessRating']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'technique': serializer.toJson<String>(technique),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'thoughtsBefore': serializer.toJson<String?>(thoughtsBefore),
      'thoughtsAfter': serializer.toJson<String?>(thoughtsAfter),
      'consequences': serializer.toJson<String?>(consequences),
      'alternativeChosen': serializer.toJson<String?>(alternativeChosen),
      'cravingId': serializer.toJson<int?>(cravingId),
      'wasHelpful': serializer.toJson<bool?>(wasHelpful),
      'helpfulnessRating': serializer.toJson<int?>(helpfulnessRating),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DbCbtSession copyWith({
    int? id,
    String? userId,
    String? technique,
    DateTime? startTime,
    Value<DateTime?> endTime = const Value.absent(),
    Value<String?> thoughtsBefore = const Value.absent(),
    Value<String?> thoughtsAfter = const Value.absent(),
    Value<String?> consequences = const Value.absent(),
    Value<String?> alternativeChosen = const Value.absent(),
    Value<int?> cravingId = const Value.absent(),
    Value<bool?> wasHelpful = const Value.absent(),
    Value<int?> helpfulnessRating = const Value.absent(),
    DateTime? createdAt,
  }) => DbCbtSession(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    technique: technique ?? this.technique,
    startTime: startTime ?? this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    thoughtsBefore: thoughtsBefore.present
        ? thoughtsBefore.value
        : this.thoughtsBefore,
    thoughtsAfter: thoughtsAfter.present
        ? thoughtsAfter.value
        : this.thoughtsAfter,
    consequences: consequences.present ? consequences.value : this.consequences,
    alternativeChosen: alternativeChosen.present
        ? alternativeChosen.value
        : this.alternativeChosen,
    cravingId: cravingId.present ? cravingId.value : this.cravingId,
    wasHelpful: wasHelpful.present ? wasHelpful.value : this.wasHelpful,
    helpfulnessRating: helpfulnessRating.present
        ? helpfulnessRating.value
        : this.helpfulnessRating,
    createdAt: createdAt ?? this.createdAt,
  );
  DbCbtSession copyWithCompanion(CbtSessionsCompanion data) {
    return DbCbtSession(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      technique: data.technique.present ? data.technique.value : this.technique,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      thoughtsBefore: data.thoughtsBefore.present
          ? data.thoughtsBefore.value
          : this.thoughtsBefore,
      thoughtsAfter: data.thoughtsAfter.present
          ? data.thoughtsAfter.value
          : this.thoughtsAfter,
      consequences: data.consequences.present
          ? data.consequences.value
          : this.consequences,
      alternativeChosen: data.alternativeChosen.present
          ? data.alternativeChosen.value
          : this.alternativeChosen,
      cravingId: data.cravingId.present ? data.cravingId.value : this.cravingId,
      wasHelpful: data.wasHelpful.present
          ? data.wasHelpful.value
          : this.wasHelpful,
      helpfulnessRating: data.helpfulnessRating.present
          ? data.helpfulnessRating.value
          : this.helpfulnessRating,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbCbtSession(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('technique: $technique, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('thoughtsBefore: $thoughtsBefore, ')
          ..write('thoughtsAfter: $thoughtsAfter, ')
          ..write('consequences: $consequences, ')
          ..write('alternativeChosen: $alternativeChosen, ')
          ..write('cravingId: $cravingId, ')
          ..write('wasHelpful: $wasHelpful, ')
          ..write('helpfulnessRating: $helpfulnessRating, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    technique,
    startTime,
    endTime,
    thoughtsBefore,
    thoughtsAfter,
    consequences,
    alternativeChosen,
    cravingId,
    wasHelpful,
    helpfulnessRating,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbCbtSession &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.technique == this.technique &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.thoughtsBefore == this.thoughtsBefore &&
          other.thoughtsAfter == this.thoughtsAfter &&
          other.consequences == this.consequences &&
          other.alternativeChosen == this.alternativeChosen &&
          other.cravingId == this.cravingId &&
          other.wasHelpful == this.wasHelpful &&
          other.helpfulnessRating == this.helpfulnessRating &&
          other.createdAt == this.createdAt);
}

class CbtSessionsCompanion extends UpdateCompanion<DbCbtSession> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> technique;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<String?> thoughtsBefore;
  final Value<String?> thoughtsAfter;
  final Value<String?> consequences;
  final Value<String?> alternativeChosen;
  final Value<int?> cravingId;
  final Value<bool?> wasHelpful;
  final Value<int?> helpfulnessRating;
  final Value<DateTime> createdAt;
  const CbtSessionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.technique = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.thoughtsBefore = const Value.absent(),
    this.thoughtsAfter = const Value.absent(),
    this.consequences = const Value.absent(),
    this.alternativeChosen = const Value.absent(),
    this.cravingId = const Value.absent(),
    this.wasHelpful = const Value.absent(),
    this.helpfulnessRating = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CbtSessionsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String technique,
    required DateTime startTime,
    this.endTime = const Value.absent(),
    this.thoughtsBefore = const Value.absent(),
    this.thoughtsAfter = const Value.absent(),
    this.consequences = const Value.absent(),
    this.alternativeChosen = const Value.absent(),
    this.cravingId = const Value.absent(),
    this.wasHelpful = const Value.absent(),
    this.helpfulnessRating = const Value.absent(),
    required DateTime createdAt,
  }) : userId = Value(userId),
       technique = Value(technique),
       startTime = Value(startTime),
       createdAt = Value(createdAt);
  static Insertable<DbCbtSession> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? technique,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? thoughtsBefore,
    Expression<String>? thoughtsAfter,
    Expression<String>? consequences,
    Expression<String>? alternativeChosen,
    Expression<int>? cravingId,
    Expression<bool>? wasHelpful,
    Expression<int>? helpfulnessRating,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (technique != null) 'technique': technique,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (thoughtsBefore != null) 'thoughts_before': thoughtsBefore,
      if (thoughtsAfter != null) 'thoughts_after': thoughtsAfter,
      if (consequences != null) 'consequences': consequences,
      if (alternativeChosen != null) 'alternative_chosen': alternativeChosen,
      if (cravingId != null) 'craving_id': cravingId,
      if (wasHelpful != null) 'was_helpful': wasHelpful,
      if (helpfulnessRating != null) 'helpfulness_rating': helpfulnessRating,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CbtSessionsCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? technique,
    Value<DateTime>? startTime,
    Value<DateTime?>? endTime,
    Value<String?>? thoughtsBefore,
    Value<String?>? thoughtsAfter,
    Value<String?>? consequences,
    Value<String?>? alternativeChosen,
    Value<int?>? cravingId,
    Value<bool?>? wasHelpful,
    Value<int?>? helpfulnessRating,
    Value<DateTime>? createdAt,
  }) {
    return CbtSessionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      technique: technique ?? this.technique,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      thoughtsBefore: thoughtsBefore ?? this.thoughtsBefore,
      thoughtsAfter: thoughtsAfter ?? this.thoughtsAfter,
      consequences: consequences ?? this.consequences,
      alternativeChosen: alternativeChosen ?? this.alternativeChosen,
      cravingId: cravingId ?? this.cravingId,
      wasHelpful: wasHelpful ?? this.wasHelpful,
      helpfulnessRating: helpfulnessRating ?? this.helpfulnessRating,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (technique.present) {
      map['technique'] = Variable<String>(technique.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (thoughtsBefore.present) {
      map['thoughts_before'] = Variable<String>(thoughtsBefore.value);
    }
    if (thoughtsAfter.present) {
      map['thoughts_after'] = Variable<String>(thoughtsAfter.value);
    }
    if (consequences.present) {
      map['consequences'] = Variable<String>(consequences.value);
    }
    if (alternativeChosen.present) {
      map['alternative_chosen'] = Variable<String>(alternativeChosen.value);
    }
    if (cravingId.present) {
      map['craving_id'] = Variable<int>(cravingId.value);
    }
    if (wasHelpful.present) {
      map['was_helpful'] = Variable<bool>(wasHelpful.value);
    }
    if (helpfulnessRating.present) {
      map['helpfulness_rating'] = Variable<int>(helpfulnessRating.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CbtSessionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('technique: $technique, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('thoughtsBefore: $thoughtsBefore, ')
          ..write('thoughtsAfter: $thoughtsAfter, ')
          ..write('consequences: $consequences, ')
          ..write('alternativeChosen: $alternativeChosen, ')
          ..write('cravingId: $cravingId, ')
          ..write('wasHelpful: $wasHelpful, ')
          ..write('helpfulnessRating: $helpfulnessRating, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $GroundingSessionsTable extends GroundingSessions
    with TableInfo<$GroundingSessionsTable, DbGroundingSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroundingSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseMeta = const VerificationMeta(
    'exercise',
  );
  @override
  late final GeneratedColumn<String> exercise = GeneratedColumn<String>(
    'exercise',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seeItemsMeta = const VerificationMeta(
    'seeItems',
  );
  @override
  late final GeneratedColumn<String> seeItems = GeneratedColumn<String>(
    'see_items',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _touchItemsMeta = const VerificationMeta(
    'touchItems',
  );
  @override
  late final GeneratedColumn<String> touchItems = GeneratedColumn<String>(
    'touch_items',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hearItemsMeta = const VerificationMeta(
    'hearItems',
  );
  @override
  late final GeneratedColumn<String> hearItems = GeneratedColumn<String>(
    'hear_items',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _smellItemsMeta = const VerificationMeta(
    'smellItems',
  );
  @override
  late final GeneratedColumn<String> smellItems = GeneratedColumn<String>(
    'smell_items',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tasteItemsMeta = const VerificationMeta(
    'tasteItems',
  );
  @override
  late final GeneratedColumn<String> tasteItems = GeneratedColumn<String>(
    'taste_items',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cravingIdMeta = const VerificationMeta(
    'cravingId',
  );
  @override
  late final GeneratedColumn<int> cravingId = GeneratedColumn<int>(
    'craving_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _effectivenessRatingMeta =
      const VerificationMeta('effectivenessRating');
  @override
  late final GeneratedColumn<int> effectivenessRating = GeneratedColumn<int>(
    'effectiveness_rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    exercise,
    startTime,
    endTime,
    seeItems,
    touchItems,
    hearItems,
    smellItems,
    tasteItems,
    notes,
    cravingId,
    effectivenessRating,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grounding_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbGroundingSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('exercise')) {
      context.handle(
        _exerciseMeta,
        exercise.isAcceptableOrUnknown(data['exercise']!, _exerciseMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('see_items')) {
      context.handle(
        _seeItemsMeta,
        seeItems.isAcceptableOrUnknown(data['see_items']!, _seeItemsMeta),
      );
    }
    if (data.containsKey('touch_items')) {
      context.handle(
        _touchItemsMeta,
        touchItems.isAcceptableOrUnknown(data['touch_items']!, _touchItemsMeta),
      );
    }
    if (data.containsKey('hear_items')) {
      context.handle(
        _hearItemsMeta,
        hearItems.isAcceptableOrUnknown(data['hear_items']!, _hearItemsMeta),
      );
    }
    if (data.containsKey('smell_items')) {
      context.handle(
        _smellItemsMeta,
        smellItems.isAcceptableOrUnknown(data['smell_items']!, _smellItemsMeta),
      );
    }
    if (data.containsKey('taste_items')) {
      context.handle(
        _tasteItemsMeta,
        tasteItems.isAcceptableOrUnknown(data['taste_items']!, _tasteItemsMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('craving_id')) {
      context.handle(
        _cravingIdMeta,
        cravingId.isAcceptableOrUnknown(data['craving_id']!, _cravingIdMeta),
      );
    }
    if (data.containsKey('effectiveness_rating')) {
      context.handle(
        _effectivenessRatingMeta,
        effectivenessRating.isAcceptableOrUnknown(
          data['effectiveness_rating']!,
          _effectivenessRatingMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbGroundingSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbGroundingSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      exercise: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      ),
      seeItems: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}see_items'],
      ),
      touchItems: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}touch_items'],
      ),
      hearItems: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hear_items'],
      ),
      smellItems: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}smell_items'],
      ),
      tasteItems: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}taste_items'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      cravingId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}craving_id'],
      ),
      effectivenessRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}effectiveness_rating'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GroundingSessionsTable createAlias(String alias) {
    return $GroundingSessionsTable(attachedDatabase, alias);
  }
}

class DbGroundingSession extends DataClass
    implements Insertable<DbGroundingSession> {
  final int id;
  final String userId;
  final String exercise;
  final DateTime startTime;
  final DateTime? endTime;
  final String? seeItems;
  final String? touchItems;
  final String? hearItems;
  final String? smellItems;
  final String? tasteItems;
  final String? notes;
  final int? cravingId;
  final int? effectivenessRating;
  final DateTime createdAt;
  const DbGroundingSession({
    required this.id,
    required this.userId,
    required this.exercise,
    required this.startTime,
    this.endTime,
    this.seeItems,
    this.touchItems,
    this.hearItems,
    this.smellItems,
    this.tasteItems,
    this.notes,
    this.cravingId,
    this.effectivenessRating,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['exercise'] = Variable<String>(exercise);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    if (!nullToAbsent || seeItems != null) {
      map['see_items'] = Variable<String>(seeItems);
    }
    if (!nullToAbsent || touchItems != null) {
      map['touch_items'] = Variable<String>(touchItems);
    }
    if (!nullToAbsent || hearItems != null) {
      map['hear_items'] = Variable<String>(hearItems);
    }
    if (!nullToAbsent || smellItems != null) {
      map['smell_items'] = Variable<String>(smellItems);
    }
    if (!nullToAbsent || tasteItems != null) {
      map['taste_items'] = Variable<String>(tasteItems);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || cravingId != null) {
      map['craving_id'] = Variable<int>(cravingId);
    }
    if (!nullToAbsent || effectivenessRating != null) {
      map['effectiveness_rating'] = Variable<int>(effectivenessRating);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GroundingSessionsCompanion toCompanion(bool nullToAbsent) {
    return GroundingSessionsCompanion(
      id: Value(id),
      userId: Value(userId),
      exercise: Value(exercise),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      seeItems: seeItems == null && nullToAbsent
          ? const Value.absent()
          : Value(seeItems),
      touchItems: touchItems == null && nullToAbsent
          ? const Value.absent()
          : Value(touchItems),
      hearItems: hearItems == null && nullToAbsent
          ? const Value.absent()
          : Value(hearItems),
      smellItems: smellItems == null && nullToAbsent
          ? const Value.absent()
          : Value(smellItems),
      tasteItems: tasteItems == null && nullToAbsent
          ? const Value.absent()
          : Value(tasteItems),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      cravingId: cravingId == null && nullToAbsent
          ? const Value.absent()
          : Value(cravingId),
      effectivenessRating: effectivenessRating == null && nullToAbsent
          ? const Value.absent()
          : Value(effectivenessRating),
      createdAt: Value(createdAt),
    );
  }

  factory DbGroundingSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbGroundingSession(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      exercise: serializer.fromJson<String>(json['exercise']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      seeItems: serializer.fromJson<String?>(json['seeItems']),
      touchItems: serializer.fromJson<String?>(json['touchItems']),
      hearItems: serializer.fromJson<String?>(json['hearItems']),
      smellItems: serializer.fromJson<String?>(json['smellItems']),
      tasteItems: serializer.fromJson<String?>(json['tasteItems']),
      notes: serializer.fromJson<String?>(json['notes']),
      cravingId: serializer.fromJson<int?>(json['cravingId']),
      effectivenessRating: serializer.fromJson<int?>(
        json['effectivenessRating'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'exercise': serializer.toJson<String>(exercise),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'seeItems': serializer.toJson<String?>(seeItems),
      'touchItems': serializer.toJson<String?>(touchItems),
      'hearItems': serializer.toJson<String?>(hearItems),
      'smellItems': serializer.toJson<String?>(smellItems),
      'tasteItems': serializer.toJson<String?>(tasteItems),
      'notes': serializer.toJson<String?>(notes),
      'cravingId': serializer.toJson<int?>(cravingId),
      'effectivenessRating': serializer.toJson<int?>(effectivenessRating),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DbGroundingSession copyWith({
    int? id,
    String? userId,
    String? exercise,
    DateTime? startTime,
    Value<DateTime?> endTime = const Value.absent(),
    Value<String?> seeItems = const Value.absent(),
    Value<String?> touchItems = const Value.absent(),
    Value<String?> hearItems = const Value.absent(),
    Value<String?> smellItems = const Value.absent(),
    Value<String?> tasteItems = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<int?> cravingId = const Value.absent(),
    Value<int?> effectivenessRating = const Value.absent(),
    DateTime? createdAt,
  }) => DbGroundingSession(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    exercise: exercise ?? this.exercise,
    startTime: startTime ?? this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    seeItems: seeItems.present ? seeItems.value : this.seeItems,
    touchItems: touchItems.present ? touchItems.value : this.touchItems,
    hearItems: hearItems.present ? hearItems.value : this.hearItems,
    smellItems: smellItems.present ? smellItems.value : this.smellItems,
    tasteItems: tasteItems.present ? tasteItems.value : this.tasteItems,
    notes: notes.present ? notes.value : this.notes,
    cravingId: cravingId.present ? cravingId.value : this.cravingId,
    effectivenessRating: effectivenessRating.present
        ? effectivenessRating.value
        : this.effectivenessRating,
    createdAt: createdAt ?? this.createdAt,
  );
  DbGroundingSession copyWithCompanion(GroundingSessionsCompanion data) {
    return DbGroundingSession(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      exercise: data.exercise.present ? data.exercise.value : this.exercise,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      seeItems: data.seeItems.present ? data.seeItems.value : this.seeItems,
      touchItems: data.touchItems.present
          ? data.touchItems.value
          : this.touchItems,
      hearItems: data.hearItems.present ? data.hearItems.value : this.hearItems,
      smellItems: data.smellItems.present
          ? data.smellItems.value
          : this.smellItems,
      tasteItems: data.tasteItems.present
          ? data.tasteItems.value
          : this.tasteItems,
      notes: data.notes.present ? data.notes.value : this.notes,
      cravingId: data.cravingId.present ? data.cravingId.value : this.cravingId,
      effectivenessRating: data.effectivenessRating.present
          ? data.effectivenessRating.value
          : this.effectivenessRating,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbGroundingSession(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exercise: $exercise, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('seeItems: $seeItems, ')
          ..write('touchItems: $touchItems, ')
          ..write('hearItems: $hearItems, ')
          ..write('smellItems: $smellItems, ')
          ..write('tasteItems: $tasteItems, ')
          ..write('notes: $notes, ')
          ..write('cravingId: $cravingId, ')
          ..write('effectivenessRating: $effectivenessRating, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    exercise,
    startTime,
    endTime,
    seeItems,
    touchItems,
    hearItems,
    smellItems,
    tasteItems,
    notes,
    cravingId,
    effectivenessRating,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbGroundingSession &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.exercise == this.exercise &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.seeItems == this.seeItems &&
          other.touchItems == this.touchItems &&
          other.hearItems == this.hearItems &&
          other.smellItems == this.smellItems &&
          other.tasteItems == this.tasteItems &&
          other.notes == this.notes &&
          other.cravingId == this.cravingId &&
          other.effectivenessRating == this.effectivenessRating &&
          other.createdAt == this.createdAt);
}

class GroundingSessionsCompanion extends UpdateCompanion<DbGroundingSession> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> exercise;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<String?> seeItems;
  final Value<String?> touchItems;
  final Value<String?> hearItems;
  final Value<String?> smellItems;
  final Value<String?> tasteItems;
  final Value<String?> notes;
  final Value<int?> cravingId;
  final Value<int?> effectivenessRating;
  final Value<DateTime> createdAt;
  const GroundingSessionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.exercise = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.seeItems = const Value.absent(),
    this.touchItems = const Value.absent(),
    this.hearItems = const Value.absent(),
    this.smellItems = const Value.absent(),
    this.tasteItems = const Value.absent(),
    this.notes = const Value.absent(),
    this.cravingId = const Value.absent(),
    this.effectivenessRating = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  GroundingSessionsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String exercise,
    required DateTime startTime,
    this.endTime = const Value.absent(),
    this.seeItems = const Value.absent(),
    this.touchItems = const Value.absent(),
    this.hearItems = const Value.absent(),
    this.smellItems = const Value.absent(),
    this.tasteItems = const Value.absent(),
    this.notes = const Value.absent(),
    this.cravingId = const Value.absent(),
    this.effectivenessRating = const Value.absent(),
    required DateTime createdAt,
  }) : userId = Value(userId),
       exercise = Value(exercise),
       startTime = Value(startTime),
       createdAt = Value(createdAt);
  static Insertable<DbGroundingSession> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? exercise,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? seeItems,
    Expression<String>? touchItems,
    Expression<String>? hearItems,
    Expression<String>? smellItems,
    Expression<String>? tasteItems,
    Expression<String>? notes,
    Expression<int>? cravingId,
    Expression<int>? effectivenessRating,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (exercise != null) 'exercise': exercise,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (seeItems != null) 'see_items': seeItems,
      if (touchItems != null) 'touch_items': touchItems,
      if (hearItems != null) 'hear_items': hearItems,
      if (smellItems != null) 'smell_items': smellItems,
      if (tasteItems != null) 'taste_items': tasteItems,
      if (notes != null) 'notes': notes,
      if (cravingId != null) 'craving_id': cravingId,
      if (effectivenessRating != null)
        'effectiveness_rating': effectivenessRating,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  GroundingSessionsCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? exercise,
    Value<DateTime>? startTime,
    Value<DateTime?>? endTime,
    Value<String?>? seeItems,
    Value<String?>? touchItems,
    Value<String?>? hearItems,
    Value<String?>? smellItems,
    Value<String?>? tasteItems,
    Value<String?>? notes,
    Value<int?>? cravingId,
    Value<int?>? effectivenessRating,
    Value<DateTime>? createdAt,
  }) {
    return GroundingSessionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      exercise: exercise ?? this.exercise,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      seeItems: seeItems ?? this.seeItems,
      touchItems: touchItems ?? this.touchItems,
      hearItems: hearItems ?? this.hearItems,
      smellItems: smellItems ?? this.smellItems,
      tasteItems: tasteItems ?? this.tasteItems,
      notes: notes ?? this.notes,
      cravingId: cravingId ?? this.cravingId,
      effectivenessRating: effectivenessRating ?? this.effectivenessRating,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (exercise.present) {
      map['exercise'] = Variable<String>(exercise.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (seeItems.present) {
      map['see_items'] = Variable<String>(seeItems.value);
    }
    if (touchItems.present) {
      map['touch_items'] = Variable<String>(touchItems.value);
    }
    if (hearItems.present) {
      map['hear_items'] = Variable<String>(hearItems.value);
    }
    if (smellItems.present) {
      map['smell_items'] = Variable<String>(smellItems.value);
    }
    if (tasteItems.present) {
      map['taste_items'] = Variable<String>(tasteItems.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (cravingId.present) {
      map['craving_id'] = Variable<int>(cravingId.value);
    }
    if (effectivenessRating.present) {
      map['effectiveness_rating'] = Variable<int>(effectivenessRating.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroundingSessionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exercise: $exercise, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('seeItems: $seeItems, ')
          ..write('touchItems: $touchItems, ')
          ..write('hearItems: $hearItems, ')
          ..write('smellItems: $smellItems, ')
          ..write('tasteItems: $tasteItems, ')
          ..write('notes: $notes, ')
          ..write('cravingId: $cravingId, ')
          ..write('effectivenessRating: $effectivenessRating, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DistractionSessionsTable extends DistractionSessions
    with TableInfo<$DistractionSessionsTable, DbDistractionSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DistractionSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activityMeta = const VerificationMeta(
    'activity',
  );
  @override
  late final GeneratedColumn<String> activity = GeneratedColumn<String>(
    'activity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wasEffectiveMeta = const VerificationMeta(
    'wasEffective',
  );
  @override
  late final GeneratedColumn<bool> wasEffective = GeneratedColumn<bool>(
    'was_effective',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("was_effective" IN (0, 1))',
    ),
  );
  static const VerificationMeta _effectivenessRatingMeta =
      const VerificationMeta('effectivenessRating');
  @override
  late final GeneratedColumn<int> effectivenessRating = GeneratedColumn<int>(
    'effectiveness_rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cravingIdMeta = const VerificationMeta(
    'cravingId',
  );
  @override
  late final GeneratedColumn<int> cravingId = GeneratedColumn<int>(
    'craving_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    activity,
    startTime,
    endTime,
    wasEffective,
    effectivenessRating,
    cravingId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'distraction_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbDistractionSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('activity')) {
      context.handle(
        _activityMeta,
        activity.isAcceptableOrUnknown(data['activity']!, _activityMeta),
      );
    } else if (isInserting) {
      context.missing(_activityMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('was_effective')) {
      context.handle(
        _wasEffectiveMeta,
        wasEffective.isAcceptableOrUnknown(
          data['was_effective']!,
          _wasEffectiveMeta,
        ),
      );
    }
    if (data.containsKey('effectiveness_rating')) {
      context.handle(
        _effectivenessRatingMeta,
        effectivenessRating.isAcceptableOrUnknown(
          data['effectiveness_rating']!,
          _effectivenessRatingMeta,
        ),
      );
    }
    if (data.containsKey('craving_id')) {
      context.handle(
        _cravingIdMeta,
        cravingId.isAcceptableOrUnknown(data['craving_id']!, _cravingIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbDistractionSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbDistractionSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      activity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activity'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      ),
      wasEffective: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}was_effective'],
      ),
      effectivenessRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}effectiveness_rating'],
      ),
      cravingId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}craving_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DistractionSessionsTable createAlias(String alias) {
    return $DistractionSessionsTable(attachedDatabase, alias);
  }
}

class DbDistractionSession extends DataClass
    implements Insertable<DbDistractionSession> {
  final int id;
  final String userId;
  final String activity;
  final DateTime startTime;
  final DateTime? endTime;
  final bool? wasEffective;
  final int? effectivenessRating;
  final int? cravingId;
  final DateTime createdAt;
  const DbDistractionSession({
    required this.id,
    required this.userId,
    required this.activity,
    required this.startTime,
    this.endTime,
    this.wasEffective,
    this.effectivenessRating,
    this.cravingId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['activity'] = Variable<String>(activity);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    if (!nullToAbsent || wasEffective != null) {
      map['was_effective'] = Variable<bool>(wasEffective);
    }
    if (!nullToAbsent || effectivenessRating != null) {
      map['effectiveness_rating'] = Variable<int>(effectivenessRating);
    }
    if (!nullToAbsent || cravingId != null) {
      map['craving_id'] = Variable<int>(cravingId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DistractionSessionsCompanion toCompanion(bool nullToAbsent) {
    return DistractionSessionsCompanion(
      id: Value(id),
      userId: Value(userId),
      activity: Value(activity),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      wasEffective: wasEffective == null && nullToAbsent
          ? const Value.absent()
          : Value(wasEffective),
      effectivenessRating: effectivenessRating == null && nullToAbsent
          ? const Value.absent()
          : Value(effectivenessRating),
      cravingId: cravingId == null && nullToAbsent
          ? const Value.absent()
          : Value(cravingId),
      createdAt: Value(createdAt),
    );
  }

  factory DbDistractionSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbDistractionSession(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      activity: serializer.fromJson<String>(json['activity']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      wasEffective: serializer.fromJson<bool?>(json['wasEffective']),
      effectivenessRating: serializer.fromJson<int?>(
        json['effectivenessRating'],
      ),
      cravingId: serializer.fromJson<int?>(json['cravingId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'activity': serializer.toJson<String>(activity),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'wasEffective': serializer.toJson<bool?>(wasEffective),
      'effectivenessRating': serializer.toJson<int?>(effectivenessRating),
      'cravingId': serializer.toJson<int?>(cravingId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DbDistractionSession copyWith({
    int? id,
    String? userId,
    String? activity,
    DateTime? startTime,
    Value<DateTime?> endTime = const Value.absent(),
    Value<bool?> wasEffective = const Value.absent(),
    Value<int?> effectivenessRating = const Value.absent(),
    Value<int?> cravingId = const Value.absent(),
    DateTime? createdAt,
  }) => DbDistractionSession(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    activity: activity ?? this.activity,
    startTime: startTime ?? this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    wasEffective: wasEffective.present ? wasEffective.value : this.wasEffective,
    effectivenessRating: effectivenessRating.present
        ? effectivenessRating.value
        : this.effectivenessRating,
    cravingId: cravingId.present ? cravingId.value : this.cravingId,
    createdAt: createdAt ?? this.createdAt,
  );
  DbDistractionSession copyWithCompanion(DistractionSessionsCompanion data) {
    return DbDistractionSession(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      activity: data.activity.present ? data.activity.value : this.activity,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      wasEffective: data.wasEffective.present
          ? data.wasEffective.value
          : this.wasEffective,
      effectivenessRating: data.effectivenessRating.present
          ? data.effectivenessRating.value
          : this.effectivenessRating,
      cravingId: data.cravingId.present ? data.cravingId.value : this.cravingId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbDistractionSession(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('activity: $activity, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('wasEffective: $wasEffective, ')
          ..write('effectivenessRating: $effectivenessRating, ')
          ..write('cravingId: $cravingId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    activity,
    startTime,
    endTime,
    wasEffective,
    effectivenessRating,
    cravingId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbDistractionSession &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.activity == this.activity &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.wasEffective == this.wasEffective &&
          other.effectivenessRating == this.effectivenessRating &&
          other.cravingId == this.cravingId &&
          other.createdAt == this.createdAt);
}

class DistractionSessionsCompanion
    extends UpdateCompanion<DbDistractionSession> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> activity;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<bool?> wasEffective;
  final Value<int?> effectivenessRating;
  final Value<int?> cravingId;
  final Value<DateTime> createdAt;
  const DistractionSessionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.activity = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.wasEffective = const Value.absent(),
    this.effectivenessRating = const Value.absent(),
    this.cravingId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DistractionSessionsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String activity,
    required DateTime startTime,
    this.endTime = const Value.absent(),
    this.wasEffective = const Value.absent(),
    this.effectivenessRating = const Value.absent(),
    this.cravingId = const Value.absent(),
    required DateTime createdAt,
  }) : userId = Value(userId),
       activity = Value(activity),
       startTime = Value(startTime),
       createdAt = Value(createdAt);
  static Insertable<DbDistractionSession> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? activity,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<bool>? wasEffective,
    Expression<int>? effectivenessRating,
    Expression<int>? cravingId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (activity != null) 'activity': activity,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (wasEffective != null) 'was_effective': wasEffective,
      if (effectivenessRating != null)
        'effectiveness_rating': effectivenessRating,
      if (cravingId != null) 'craving_id': cravingId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DistractionSessionsCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? activity,
    Value<DateTime>? startTime,
    Value<DateTime?>? endTime,
    Value<bool?>? wasEffective,
    Value<int?>? effectivenessRating,
    Value<int?>? cravingId,
    Value<DateTime>? createdAt,
  }) {
    return DistractionSessionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      activity: activity ?? this.activity,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      wasEffective: wasEffective ?? this.wasEffective,
      effectivenessRating: effectivenessRating ?? this.effectivenessRating,
      cravingId: cravingId ?? this.cravingId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (activity.present) {
      map['activity'] = Variable<String>(activity.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (wasEffective.present) {
      map['was_effective'] = Variable<bool>(wasEffective.value);
    }
    if (effectivenessRating.present) {
      map['effectiveness_rating'] = Variable<int>(effectivenessRating.value);
    }
    if (cravingId.present) {
      map['craving_id'] = Variable<int>(cravingId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DistractionSessionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('activity: $activity, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('wasEffective: $wasEffective, ')
          ..write('effectivenessRating: $effectivenessRating, ')
          ..write('cravingId: $cravingId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ToolkitExercisesTable extends ToolkitExercises
    with TableInfo<$ToolkitExercisesTable, DbToolkitExercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToolkitExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _lastUsedAtMeta = const VerificationMeta(
    'lastUsedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUsedAt = GeneratedColumn<DateTime>(
    'last_used_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationEstimateSecondsMeta =
      const VerificationMeta('durationEstimateSeconds');
  @override
  late final GeneratedColumn<int> durationEstimateSeconds =
      GeneratedColumn<int>(
        'duration_estimate_seconds',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _isSharedBothModesMeta = const VerificationMeta(
    'isSharedBothModes',
  );
  @override
  late final GeneratedColumn<bool> isSharedBothModes = GeneratedColumn<bool>(
    'is_shared_both_modes',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_shared_both_modes" IN (0, 1))',
    ),
  );
  static const VerificationMeta _modeFilterMeta = const VerificationMeta(
    'modeFilter',
  );
  @override
  late final GeneratedColumn<String> modeFilter = GeneratedColumn<String>(
    'mode_filter',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shortDescriptionMeta = const VerificationMeta(
    'shortDescription',
  );
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
    'short_description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullInstructionsMeta = const VerificationMeta(
    'fullInstructions',
  );
  @override
  late final GeneratedColumn<String> fullInstructions = GeneratedColumn<String>(
    'full_instructions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modeSpecificNoteMeta = const VerificationMeta(
    'modeSpecificNote',
  );
  @override
  late final GeneratedColumn<String> modeSpecificNote = GeneratedColumn<String>(
    'mode_specific_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seededAtMeta = const VerificationMeta(
    'seededAt',
  );
  @override
  late final GeneratedColumn<DateTime> seededAt = GeneratedColumn<DateTime>(
    'seeded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    exerciseId,
    name,
    category,
    isFavorite,
    lastUsedAt,
    durationEstimateSeconds,
    isSharedBothModes,
    modeFilter,
    shortDescription,
    fullInstructions,
    modeSpecificNote,
    seededAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'toolkit_exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbToolkitExercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('last_used_at')) {
      context.handle(
        _lastUsedAtMeta,
        lastUsedAt.isAcceptableOrUnknown(
          data['last_used_at']!,
          _lastUsedAtMeta,
        ),
      );
    }
    if (data.containsKey('duration_estimate_seconds')) {
      context.handle(
        _durationEstimateSecondsMeta,
        durationEstimateSeconds.isAcceptableOrUnknown(
          data['duration_estimate_seconds']!,
          _durationEstimateSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationEstimateSecondsMeta);
    }
    if (data.containsKey('is_shared_both_modes')) {
      context.handle(
        _isSharedBothModesMeta,
        isSharedBothModes.isAcceptableOrUnknown(
          data['is_shared_both_modes']!,
          _isSharedBothModesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isSharedBothModesMeta);
    }
    if (data.containsKey('mode_filter')) {
      context.handle(
        _modeFilterMeta,
        modeFilter.isAcceptableOrUnknown(data['mode_filter']!, _modeFilterMeta),
      );
    }
    if (data.containsKey('short_description')) {
      context.handle(
        _shortDescriptionMeta,
        shortDescription.isAcceptableOrUnknown(
          data['short_description']!,
          _shortDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shortDescriptionMeta);
    }
    if (data.containsKey('full_instructions')) {
      context.handle(
        _fullInstructionsMeta,
        fullInstructions.isAcceptableOrUnknown(
          data['full_instructions']!,
          _fullInstructionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fullInstructionsMeta);
    }
    if (data.containsKey('mode_specific_note')) {
      context.handle(
        _modeSpecificNoteMeta,
        modeSpecificNote.isAcceptableOrUnknown(
          data['mode_specific_note']!,
          _modeSpecificNoteMeta,
        ),
      );
    }
    if (data.containsKey('seeded_at')) {
      context.handle(
        _seededAtMeta,
        seededAt.isAcceptableOrUnknown(data['seeded_at']!, _seededAtMeta),
      );
    } else if (isInserting) {
      context.missing(_seededAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbToolkitExercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbToolkitExercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      lastUsedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_used_at'],
      ),
      durationEstimateSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_estimate_seconds'],
      )!,
      isSharedBothModes: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_shared_both_modes'],
      )!,
      modeFilter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode_filter'],
      ),
      shortDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_description'],
      )!,
      fullInstructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_instructions'],
      )!,
      modeSpecificNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode_specific_note'],
      ),
      seededAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}seeded_at'],
      )!,
    );
  }

  @override
  $ToolkitExercisesTable createAlias(String alias) {
    return $ToolkitExercisesTable(attachedDatabase, alias);
  }
}

class DbToolkitExercise extends DataClass
    implements Insertable<DbToolkitExercise> {
  final int id;
  final String exerciseId;
  final String name;
  final String category;
  final bool isFavorite;
  final DateTime? lastUsedAt;
  final int durationEstimateSeconds;
  final bool isSharedBothModes;
  final String? modeFilter;
  final String shortDescription;
  final String fullInstructions;
  final String? modeSpecificNote;
  final DateTime seededAt;
  const DbToolkitExercise({
    required this.id,
    required this.exerciseId,
    required this.name,
    required this.category,
    required this.isFavorite,
    this.lastUsedAt,
    required this.durationEstimateSeconds,
    required this.isSharedBothModes,
    this.modeFilter,
    required this.shortDescription,
    required this.fullInstructions,
    this.modeSpecificNote,
    required this.seededAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['is_favorite'] = Variable<bool>(isFavorite);
    if (!nullToAbsent || lastUsedAt != null) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt);
    }
    map['duration_estimate_seconds'] = Variable<int>(durationEstimateSeconds);
    map['is_shared_both_modes'] = Variable<bool>(isSharedBothModes);
    if (!nullToAbsent || modeFilter != null) {
      map['mode_filter'] = Variable<String>(modeFilter);
    }
    map['short_description'] = Variable<String>(shortDescription);
    map['full_instructions'] = Variable<String>(fullInstructions);
    if (!nullToAbsent || modeSpecificNote != null) {
      map['mode_specific_note'] = Variable<String>(modeSpecificNote);
    }
    map['seeded_at'] = Variable<DateTime>(seededAt);
    return map;
  }

  ToolkitExercisesCompanion toCompanion(bool nullToAbsent) {
    return ToolkitExercisesCompanion(
      id: Value(id),
      exerciseId: Value(exerciseId),
      name: Value(name),
      category: Value(category),
      isFavorite: Value(isFavorite),
      lastUsedAt: lastUsedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUsedAt),
      durationEstimateSeconds: Value(durationEstimateSeconds),
      isSharedBothModes: Value(isSharedBothModes),
      modeFilter: modeFilter == null && nullToAbsent
          ? const Value.absent()
          : Value(modeFilter),
      shortDescription: Value(shortDescription),
      fullInstructions: Value(fullInstructions),
      modeSpecificNote: modeSpecificNote == null && nullToAbsent
          ? const Value.absent()
          : Value(modeSpecificNote),
      seededAt: Value(seededAt),
    );
  }

  factory DbToolkitExercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbToolkitExercise(
      id: serializer.fromJson<int>(json['id']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      lastUsedAt: serializer.fromJson<DateTime?>(json['lastUsedAt']),
      durationEstimateSeconds: serializer.fromJson<int>(
        json['durationEstimateSeconds'],
      ),
      isSharedBothModes: serializer.fromJson<bool>(json['isSharedBothModes']),
      modeFilter: serializer.fromJson<String?>(json['modeFilter']),
      shortDescription: serializer.fromJson<String>(json['shortDescription']),
      fullInstructions: serializer.fromJson<String>(json['fullInstructions']),
      modeSpecificNote: serializer.fromJson<String?>(json['modeSpecificNote']),
      seededAt: serializer.fromJson<DateTime>(json['seededAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'lastUsedAt': serializer.toJson<DateTime?>(lastUsedAt),
      'durationEstimateSeconds': serializer.toJson<int>(
        durationEstimateSeconds,
      ),
      'isSharedBothModes': serializer.toJson<bool>(isSharedBothModes),
      'modeFilter': serializer.toJson<String?>(modeFilter),
      'shortDescription': serializer.toJson<String>(shortDescription),
      'fullInstructions': serializer.toJson<String>(fullInstructions),
      'modeSpecificNote': serializer.toJson<String?>(modeSpecificNote),
      'seededAt': serializer.toJson<DateTime>(seededAt),
    };
  }

  DbToolkitExercise copyWith({
    int? id,
    String? exerciseId,
    String? name,
    String? category,
    bool? isFavorite,
    Value<DateTime?> lastUsedAt = const Value.absent(),
    int? durationEstimateSeconds,
    bool? isSharedBothModes,
    Value<String?> modeFilter = const Value.absent(),
    String? shortDescription,
    String? fullInstructions,
    Value<String?> modeSpecificNote = const Value.absent(),
    DateTime? seededAt,
  }) => DbToolkitExercise(
    id: id ?? this.id,
    exerciseId: exerciseId ?? this.exerciseId,
    name: name ?? this.name,
    category: category ?? this.category,
    isFavorite: isFavorite ?? this.isFavorite,
    lastUsedAt: lastUsedAt.present ? lastUsedAt.value : this.lastUsedAt,
    durationEstimateSeconds:
        durationEstimateSeconds ?? this.durationEstimateSeconds,
    isSharedBothModes: isSharedBothModes ?? this.isSharedBothModes,
    modeFilter: modeFilter.present ? modeFilter.value : this.modeFilter,
    shortDescription: shortDescription ?? this.shortDescription,
    fullInstructions: fullInstructions ?? this.fullInstructions,
    modeSpecificNote: modeSpecificNote.present
        ? modeSpecificNote.value
        : this.modeSpecificNote,
    seededAt: seededAt ?? this.seededAt,
  );
  DbToolkitExercise copyWithCompanion(ToolkitExercisesCompanion data) {
    return DbToolkitExercise(
      id: data.id.present ? data.id.value : this.id,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      lastUsedAt: data.lastUsedAt.present
          ? data.lastUsedAt.value
          : this.lastUsedAt,
      durationEstimateSeconds: data.durationEstimateSeconds.present
          ? data.durationEstimateSeconds.value
          : this.durationEstimateSeconds,
      isSharedBothModes: data.isSharedBothModes.present
          ? data.isSharedBothModes.value
          : this.isSharedBothModes,
      modeFilter: data.modeFilter.present
          ? data.modeFilter.value
          : this.modeFilter,
      shortDescription: data.shortDescription.present
          ? data.shortDescription.value
          : this.shortDescription,
      fullInstructions: data.fullInstructions.present
          ? data.fullInstructions.value
          : this.fullInstructions,
      modeSpecificNote: data.modeSpecificNote.present
          ? data.modeSpecificNote.value
          : this.modeSpecificNote,
      seededAt: data.seededAt.present ? data.seededAt.value : this.seededAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbToolkitExercise(')
          ..write('id: $id, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('durationEstimateSeconds: $durationEstimateSeconds, ')
          ..write('isSharedBothModes: $isSharedBothModes, ')
          ..write('modeFilter: $modeFilter, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('fullInstructions: $fullInstructions, ')
          ..write('modeSpecificNote: $modeSpecificNote, ')
          ..write('seededAt: $seededAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    exerciseId,
    name,
    category,
    isFavorite,
    lastUsedAt,
    durationEstimateSeconds,
    isSharedBothModes,
    modeFilter,
    shortDescription,
    fullInstructions,
    modeSpecificNote,
    seededAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbToolkitExercise &&
          other.id == this.id &&
          other.exerciseId == this.exerciseId &&
          other.name == this.name &&
          other.category == this.category &&
          other.isFavorite == this.isFavorite &&
          other.lastUsedAt == this.lastUsedAt &&
          other.durationEstimateSeconds == this.durationEstimateSeconds &&
          other.isSharedBothModes == this.isSharedBothModes &&
          other.modeFilter == this.modeFilter &&
          other.shortDescription == this.shortDescription &&
          other.fullInstructions == this.fullInstructions &&
          other.modeSpecificNote == this.modeSpecificNote &&
          other.seededAt == this.seededAt);
}

class ToolkitExercisesCompanion extends UpdateCompanion<DbToolkitExercise> {
  final Value<int> id;
  final Value<String> exerciseId;
  final Value<String> name;
  final Value<String> category;
  final Value<bool> isFavorite;
  final Value<DateTime?> lastUsedAt;
  final Value<int> durationEstimateSeconds;
  final Value<bool> isSharedBothModes;
  final Value<String?> modeFilter;
  final Value<String> shortDescription;
  final Value<String> fullInstructions;
  final Value<String?> modeSpecificNote;
  final Value<DateTime> seededAt;
  const ToolkitExercisesCompanion({
    this.id = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    this.durationEstimateSeconds = const Value.absent(),
    this.isSharedBothModes = const Value.absent(),
    this.modeFilter = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.fullInstructions = const Value.absent(),
    this.modeSpecificNote = const Value.absent(),
    this.seededAt = const Value.absent(),
  });
  ToolkitExercisesCompanion.insert({
    this.id = const Value.absent(),
    required String exerciseId,
    required String name,
    required String category,
    this.isFavorite = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    required int durationEstimateSeconds,
    required bool isSharedBothModes,
    this.modeFilter = const Value.absent(),
    required String shortDescription,
    required String fullInstructions,
    this.modeSpecificNote = const Value.absent(),
    required DateTime seededAt,
  }) : exerciseId = Value(exerciseId),
       name = Value(name),
       category = Value(category),
       durationEstimateSeconds = Value(durationEstimateSeconds),
       isSharedBothModes = Value(isSharedBothModes),
       shortDescription = Value(shortDescription),
       fullInstructions = Value(fullInstructions),
       seededAt = Value(seededAt);
  static Insertable<DbToolkitExercise> custom({
    Expression<int>? id,
    Expression<String>? exerciseId,
    Expression<String>? name,
    Expression<String>? category,
    Expression<bool>? isFavorite,
    Expression<DateTime>? lastUsedAt,
    Expression<int>? durationEstimateSeconds,
    Expression<bool>? isSharedBothModes,
    Expression<String>? modeFilter,
    Expression<String>? shortDescription,
    Expression<String>? fullInstructions,
    Expression<String>? modeSpecificNote,
    Expression<DateTime>? seededAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (lastUsedAt != null) 'last_used_at': lastUsedAt,
      if (durationEstimateSeconds != null)
        'duration_estimate_seconds': durationEstimateSeconds,
      if (isSharedBothModes != null) 'is_shared_both_modes': isSharedBothModes,
      if (modeFilter != null) 'mode_filter': modeFilter,
      if (shortDescription != null) 'short_description': shortDescription,
      if (fullInstructions != null) 'full_instructions': fullInstructions,
      if (modeSpecificNote != null) 'mode_specific_note': modeSpecificNote,
      if (seededAt != null) 'seeded_at': seededAt,
    });
  }

  ToolkitExercisesCompanion copyWith({
    Value<int>? id,
    Value<String>? exerciseId,
    Value<String>? name,
    Value<String>? category,
    Value<bool>? isFavorite,
    Value<DateTime?>? lastUsedAt,
    Value<int>? durationEstimateSeconds,
    Value<bool>? isSharedBothModes,
    Value<String?>? modeFilter,
    Value<String>? shortDescription,
    Value<String>? fullInstructions,
    Value<String?>? modeSpecificNote,
    Value<DateTime>? seededAt,
  }) {
    return ToolkitExercisesCompanion(
      id: id ?? this.id,
      exerciseId: exerciseId ?? this.exerciseId,
      name: name ?? this.name,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      durationEstimateSeconds:
          durationEstimateSeconds ?? this.durationEstimateSeconds,
      isSharedBothModes: isSharedBothModes ?? this.isSharedBothModes,
      modeFilter: modeFilter ?? this.modeFilter,
      shortDescription: shortDescription ?? this.shortDescription,
      fullInstructions: fullInstructions ?? this.fullInstructions,
      modeSpecificNote: modeSpecificNote ?? this.modeSpecificNote,
      seededAt: seededAt ?? this.seededAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (lastUsedAt.present) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt.value);
    }
    if (durationEstimateSeconds.present) {
      map['duration_estimate_seconds'] = Variable<int>(
        durationEstimateSeconds.value,
      );
    }
    if (isSharedBothModes.present) {
      map['is_shared_both_modes'] = Variable<bool>(isSharedBothModes.value);
    }
    if (modeFilter.present) {
      map['mode_filter'] = Variable<String>(modeFilter.value);
    }
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (fullInstructions.present) {
      map['full_instructions'] = Variable<String>(fullInstructions.value);
    }
    if (modeSpecificNote.present) {
      map['mode_specific_note'] = Variable<String>(modeSpecificNote.value);
    }
    if (seededAt.present) {
      map['seeded_at'] = Variable<DateTime>(seededAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToolkitExercisesCompanion(')
          ..write('id: $id, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('durationEstimateSeconds: $durationEstimateSeconds, ')
          ..write('isSharedBothModes: $isSharedBothModes, ')
          ..write('modeFilter: $modeFilter, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('fullInstructions: $fullInstructions, ')
          ..write('modeSpecificNote: $modeSpecificNote, ')
          ..write('seededAt: $seededAt')
          ..write(')'))
        .toString();
  }
}

class $ToolkitSessionsTable extends ToolkitSessions
    with TableInfo<$ToolkitSessionsTable, DbToolkitSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToolkitSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseNameMeta = const VerificationMeta(
    'exerciseName',
  );
  @override
  late final GeneratedColumn<String> exerciseName = GeneratedColumn<String>(
    'exercise_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseCategoryMeta = const VerificationMeta(
    'exerciseCategory',
  );
  @override
  late final GeneratedColumn<String> exerciseCategory = GeneratedColumn<String>(
    'exercise_category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _feedbackRatingMeta = const VerificationMeta(
    'feedbackRating',
  );
  @override
  late final GeneratedColumn<int> feedbackRating = GeneratedColumn<int>(
    'feedback_rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _linkedJournalEntryIdMeta =
      const VerificationMeta('linkedJournalEntryId');
  @override
  late final GeneratedColumn<String> linkedJournalEntryId =
      GeneratedColumn<String>(
        'linked_journal_entry_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    exerciseId,
    exerciseName,
    exerciseCategory,
    startedAt,
    completedAt,
    feedbackRating,
    mode,
    linkedJournalEntryId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'toolkit_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbToolkitSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('exercise_name')) {
      context.handle(
        _exerciseNameMeta,
        exerciseName.isAcceptableOrUnknown(
          data['exercise_name']!,
          _exerciseNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseNameMeta);
    }
    if (data.containsKey('exercise_category')) {
      context.handle(
        _exerciseCategoryMeta,
        exerciseCategory.isAcceptableOrUnknown(
          data['exercise_category']!,
          _exerciseCategoryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseCategoryMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('feedback_rating')) {
      context.handle(
        _feedbackRatingMeta,
        feedbackRating.isAcceptableOrUnknown(
          data['feedback_rating']!,
          _feedbackRatingMeta,
        ),
      );
    }
    if (data.containsKey('mode')) {
      context.handle(
        _modeMeta,
        mode.isAcceptableOrUnknown(data['mode']!, _modeMeta),
      );
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('linked_journal_entry_id')) {
      context.handle(
        _linkedJournalEntryIdMeta,
        linkedJournalEntryId.isAcceptableOrUnknown(
          data['linked_journal_entry_id']!,
          _linkedJournalEntryIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbToolkitSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbToolkitSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      exerciseName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_name'],
      )!,
      exerciseCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_category'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      feedbackRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}feedback_rating'],
      ),
      mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode'],
      )!,
      linkedJournalEntryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_journal_entry_id'],
      ),
    );
  }

  @override
  $ToolkitSessionsTable createAlias(String alias) {
    return $ToolkitSessionsTable(attachedDatabase, alias);
  }
}

class DbToolkitSession extends DataClass
    implements Insertable<DbToolkitSession> {
  final int id;
  final String userId;
  final String exerciseId;
  final String exerciseName;
  final String exerciseCategory;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int? feedbackRating;
  final String mode;
  final String? linkedJournalEntryId;
  const DbToolkitSession({
    required this.id,
    required this.userId,
    required this.exerciseId,
    required this.exerciseName,
    required this.exerciseCategory,
    required this.startedAt,
    this.completedAt,
    this.feedbackRating,
    required this.mode,
    this.linkedJournalEntryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['exercise_name'] = Variable<String>(exerciseName);
    map['exercise_category'] = Variable<String>(exerciseCategory);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || feedbackRating != null) {
      map['feedback_rating'] = Variable<int>(feedbackRating);
    }
    map['mode'] = Variable<String>(mode);
    if (!nullToAbsent || linkedJournalEntryId != null) {
      map['linked_journal_entry_id'] = Variable<String>(linkedJournalEntryId);
    }
    return map;
  }

  ToolkitSessionsCompanion toCompanion(bool nullToAbsent) {
    return ToolkitSessionsCompanion(
      id: Value(id),
      userId: Value(userId),
      exerciseId: Value(exerciseId),
      exerciseName: Value(exerciseName),
      exerciseCategory: Value(exerciseCategory),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      feedbackRating: feedbackRating == null && nullToAbsent
          ? const Value.absent()
          : Value(feedbackRating),
      mode: Value(mode),
      linkedJournalEntryId: linkedJournalEntryId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedJournalEntryId),
    );
  }

  factory DbToolkitSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbToolkitSession(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      exerciseName: serializer.fromJson<String>(json['exerciseName']),
      exerciseCategory: serializer.fromJson<String>(json['exerciseCategory']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      feedbackRating: serializer.fromJson<int?>(json['feedbackRating']),
      mode: serializer.fromJson<String>(json['mode']),
      linkedJournalEntryId: serializer.fromJson<String?>(
        json['linkedJournalEntryId'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'exerciseName': serializer.toJson<String>(exerciseName),
      'exerciseCategory': serializer.toJson<String>(exerciseCategory),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'feedbackRating': serializer.toJson<int?>(feedbackRating),
      'mode': serializer.toJson<String>(mode),
      'linkedJournalEntryId': serializer.toJson<String?>(linkedJournalEntryId),
    };
  }

  DbToolkitSession copyWith({
    int? id,
    String? userId,
    String? exerciseId,
    String? exerciseName,
    String? exerciseCategory,
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    Value<int?> feedbackRating = const Value.absent(),
    String? mode,
    Value<String?> linkedJournalEntryId = const Value.absent(),
  }) => DbToolkitSession(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    exerciseId: exerciseId ?? this.exerciseId,
    exerciseName: exerciseName ?? this.exerciseName,
    exerciseCategory: exerciseCategory ?? this.exerciseCategory,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    feedbackRating: feedbackRating.present
        ? feedbackRating.value
        : this.feedbackRating,
    mode: mode ?? this.mode,
    linkedJournalEntryId: linkedJournalEntryId.present
        ? linkedJournalEntryId.value
        : this.linkedJournalEntryId,
  );
  DbToolkitSession copyWithCompanion(ToolkitSessionsCompanion data) {
    return DbToolkitSession(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      exerciseName: data.exerciseName.present
          ? data.exerciseName.value
          : this.exerciseName,
      exerciseCategory: data.exerciseCategory.present
          ? data.exerciseCategory.value
          : this.exerciseCategory,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      feedbackRating: data.feedbackRating.present
          ? data.feedbackRating.value
          : this.feedbackRating,
      mode: data.mode.present ? data.mode.value : this.mode,
      linkedJournalEntryId: data.linkedJournalEntryId.present
          ? data.linkedJournalEntryId.value
          : this.linkedJournalEntryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbToolkitSession(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseName: $exerciseName, ')
          ..write('exerciseCategory: $exerciseCategory, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('feedbackRating: $feedbackRating, ')
          ..write('mode: $mode, ')
          ..write('linkedJournalEntryId: $linkedJournalEntryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    exerciseId,
    exerciseName,
    exerciseCategory,
    startedAt,
    completedAt,
    feedbackRating,
    mode,
    linkedJournalEntryId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbToolkitSession &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.exerciseId == this.exerciseId &&
          other.exerciseName == this.exerciseName &&
          other.exerciseCategory == this.exerciseCategory &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.feedbackRating == this.feedbackRating &&
          other.mode == this.mode &&
          other.linkedJournalEntryId == this.linkedJournalEntryId);
}

class ToolkitSessionsCompanion extends UpdateCompanion<DbToolkitSession> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> exerciseId;
  final Value<String> exerciseName;
  final Value<String> exerciseCategory;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<int?> feedbackRating;
  final Value<String> mode;
  final Value<String?> linkedJournalEntryId;
  const ToolkitSessionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.exerciseName = const Value.absent(),
    this.exerciseCategory = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.feedbackRating = const Value.absent(),
    this.mode = const Value.absent(),
    this.linkedJournalEntryId = const Value.absent(),
  });
  ToolkitSessionsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String exerciseId,
    required String exerciseName,
    required String exerciseCategory,
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    this.feedbackRating = const Value.absent(),
    required String mode,
    this.linkedJournalEntryId = const Value.absent(),
  }) : userId = Value(userId),
       exerciseId = Value(exerciseId),
       exerciseName = Value(exerciseName),
       exerciseCategory = Value(exerciseCategory),
       startedAt = Value(startedAt),
       mode = Value(mode);
  static Insertable<DbToolkitSession> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? exerciseId,
    Expression<String>? exerciseName,
    Expression<String>? exerciseCategory,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? feedbackRating,
    Expression<String>? mode,
    Expression<String>? linkedJournalEntryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (exerciseName != null) 'exercise_name': exerciseName,
      if (exerciseCategory != null) 'exercise_category': exerciseCategory,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (feedbackRating != null) 'feedback_rating': feedbackRating,
      if (mode != null) 'mode': mode,
      if (linkedJournalEntryId != null)
        'linked_journal_entry_id': linkedJournalEntryId,
    });
  }

  ToolkitSessionsCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? exerciseId,
    Value<String>? exerciseName,
    Value<String>? exerciseCategory,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<int?>? feedbackRating,
    Value<String>? mode,
    Value<String?>? linkedJournalEntryId,
  }) {
    return ToolkitSessionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseName: exerciseName ?? this.exerciseName,
      exerciseCategory: exerciseCategory ?? this.exerciseCategory,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      feedbackRating: feedbackRating ?? this.feedbackRating,
      mode: mode ?? this.mode,
      linkedJournalEntryId: linkedJournalEntryId ?? this.linkedJournalEntryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (exerciseName.present) {
      map['exercise_name'] = Variable<String>(exerciseName.value);
    }
    if (exerciseCategory.present) {
      map['exercise_category'] = Variable<String>(exerciseCategory.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (feedbackRating.present) {
      map['feedback_rating'] = Variable<int>(feedbackRating.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (linkedJournalEntryId.present) {
      map['linked_journal_entry_id'] = Variable<String>(
        linkedJournalEntryId.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToolkitSessionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseName: $exerciseName, ')
          ..write('exerciseCategory: $exerciseCategory, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('feedbackRating: $feedbackRating, ')
          ..write('mode: $mode, ')
          ..write('linkedJournalEntryId: $linkedJournalEntryId')
          ..write(')'))
        .toString();
  }
}

class $JournalEntriesTable extends JournalEntries
    with TableInfo<$JournalEntriesTable, DbJournalEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entryIdMeta = const VerificationMeta(
    'entryId',
  );
  @override
  late final GeneratedColumn<String> entryId = GeneratedColumn<String>(
    'entry_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moodTagMeta = const VerificationMeta(
    'moodTag',
  );
  @override
  late final GeneratedColumn<String> moodTag = GeneratedColumn<String>(
    'mood_tag',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceExerciseIdMeta = const VerificationMeta(
    'sourceExerciseId',
  );
  @override
  late final GeneratedColumn<String> sourceExerciseId = GeneratedColumn<String>(
    'source_exercise_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceExerciseNameMeta =
      const VerificationMeta('sourceExerciseName');
  @override
  late final GeneratedColumn<String> sourceExerciseName =
      GeneratedColumn<String>(
        'source_exercise_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entryId,
    userId,
    createdAt,
    updatedAt,
    content,
    moodTag,
    sourceExerciseId,
    sourceExerciseName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbJournalEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entry_id')) {
      context.handle(
        _entryIdMeta,
        entryId.isAcceptableOrUnknown(data['entry_id']!, _entryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('mood_tag')) {
      context.handle(
        _moodTagMeta,
        moodTag.isAcceptableOrUnknown(data['mood_tag']!, _moodTagMeta),
      );
    }
    if (data.containsKey('source_exercise_id')) {
      context.handle(
        _sourceExerciseIdMeta,
        sourceExerciseId.isAcceptableOrUnknown(
          data['source_exercise_id']!,
          _sourceExerciseIdMeta,
        ),
      );
    }
    if (data.containsKey('source_exercise_name')) {
      context.handle(
        _sourceExerciseNameMeta,
        sourceExerciseName.isAcceptableOrUnknown(
          data['source_exercise_name']!,
          _sourceExerciseNameMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbJournalEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbJournalEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entry_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      moodTag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mood_tag'],
      ),
      sourceExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_exercise_id'],
      ),
      sourceExerciseName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_exercise_name'],
      ),
    );
  }

  @override
  $JournalEntriesTable createAlias(String alias) {
    return $JournalEntriesTable(attachedDatabase, alias);
  }
}

class DbJournalEntry extends DataClass implements Insertable<DbJournalEntry> {
  final int id;
  final String entryId;
  final String userId;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String content;
  final String? moodTag;
  final String? sourceExerciseId;
  final String? sourceExerciseName;
  const DbJournalEntry({
    required this.id,
    required this.entryId,
    required this.userId,
    required this.createdAt,
    this.updatedAt,
    required this.content,
    this.moodTag,
    this.sourceExerciseId,
    this.sourceExerciseName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entry_id'] = Variable<String>(entryId);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || moodTag != null) {
      map['mood_tag'] = Variable<String>(moodTag);
    }
    if (!nullToAbsent || sourceExerciseId != null) {
      map['source_exercise_id'] = Variable<String>(sourceExerciseId);
    }
    if (!nullToAbsent || sourceExerciseName != null) {
      map['source_exercise_name'] = Variable<String>(sourceExerciseName);
    }
    return map;
  }

  JournalEntriesCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesCompanion(
      id: Value(id),
      entryId: Value(entryId),
      userId: Value(userId),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      content: Value(content),
      moodTag: moodTag == null && nullToAbsent
          ? const Value.absent()
          : Value(moodTag),
      sourceExerciseId: sourceExerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceExerciseId),
      sourceExerciseName: sourceExerciseName == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceExerciseName),
    );
  }

  factory DbJournalEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbJournalEntry(
      id: serializer.fromJson<int>(json['id']),
      entryId: serializer.fromJson<String>(json['entryId']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      content: serializer.fromJson<String>(json['content']),
      moodTag: serializer.fromJson<String?>(json['moodTag']),
      sourceExerciseId: serializer.fromJson<String?>(json['sourceExerciseId']),
      sourceExerciseName: serializer.fromJson<String?>(
        json['sourceExerciseName'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entryId': serializer.toJson<String>(entryId),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'content': serializer.toJson<String>(content),
      'moodTag': serializer.toJson<String?>(moodTag),
      'sourceExerciseId': serializer.toJson<String?>(sourceExerciseId),
      'sourceExerciseName': serializer.toJson<String?>(sourceExerciseName),
    };
  }

  DbJournalEntry copyWith({
    int? id,
    String? entryId,
    String? userId,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
    String? content,
    Value<String?> moodTag = const Value.absent(),
    Value<String?> sourceExerciseId = const Value.absent(),
    Value<String?> sourceExerciseName = const Value.absent(),
  }) => DbJournalEntry(
    id: id ?? this.id,
    entryId: entryId ?? this.entryId,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    content: content ?? this.content,
    moodTag: moodTag.present ? moodTag.value : this.moodTag,
    sourceExerciseId: sourceExerciseId.present
        ? sourceExerciseId.value
        : this.sourceExerciseId,
    sourceExerciseName: sourceExerciseName.present
        ? sourceExerciseName.value
        : this.sourceExerciseName,
  );
  DbJournalEntry copyWithCompanion(JournalEntriesCompanion data) {
    return DbJournalEntry(
      id: data.id.present ? data.id.value : this.id,
      entryId: data.entryId.present ? data.entryId.value : this.entryId,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      content: data.content.present ? data.content.value : this.content,
      moodTag: data.moodTag.present ? data.moodTag.value : this.moodTag,
      sourceExerciseId: data.sourceExerciseId.present
          ? data.sourceExerciseId.value
          : this.sourceExerciseId,
      sourceExerciseName: data.sourceExerciseName.present
          ? data.sourceExerciseName.value
          : this.sourceExerciseName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbJournalEntry(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('content: $content, ')
          ..write('moodTag: $moodTag, ')
          ..write('sourceExerciseId: $sourceExerciseId, ')
          ..write('sourceExerciseName: $sourceExerciseName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entryId,
    userId,
    createdAt,
    updatedAt,
    content,
    moodTag,
    sourceExerciseId,
    sourceExerciseName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbJournalEntry &&
          other.id == this.id &&
          other.entryId == this.entryId &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.content == this.content &&
          other.moodTag == this.moodTag &&
          other.sourceExerciseId == this.sourceExerciseId &&
          other.sourceExerciseName == this.sourceExerciseName);
}

class JournalEntriesCompanion extends UpdateCompanion<DbJournalEntry> {
  final Value<int> id;
  final Value<String> entryId;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> content;
  final Value<String?> moodTag;
  final Value<String?> sourceExerciseId;
  final Value<String?> sourceExerciseName;
  const JournalEntriesCompanion({
    this.id = const Value.absent(),
    this.entryId = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.content = const Value.absent(),
    this.moodTag = const Value.absent(),
    this.sourceExerciseId = const Value.absent(),
    this.sourceExerciseName = const Value.absent(),
  });
  JournalEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String entryId,
    required String userId,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    required String content,
    this.moodTag = const Value.absent(),
    this.sourceExerciseId = const Value.absent(),
    this.sourceExerciseName = const Value.absent(),
  }) : entryId = Value(entryId),
       userId = Value(userId),
       createdAt = Value(createdAt),
       content = Value(content);
  static Insertable<DbJournalEntry> custom({
    Expression<int>? id,
    Expression<String>? entryId,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? content,
    Expression<String>? moodTag,
    Expression<String>? sourceExerciseId,
    Expression<String>? sourceExerciseName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entryId != null) 'entry_id': entryId,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (content != null) 'content': content,
      if (moodTag != null) 'mood_tag': moodTag,
      if (sourceExerciseId != null) 'source_exercise_id': sourceExerciseId,
      if (sourceExerciseName != null)
        'source_exercise_name': sourceExerciseName,
    });
  }

  JournalEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? entryId,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<String>? content,
    Value<String?>? moodTag,
    Value<String?>? sourceExerciseId,
    Value<String?>? sourceExerciseName,
  }) {
    return JournalEntriesCompanion(
      id: id ?? this.id,
      entryId: entryId ?? this.entryId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      content: content ?? this.content,
      moodTag: moodTag ?? this.moodTag,
      sourceExerciseId: sourceExerciseId ?? this.sourceExerciseId,
      sourceExerciseName: sourceExerciseName ?? this.sourceExerciseName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entryId.present) {
      map['entry_id'] = Variable<String>(entryId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (moodTag.present) {
      map['mood_tag'] = Variable<String>(moodTag.value);
    }
    if (sourceExerciseId.present) {
      map['source_exercise_id'] = Variable<String>(sourceExerciseId.value);
    }
    if (sourceExerciseName.present) {
      map['source_exercise_name'] = Variable<String>(sourceExerciseName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntriesCompanion(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('content: $content, ')
          ..write('moodTag: $moodTag, ')
          ..write('sourceExerciseId: $sourceExerciseId, ')
          ..write('sourceExerciseName: $sourceExerciseName')
          ..write(')'))
        .toString();
  }
}

class $ScheduledNotificationsTable extends ScheduledNotifications
    with TableInfo<$ScheduledNotificationsTable, DbScheduledNotification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduledNotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduledTimeMeta = const VerificationMeta(
    'scheduledTime',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledTime =
      GeneratedColumn<DateTime>(
        'scheduled_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _isSentMeta = const VerificationMeta('isSent');
  @override
  late final GeneratedColumn<bool> isSent = GeneratedColumn<bool>(
    'is_sent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sent" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sentAtMeta = const VerificationMeta('sentAt');
  @override
  late final GeneratedColumn<DateTime> sentAt = GeneratedColumn<DateTime>(
    'sent_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wasOpenedMeta = const VerificationMeta(
    'wasOpened',
  );
  @override
  late final GeneratedColumn<bool> wasOpened = GeneratedColumn<bool>(
    'was_opened',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("was_opened" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _openedAtMeta = const VerificationMeta(
    'openedAt',
  );
  @override
  late final GeneratedColumn<DateTime> openedAt = GeneratedColumn<DateTime>(
    'opened_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wasDismissedMeta = const VerificationMeta(
    'wasDismissed',
  );
  @override
  late final GeneratedColumn<bool> wasDismissed = GeneratedColumn<bool>(
    'was_dismissed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("was_dismissed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relatedStreakDaysMeta = const VerificationMeta(
    'relatedStreakDays',
  );
  @override
  late final GeneratedColumn<int> relatedStreakDays = GeneratedColumn<int>(
    'related_streak_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relatedMoneySavedMeta = const VerificationMeta(
    'relatedMoneySaved',
  );
  @override
  late final GeneratedColumn<int> relatedMoneySaved = GeneratedColumn<int>(
    'related_money_saved',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    type,
    title,
    body,
    scheduledTime,
    isSent,
    sentAt,
    wasOpened,
    openedAt,
    wasDismissed,
    payload,
    relatedStreakDays,
    relatedMoneySaved,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scheduled_notifications';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbScheduledNotification> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('scheduled_time')) {
      context.handle(
        _scheduledTimeMeta,
        scheduledTime.isAcceptableOrUnknown(
          data['scheduled_time']!,
          _scheduledTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledTimeMeta);
    }
    if (data.containsKey('is_sent')) {
      context.handle(
        _isSentMeta,
        isSent.isAcceptableOrUnknown(data['is_sent']!, _isSentMeta),
      );
    }
    if (data.containsKey('sent_at')) {
      context.handle(
        _sentAtMeta,
        sentAt.isAcceptableOrUnknown(data['sent_at']!, _sentAtMeta),
      );
    }
    if (data.containsKey('was_opened')) {
      context.handle(
        _wasOpenedMeta,
        wasOpened.isAcceptableOrUnknown(data['was_opened']!, _wasOpenedMeta),
      );
    }
    if (data.containsKey('opened_at')) {
      context.handle(
        _openedAtMeta,
        openedAt.isAcceptableOrUnknown(data['opened_at']!, _openedAtMeta),
      );
    }
    if (data.containsKey('was_dismissed')) {
      context.handle(
        _wasDismissedMeta,
        wasDismissed.isAcceptableOrUnknown(
          data['was_dismissed']!,
          _wasDismissedMeta,
        ),
      );
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    }
    if (data.containsKey('related_streak_days')) {
      context.handle(
        _relatedStreakDaysMeta,
        relatedStreakDays.isAcceptableOrUnknown(
          data['related_streak_days']!,
          _relatedStreakDaysMeta,
        ),
      );
    }
    if (data.containsKey('related_money_saved')) {
      context.handle(
        _relatedMoneySavedMeta,
        relatedMoneySaved.isAcceptableOrUnknown(
          data['related_money_saved']!,
          _relatedMoneySavedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbScheduledNotification map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbScheduledNotification(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      scheduledTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_time'],
      )!,
      isSent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sent'],
      )!,
      sentAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}sent_at'],
      ),
      wasOpened: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}was_opened'],
      )!,
      openedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}opened_at'],
      ),
      wasDismissed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}was_dismissed'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      ),
      relatedStreakDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}related_streak_days'],
      ),
      relatedMoneySaved: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}related_money_saved'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ScheduledNotificationsTable createAlias(String alias) {
    return $ScheduledNotificationsTable(attachedDatabase, alias);
  }
}

class DbScheduledNotification extends DataClass
    implements Insertable<DbScheduledNotification> {
  final int id;
  final String userId;
  final String type;
  final String title;
  final String body;
  final DateTime scheduledTime;
  final bool isSent;
  final DateTime? sentAt;
  final bool wasOpened;
  final DateTime? openedAt;
  final bool wasDismissed;
  final String? payload;
  final int? relatedStreakDays;
  final int? relatedMoneySaved;
  final DateTime createdAt;
  const DbScheduledNotification({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.body,
    required this.scheduledTime,
    required this.isSent,
    this.sentAt,
    required this.wasOpened,
    this.openedAt,
    required this.wasDismissed,
    this.payload,
    this.relatedStreakDays,
    this.relatedMoneySaved,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['scheduled_time'] = Variable<DateTime>(scheduledTime);
    map['is_sent'] = Variable<bool>(isSent);
    if (!nullToAbsent || sentAt != null) {
      map['sent_at'] = Variable<DateTime>(sentAt);
    }
    map['was_opened'] = Variable<bool>(wasOpened);
    if (!nullToAbsent || openedAt != null) {
      map['opened_at'] = Variable<DateTime>(openedAt);
    }
    map['was_dismissed'] = Variable<bool>(wasDismissed);
    if (!nullToAbsent || payload != null) {
      map['payload'] = Variable<String>(payload);
    }
    if (!nullToAbsent || relatedStreakDays != null) {
      map['related_streak_days'] = Variable<int>(relatedStreakDays);
    }
    if (!nullToAbsent || relatedMoneySaved != null) {
      map['related_money_saved'] = Variable<int>(relatedMoneySaved);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ScheduledNotificationsCompanion toCompanion(bool nullToAbsent) {
    return ScheduledNotificationsCompanion(
      id: Value(id),
      userId: Value(userId),
      type: Value(type),
      title: Value(title),
      body: Value(body),
      scheduledTime: Value(scheduledTime),
      isSent: Value(isSent),
      sentAt: sentAt == null && nullToAbsent
          ? const Value.absent()
          : Value(sentAt),
      wasOpened: Value(wasOpened),
      openedAt: openedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(openedAt),
      wasDismissed: Value(wasDismissed),
      payload: payload == null && nullToAbsent
          ? const Value.absent()
          : Value(payload),
      relatedStreakDays: relatedStreakDays == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedStreakDays),
      relatedMoneySaved: relatedMoneySaved == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedMoneySaved),
      createdAt: Value(createdAt),
    );
  }

  factory DbScheduledNotification.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbScheduledNotification(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      scheduledTime: serializer.fromJson<DateTime>(json['scheduledTime']),
      isSent: serializer.fromJson<bool>(json['isSent']),
      sentAt: serializer.fromJson<DateTime?>(json['sentAt']),
      wasOpened: serializer.fromJson<bool>(json['wasOpened']),
      openedAt: serializer.fromJson<DateTime?>(json['openedAt']),
      wasDismissed: serializer.fromJson<bool>(json['wasDismissed']),
      payload: serializer.fromJson<String?>(json['payload']),
      relatedStreakDays: serializer.fromJson<int?>(json['relatedStreakDays']),
      relatedMoneySaved: serializer.fromJson<int?>(json['relatedMoneySaved']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'scheduledTime': serializer.toJson<DateTime>(scheduledTime),
      'isSent': serializer.toJson<bool>(isSent),
      'sentAt': serializer.toJson<DateTime?>(sentAt),
      'wasOpened': serializer.toJson<bool>(wasOpened),
      'openedAt': serializer.toJson<DateTime?>(openedAt),
      'wasDismissed': serializer.toJson<bool>(wasDismissed),
      'payload': serializer.toJson<String?>(payload),
      'relatedStreakDays': serializer.toJson<int?>(relatedStreakDays),
      'relatedMoneySaved': serializer.toJson<int?>(relatedMoneySaved),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DbScheduledNotification copyWith({
    int? id,
    String? userId,
    String? type,
    String? title,
    String? body,
    DateTime? scheduledTime,
    bool? isSent,
    Value<DateTime?> sentAt = const Value.absent(),
    bool? wasOpened,
    Value<DateTime?> openedAt = const Value.absent(),
    bool? wasDismissed,
    Value<String?> payload = const Value.absent(),
    Value<int?> relatedStreakDays = const Value.absent(),
    Value<int?> relatedMoneySaved = const Value.absent(),
    DateTime? createdAt,
  }) => DbScheduledNotification(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    type: type ?? this.type,
    title: title ?? this.title,
    body: body ?? this.body,
    scheduledTime: scheduledTime ?? this.scheduledTime,
    isSent: isSent ?? this.isSent,
    sentAt: sentAt.present ? sentAt.value : this.sentAt,
    wasOpened: wasOpened ?? this.wasOpened,
    openedAt: openedAt.present ? openedAt.value : this.openedAt,
    wasDismissed: wasDismissed ?? this.wasDismissed,
    payload: payload.present ? payload.value : this.payload,
    relatedStreakDays: relatedStreakDays.present
        ? relatedStreakDays.value
        : this.relatedStreakDays,
    relatedMoneySaved: relatedMoneySaved.present
        ? relatedMoneySaved.value
        : this.relatedMoneySaved,
    createdAt: createdAt ?? this.createdAt,
  );
  DbScheduledNotification copyWithCompanion(
    ScheduledNotificationsCompanion data,
  ) {
    return DbScheduledNotification(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      scheduledTime: data.scheduledTime.present
          ? data.scheduledTime.value
          : this.scheduledTime,
      isSent: data.isSent.present ? data.isSent.value : this.isSent,
      sentAt: data.sentAt.present ? data.sentAt.value : this.sentAt,
      wasOpened: data.wasOpened.present ? data.wasOpened.value : this.wasOpened,
      openedAt: data.openedAt.present ? data.openedAt.value : this.openedAt,
      wasDismissed: data.wasDismissed.present
          ? data.wasDismissed.value
          : this.wasDismissed,
      payload: data.payload.present ? data.payload.value : this.payload,
      relatedStreakDays: data.relatedStreakDays.present
          ? data.relatedStreakDays.value
          : this.relatedStreakDays,
      relatedMoneySaved: data.relatedMoneySaved.present
          ? data.relatedMoneySaved.value
          : this.relatedMoneySaved,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbScheduledNotification(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('isSent: $isSent, ')
          ..write('sentAt: $sentAt, ')
          ..write('wasOpened: $wasOpened, ')
          ..write('openedAt: $openedAt, ')
          ..write('wasDismissed: $wasDismissed, ')
          ..write('payload: $payload, ')
          ..write('relatedStreakDays: $relatedStreakDays, ')
          ..write('relatedMoneySaved: $relatedMoneySaved, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    type,
    title,
    body,
    scheduledTime,
    isSent,
    sentAt,
    wasOpened,
    openedAt,
    wasDismissed,
    payload,
    relatedStreakDays,
    relatedMoneySaved,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbScheduledNotification &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.title == this.title &&
          other.body == this.body &&
          other.scheduledTime == this.scheduledTime &&
          other.isSent == this.isSent &&
          other.sentAt == this.sentAt &&
          other.wasOpened == this.wasOpened &&
          other.openedAt == this.openedAt &&
          other.wasDismissed == this.wasDismissed &&
          other.payload == this.payload &&
          other.relatedStreakDays == this.relatedStreakDays &&
          other.relatedMoneySaved == this.relatedMoneySaved &&
          other.createdAt == this.createdAt);
}

class ScheduledNotificationsCompanion
    extends UpdateCompanion<DbScheduledNotification> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> type;
  final Value<String> title;
  final Value<String> body;
  final Value<DateTime> scheduledTime;
  final Value<bool> isSent;
  final Value<DateTime?> sentAt;
  final Value<bool> wasOpened;
  final Value<DateTime?> openedAt;
  final Value<bool> wasDismissed;
  final Value<String?> payload;
  final Value<int?> relatedStreakDays;
  final Value<int?> relatedMoneySaved;
  final Value<DateTime> createdAt;
  const ScheduledNotificationsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.scheduledTime = const Value.absent(),
    this.isSent = const Value.absent(),
    this.sentAt = const Value.absent(),
    this.wasOpened = const Value.absent(),
    this.openedAt = const Value.absent(),
    this.wasDismissed = const Value.absent(),
    this.payload = const Value.absent(),
    this.relatedStreakDays = const Value.absent(),
    this.relatedMoneySaved = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ScheduledNotificationsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String type,
    required String title,
    required String body,
    required DateTime scheduledTime,
    this.isSent = const Value.absent(),
    this.sentAt = const Value.absent(),
    this.wasOpened = const Value.absent(),
    this.openedAt = const Value.absent(),
    this.wasDismissed = const Value.absent(),
    this.payload = const Value.absent(),
    this.relatedStreakDays = const Value.absent(),
    this.relatedMoneySaved = const Value.absent(),
    required DateTime createdAt,
  }) : userId = Value(userId),
       type = Value(type),
       title = Value(title),
       body = Value(body),
       scheduledTime = Value(scheduledTime),
       createdAt = Value(createdAt);
  static Insertable<DbScheduledNotification> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? body,
    Expression<DateTime>? scheduledTime,
    Expression<bool>? isSent,
    Expression<DateTime>? sentAt,
    Expression<bool>? wasOpened,
    Expression<DateTime>? openedAt,
    Expression<bool>? wasDismissed,
    Expression<String>? payload,
    Expression<int>? relatedStreakDays,
    Expression<int>? relatedMoneySaved,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (scheduledTime != null) 'scheduled_time': scheduledTime,
      if (isSent != null) 'is_sent': isSent,
      if (sentAt != null) 'sent_at': sentAt,
      if (wasOpened != null) 'was_opened': wasOpened,
      if (openedAt != null) 'opened_at': openedAt,
      if (wasDismissed != null) 'was_dismissed': wasDismissed,
      if (payload != null) 'payload': payload,
      if (relatedStreakDays != null) 'related_streak_days': relatedStreakDays,
      if (relatedMoneySaved != null) 'related_money_saved': relatedMoneySaved,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ScheduledNotificationsCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? type,
    Value<String>? title,
    Value<String>? body,
    Value<DateTime>? scheduledTime,
    Value<bool>? isSent,
    Value<DateTime?>? sentAt,
    Value<bool>? wasOpened,
    Value<DateTime?>? openedAt,
    Value<bool>? wasDismissed,
    Value<String?>? payload,
    Value<int?>? relatedStreakDays,
    Value<int?>? relatedMoneySaved,
    Value<DateTime>? createdAt,
  }) {
    return ScheduledNotificationsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      title: title ?? this.title,
      body: body ?? this.body,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      isSent: isSent ?? this.isSent,
      sentAt: sentAt ?? this.sentAt,
      wasOpened: wasOpened ?? this.wasOpened,
      openedAt: openedAt ?? this.openedAt,
      wasDismissed: wasDismissed ?? this.wasDismissed,
      payload: payload ?? this.payload,
      relatedStreakDays: relatedStreakDays ?? this.relatedStreakDays,
      relatedMoneySaved: relatedMoneySaved ?? this.relatedMoneySaved,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (scheduledTime.present) {
      map['scheduled_time'] = Variable<DateTime>(scheduledTime.value);
    }
    if (isSent.present) {
      map['is_sent'] = Variable<bool>(isSent.value);
    }
    if (sentAt.present) {
      map['sent_at'] = Variable<DateTime>(sentAt.value);
    }
    if (wasOpened.present) {
      map['was_opened'] = Variable<bool>(wasOpened.value);
    }
    if (openedAt.present) {
      map['opened_at'] = Variable<DateTime>(openedAt.value);
    }
    if (wasDismissed.present) {
      map['was_dismissed'] = Variable<bool>(wasDismissed.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (relatedStreakDays.present) {
      map['related_streak_days'] = Variable<int>(relatedStreakDays.value);
    }
    if (relatedMoneySaved.present) {
      map['related_money_saved'] = Variable<int>(relatedMoneySaved.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledNotificationsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('isSent: $isSent, ')
          ..write('sentAt: $sentAt, ')
          ..write('wasOpened: $wasOpened, ')
          ..write('openedAt: $openedAt, ')
          ..write('wasDismissed: $wasDismissed, ')
          ..write('payload: $payload, ')
          ..write('relatedStreakDays: $relatedStreakDays, ')
          ..write('relatedMoneySaved: $relatedMoneySaved, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $NotificationPreferencesTable extends NotificationPreferences
    with TableInfo<$NotificationPreferencesTable, DbNotificationPreference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationPreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
    'notifications_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notifications_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
    'frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quietHoursEnabledMeta = const VerificationMeta(
    'quietHoursEnabled',
  );
  @override
  late final GeneratedColumn<bool> quietHoursEnabled = GeneratedColumn<bool>(
    'quiet_hours_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("quiet_hours_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _quietHoursStartMeta = const VerificationMeta(
    'quietHoursStart',
  );
  @override
  late final GeneratedColumn<int> quietHoursStart = GeneratedColumn<int>(
    'quiet_hours_start',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(22),
  );
  static const VerificationMeta _quietHoursEndMeta = const VerificationMeta(
    'quietHoursEnd',
  );
  @override
  late final GeneratedColumn<int> quietHoursEnd = GeneratedColumn<int>(
    'quiet_hours_end',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(8),
  );
  static const VerificationMeta _dailyCheckInEnabledMeta =
      const VerificationMeta('dailyCheckInEnabled');
  @override
  late final GeneratedColumn<bool> dailyCheckInEnabled = GeneratedColumn<bool>(
    'daily_check_in_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("daily_check_in_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _encouragementEnabledMeta =
      const VerificationMeta('encouragementEnabled');
  @override
  late final GeneratedColumn<bool> encouragementEnabled = GeneratedColumn<bool>(
    'encouragement_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("encouragement_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _milestoneEnabledMeta = const VerificationMeta(
    'milestoneEnabled',
  );
  @override
  late final GeneratedColumn<bool> milestoneEnabled = GeneratedColumn<bool>(
    'milestone_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("milestone_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _cravingTipsEnabledMeta =
      const VerificationMeta('cravingTipsEnabled');
  @override
  late final GeneratedColumn<bool> cravingTipsEnabled = GeneratedColumn<bool>(
    'craving_tips_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("craving_tips_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _microChallengesEnabledMeta =
      const VerificationMeta('microChallengesEnabled');
  @override
  late final GeneratedColumn<bool> microChallengesEnabled =
      GeneratedColumn<bool>(
        'micro_challenges_enabled',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("micro_challenges_enabled" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  static const VerificationMeta _progressUpdatesEnabledMeta =
      const VerificationMeta('progressUpdatesEnabled');
  @override
  late final GeneratedColumn<bool> progressUpdatesEnabled =
      GeneratedColumn<bool>(
        'progress_updates_enabled',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("progress_updates_enabled" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  static const VerificationMeta _streakRemindersEnabledMeta =
      const VerificationMeta('streakRemindersEnabled');
  @override
  late final GeneratedColumn<bool> streakRemindersEnabled =
      GeneratedColumn<bool>(
        'streak_reminders_enabled',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("streak_reminders_enabled" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  static const VerificationMeta _healthFactsEnabledMeta =
      const VerificationMeta('healthFactsEnabled');
  @override
  late final GeneratedColumn<bool> healthFactsEnabled = GeneratedColumn<bool>(
    'health_facts_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("health_facts_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _motivationalQuotesEnabledMeta =
      const VerificationMeta('motivationalQuotesEnabled');
  @override
  late final GeneratedColumn<bool> motivationalQuotesEnabled =
      GeneratedColumn<bool>(
        'motivational_quotes_enabled',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("motivational_quotes_enabled" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  @override
  late final GeneratedColumnWithTypeConverter<List<int>?, String>
  preferredHours =
      GeneratedColumn<String>(
        'preferred_hours',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<int>?>(
        $NotificationPreferencesTable.$converterpreferredHoursn,
      );
  static const VerificationMeta _permissionDeniedAtMeta =
      const VerificationMeta('permissionDeniedAt');
  @override
  late final GeneratedColumn<DateTime> permissionDeniedAt =
      GeneratedColumn<DateTime>(
        'permission_denied_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _userModeMeta = const VerificationMeta(
    'userMode',
  );
  @override
  late final GeneratedColumn<String> userMode = GeneratedColumn<String>(
    'user_mode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quitDatePrepEnabledMeta =
      const VerificationMeta('quitDatePrepEnabled');
  @override
  late final GeneratedColumn<bool> quitDatePrepEnabled = GeneratedColumn<bool>(
    'quit_date_prep_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("quit_date_prep_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    notificationsEnabled,
    frequency,
    quietHoursEnabled,
    quietHoursStart,
    quietHoursEnd,
    dailyCheckInEnabled,
    encouragementEnabled,
    milestoneEnabled,
    cravingTipsEnabled,
    microChallengesEnabled,
    progressUpdatesEnabled,
    streakRemindersEnabled,
    healthFactsEnabled,
    motivationalQuotesEnabled,
    preferredHours,
    permissionDeniedAt,
    userMode,
    quitDatePrepEnabled,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbNotificationPreference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
        _notificationsEnabledMeta,
        notificationsEnabled.isAcceptableOrUnknown(
          data['notifications_enabled']!,
          _notificationsEnabledMeta,
        ),
      );
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('quiet_hours_enabled')) {
      context.handle(
        _quietHoursEnabledMeta,
        quietHoursEnabled.isAcceptableOrUnknown(
          data['quiet_hours_enabled']!,
          _quietHoursEnabledMeta,
        ),
      );
    }
    if (data.containsKey('quiet_hours_start')) {
      context.handle(
        _quietHoursStartMeta,
        quietHoursStart.isAcceptableOrUnknown(
          data['quiet_hours_start']!,
          _quietHoursStartMeta,
        ),
      );
    }
    if (data.containsKey('quiet_hours_end')) {
      context.handle(
        _quietHoursEndMeta,
        quietHoursEnd.isAcceptableOrUnknown(
          data['quiet_hours_end']!,
          _quietHoursEndMeta,
        ),
      );
    }
    if (data.containsKey('daily_check_in_enabled')) {
      context.handle(
        _dailyCheckInEnabledMeta,
        dailyCheckInEnabled.isAcceptableOrUnknown(
          data['daily_check_in_enabled']!,
          _dailyCheckInEnabledMeta,
        ),
      );
    }
    if (data.containsKey('encouragement_enabled')) {
      context.handle(
        _encouragementEnabledMeta,
        encouragementEnabled.isAcceptableOrUnknown(
          data['encouragement_enabled']!,
          _encouragementEnabledMeta,
        ),
      );
    }
    if (data.containsKey('milestone_enabled')) {
      context.handle(
        _milestoneEnabledMeta,
        milestoneEnabled.isAcceptableOrUnknown(
          data['milestone_enabled']!,
          _milestoneEnabledMeta,
        ),
      );
    }
    if (data.containsKey('craving_tips_enabled')) {
      context.handle(
        _cravingTipsEnabledMeta,
        cravingTipsEnabled.isAcceptableOrUnknown(
          data['craving_tips_enabled']!,
          _cravingTipsEnabledMeta,
        ),
      );
    }
    if (data.containsKey('micro_challenges_enabled')) {
      context.handle(
        _microChallengesEnabledMeta,
        microChallengesEnabled.isAcceptableOrUnknown(
          data['micro_challenges_enabled']!,
          _microChallengesEnabledMeta,
        ),
      );
    }
    if (data.containsKey('progress_updates_enabled')) {
      context.handle(
        _progressUpdatesEnabledMeta,
        progressUpdatesEnabled.isAcceptableOrUnknown(
          data['progress_updates_enabled']!,
          _progressUpdatesEnabledMeta,
        ),
      );
    }
    if (data.containsKey('streak_reminders_enabled')) {
      context.handle(
        _streakRemindersEnabledMeta,
        streakRemindersEnabled.isAcceptableOrUnknown(
          data['streak_reminders_enabled']!,
          _streakRemindersEnabledMeta,
        ),
      );
    }
    if (data.containsKey('health_facts_enabled')) {
      context.handle(
        _healthFactsEnabledMeta,
        healthFactsEnabled.isAcceptableOrUnknown(
          data['health_facts_enabled']!,
          _healthFactsEnabledMeta,
        ),
      );
    }
    if (data.containsKey('motivational_quotes_enabled')) {
      context.handle(
        _motivationalQuotesEnabledMeta,
        motivationalQuotesEnabled.isAcceptableOrUnknown(
          data['motivational_quotes_enabled']!,
          _motivationalQuotesEnabledMeta,
        ),
      );
    }
    if (data.containsKey('permission_denied_at')) {
      context.handle(
        _permissionDeniedAtMeta,
        permissionDeniedAt.isAcceptableOrUnknown(
          data['permission_denied_at']!,
          _permissionDeniedAtMeta,
        ),
      );
    }
    if (data.containsKey('user_mode')) {
      context.handle(
        _userModeMeta,
        userMode.isAcceptableOrUnknown(data['user_mode']!, _userModeMeta),
      );
    }
    if (data.containsKey('quit_date_prep_enabled')) {
      context.handle(
        _quitDatePrepEnabledMeta,
        quitDatePrepEnabled.isAcceptableOrUnknown(
          data['quit_date_prep_enabled']!,
          _quitDatePrepEnabledMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbNotificationPreference map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbNotificationPreference(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notifications_enabled'],
      )!,
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frequency'],
      )!,
      quietHoursEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}quiet_hours_enabled'],
      )!,
      quietHoursStart: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quiet_hours_start'],
      )!,
      quietHoursEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quiet_hours_end'],
      )!,
      dailyCheckInEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}daily_check_in_enabled'],
      )!,
      encouragementEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}encouragement_enabled'],
      )!,
      milestoneEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}milestone_enabled'],
      )!,
      cravingTipsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}craving_tips_enabled'],
      )!,
      microChallengesEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}micro_challenges_enabled'],
      )!,
      progressUpdatesEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}progress_updates_enabled'],
      )!,
      streakRemindersEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}streak_reminders_enabled'],
      )!,
      healthFactsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}health_facts_enabled'],
      )!,
      motivationalQuotesEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}motivational_quotes_enabled'],
      )!,
      preferredHours: $NotificationPreferencesTable.$converterpreferredHoursn
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}preferred_hours'],
            ),
          ),
      permissionDeniedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}permission_denied_at'],
      ),
      userMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_mode'],
      ),
      quitDatePrepEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}quit_date_prep_enabled'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $NotificationPreferencesTable createAlias(String alias) {
    return $NotificationPreferencesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $converterpreferredHours =
      const IntListConverter();
  static TypeConverter<List<int>?, String?> $converterpreferredHoursn =
      NullAwareTypeConverter.wrap($converterpreferredHours);
}

class DbNotificationPreference extends DataClass
    implements Insertable<DbNotificationPreference> {
  final int id;
  final String userId;
  final bool notificationsEnabled;
  final String frequency;
  final bool quietHoursEnabled;
  final int quietHoursStart;
  final int quietHoursEnd;
  final bool dailyCheckInEnabled;
  final bool encouragementEnabled;
  final bool milestoneEnabled;
  final bool cravingTipsEnabled;
  final bool microChallengesEnabled;
  final bool progressUpdatesEnabled;
  final bool streakRemindersEnabled;
  final bool healthFactsEnabled;
  final bool motivationalQuotesEnabled;
  final List<int>? preferredHours;
  final DateTime? permissionDeniedAt;
  final String? userMode;
  final bool quitDatePrepEnabled;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const DbNotificationPreference({
    required this.id,
    required this.userId,
    required this.notificationsEnabled,
    required this.frequency,
    required this.quietHoursEnabled,
    required this.quietHoursStart,
    required this.quietHoursEnd,
    required this.dailyCheckInEnabled,
    required this.encouragementEnabled,
    required this.milestoneEnabled,
    required this.cravingTipsEnabled,
    required this.microChallengesEnabled,
    required this.progressUpdatesEnabled,
    required this.streakRemindersEnabled,
    required this.healthFactsEnabled,
    required this.motivationalQuotesEnabled,
    this.preferredHours,
    this.permissionDeniedAt,
    this.userMode,
    required this.quitDatePrepEnabled,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    map['frequency'] = Variable<String>(frequency);
    map['quiet_hours_enabled'] = Variable<bool>(quietHoursEnabled);
    map['quiet_hours_start'] = Variable<int>(quietHoursStart);
    map['quiet_hours_end'] = Variable<int>(quietHoursEnd);
    map['daily_check_in_enabled'] = Variable<bool>(dailyCheckInEnabled);
    map['encouragement_enabled'] = Variable<bool>(encouragementEnabled);
    map['milestone_enabled'] = Variable<bool>(milestoneEnabled);
    map['craving_tips_enabled'] = Variable<bool>(cravingTipsEnabled);
    map['micro_challenges_enabled'] = Variable<bool>(microChallengesEnabled);
    map['progress_updates_enabled'] = Variable<bool>(progressUpdatesEnabled);
    map['streak_reminders_enabled'] = Variable<bool>(streakRemindersEnabled);
    map['health_facts_enabled'] = Variable<bool>(healthFactsEnabled);
    map['motivational_quotes_enabled'] = Variable<bool>(
      motivationalQuotesEnabled,
    );
    if (!nullToAbsent || preferredHours != null) {
      map['preferred_hours'] = Variable<String>(
        $NotificationPreferencesTable.$converterpreferredHoursn.toSql(
          preferredHours,
        ),
      );
    }
    if (!nullToAbsent || permissionDeniedAt != null) {
      map['permission_denied_at'] = Variable<DateTime>(permissionDeniedAt);
    }
    if (!nullToAbsent || userMode != null) {
      map['user_mode'] = Variable<String>(userMode);
    }
    map['quit_date_prep_enabled'] = Variable<bool>(quitDatePrepEnabled);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  NotificationPreferencesCompanion toCompanion(bool nullToAbsent) {
    return NotificationPreferencesCompanion(
      id: Value(id),
      userId: Value(userId),
      notificationsEnabled: Value(notificationsEnabled),
      frequency: Value(frequency),
      quietHoursEnabled: Value(quietHoursEnabled),
      quietHoursStart: Value(quietHoursStart),
      quietHoursEnd: Value(quietHoursEnd),
      dailyCheckInEnabled: Value(dailyCheckInEnabled),
      encouragementEnabled: Value(encouragementEnabled),
      milestoneEnabled: Value(milestoneEnabled),
      cravingTipsEnabled: Value(cravingTipsEnabled),
      microChallengesEnabled: Value(microChallengesEnabled),
      progressUpdatesEnabled: Value(progressUpdatesEnabled),
      streakRemindersEnabled: Value(streakRemindersEnabled),
      healthFactsEnabled: Value(healthFactsEnabled),
      motivationalQuotesEnabled: Value(motivationalQuotesEnabled),
      preferredHours: preferredHours == null && nullToAbsent
          ? const Value.absent()
          : Value(preferredHours),
      permissionDeniedAt: permissionDeniedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(permissionDeniedAt),
      userMode: userMode == null && nullToAbsent
          ? const Value.absent()
          : Value(userMode),
      quitDatePrepEnabled: Value(quitDatePrepEnabled),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbNotificationPreference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbNotificationPreference(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      notificationsEnabled: serializer.fromJson<bool>(
        json['notificationsEnabled'],
      ),
      frequency: serializer.fromJson<String>(json['frequency']),
      quietHoursEnabled: serializer.fromJson<bool>(json['quietHoursEnabled']),
      quietHoursStart: serializer.fromJson<int>(json['quietHoursStart']),
      quietHoursEnd: serializer.fromJson<int>(json['quietHoursEnd']),
      dailyCheckInEnabled: serializer.fromJson<bool>(
        json['dailyCheckInEnabled'],
      ),
      encouragementEnabled: serializer.fromJson<bool>(
        json['encouragementEnabled'],
      ),
      milestoneEnabled: serializer.fromJson<bool>(json['milestoneEnabled']),
      cravingTipsEnabled: serializer.fromJson<bool>(json['cravingTipsEnabled']),
      microChallengesEnabled: serializer.fromJson<bool>(
        json['microChallengesEnabled'],
      ),
      progressUpdatesEnabled: serializer.fromJson<bool>(
        json['progressUpdatesEnabled'],
      ),
      streakRemindersEnabled: serializer.fromJson<bool>(
        json['streakRemindersEnabled'],
      ),
      healthFactsEnabled: serializer.fromJson<bool>(json['healthFactsEnabled']),
      motivationalQuotesEnabled: serializer.fromJson<bool>(
        json['motivationalQuotesEnabled'],
      ),
      preferredHours: serializer.fromJson<List<int>?>(json['preferredHours']),
      permissionDeniedAt: serializer.fromJson<DateTime?>(
        json['permissionDeniedAt'],
      ),
      userMode: serializer.fromJson<String?>(json['userMode']),
      quitDatePrepEnabled: serializer.fromJson<bool>(
        json['quitDatePrepEnabled'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
      'frequency': serializer.toJson<String>(frequency),
      'quietHoursEnabled': serializer.toJson<bool>(quietHoursEnabled),
      'quietHoursStart': serializer.toJson<int>(quietHoursStart),
      'quietHoursEnd': serializer.toJson<int>(quietHoursEnd),
      'dailyCheckInEnabled': serializer.toJson<bool>(dailyCheckInEnabled),
      'encouragementEnabled': serializer.toJson<bool>(encouragementEnabled),
      'milestoneEnabled': serializer.toJson<bool>(milestoneEnabled),
      'cravingTipsEnabled': serializer.toJson<bool>(cravingTipsEnabled),
      'microChallengesEnabled': serializer.toJson<bool>(microChallengesEnabled),
      'progressUpdatesEnabled': serializer.toJson<bool>(progressUpdatesEnabled),
      'streakRemindersEnabled': serializer.toJson<bool>(streakRemindersEnabled),
      'healthFactsEnabled': serializer.toJson<bool>(healthFactsEnabled),
      'motivationalQuotesEnabled': serializer.toJson<bool>(
        motivationalQuotesEnabled,
      ),
      'preferredHours': serializer.toJson<List<int>?>(preferredHours),
      'permissionDeniedAt': serializer.toJson<DateTime?>(permissionDeniedAt),
      'userMode': serializer.toJson<String?>(userMode),
      'quitDatePrepEnabled': serializer.toJson<bool>(quitDatePrepEnabled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  DbNotificationPreference copyWith({
    int? id,
    String? userId,
    bool? notificationsEnabled,
    String? frequency,
    bool? quietHoursEnabled,
    int? quietHoursStart,
    int? quietHoursEnd,
    bool? dailyCheckInEnabled,
    bool? encouragementEnabled,
    bool? milestoneEnabled,
    bool? cravingTipsEnabled,
    bool? microChallengesEnabled,
    bool? progressUpdatesEnabled,
    bool? streakRemindersEnabled,
    bool? healthFactsEnabled,
    bool? motivationalQuotesEnabled,
    Value<List<int>?> preferredHours = const Value.absent(),
    Value<DateTime?> permissionDeniedAt = const Value.absent(),
    Value<String?> userMode = const Value.absent(),
    bool? quitDatePrepEnabled,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => DbNotificationPreference(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    frequency: frequency ?? this.frequency,
    quietHoursEnabled: quietHoursEnabled ?? this.quietHoursEnabled,
    quietHoursStart: quietHoursStart ?? this.quietHoursStart,
    quietHoursEnd: quietHoursEnd ?? this.quietHoursEnd,
    dailyCheckInEnabled: dailyCheckInEnabled ?? this.dailyCheckInEnabled,
    encouragementEnabled: encouragementEnabled ?? this.encouragementEnabled,
    milestoneEnabled: milestoneEnabled ?? this.milestoneEnabled,
    cravingTipsEnabled: cravingTipsEnabled ?? this.cravingTipsEnabled,
    microChallengesEnabled:
        microChallengesEnabled ?? this.microChallengesEnabled,
    progressUpdatesEnabled:
        progressUpdatesEnabled ?? this.progressUpdatesEnabled,
    streakRemindersEnabled:
        streakRemindersEnabled ?? this.streakRemindersEnabled,
    healthFactsEnabled: healthFactsEnabled ?? this.healthFactsEnabled,
    motivationalQuotesEnabled:
        motivationalQuotesEnabled ?? this.motivationalQuotesEnabled,
    preferredHours: preferredHours.present
        ? preferredHours.value
        : this.preferredHours,
    permissionDeniedAt: permissionDeniedAt.present
        ? permissionDeniedAt.value
        : this.permissionDeniedAt,
    userMode: userMode.present ? userMode.value : this.userMode,
    quitDatePrepEnabled: quitDatePrepEnabled ?? this.quitDatePrepEnabled,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbNotificationPreference copyWithCompanion(
    NotificationPreferencesCompanion data,
  ) {
    return DbNotificationPreference(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      quietHoursEnabled: data.quietHoursEnabled.present
          ? data.quietHoursEnabled.value
          : this.quietHoursEnabled,
      quietHoursStart: data.quietHoursStart.present
          ? data.quietHoursStart.value
          : this.quietHoursStart,
      quietHoursEnd: data.quietHoursEnd.present
          ? data.quietHoursEnd.value
          : this.quietHoursEnd,
      dailyCheckInEnabled: data.dailyCheckInEnabled.present
          ? data.dailyCheckInEnabled.value
          : this.dailyCheckInEnabled,
      encouragementEnabled: data.encouragementEnabled.present
          ? data.encouragementEnabled.value
          : this.encouragementEnabled,
      milestoneEnabled: data.milestoneEnabled.present
          ? data.milestoneEnabled.value
          : this.milestoneEnabled,
      cravingTipsEnabled: data.cravingTipsEnabled.present
          ? data.cravingTipsEnabled.value
          : this.cravingTipsEnabled,
      microChallengesEnabled: data.microChallengesEnabled.present
          ? data.microChallengesEnabled.value
          : this.microChallengesEnabled,
      progressUpdatesEnabled: data.progressUpdatesEnabled.present
          ? data.progressUpdatesEnabled.value
          : this.progressUpdatesEnabled,
      streakRemindersEnabled: data.streakRemindersEnabled.present
          ? data.streakRemindersEnabled.value
          : this.streakRemindersEnabled,
      healthFactsEnabled: data.healthFactsEnabled.present
          ? data.healthFactsEnabled.value
          : this.healthFactsEnabled,
      motivationalQuotesEnabled: data.motivationalQuotesEnabled.present
          ? data.motivationalQuotesEnabled.value
          : this.motivationalQuotesEnabled,
      preferredHours: data.preferredHours.present
          ? data.preferredHours.value
          : this.preferredHours,
      permissionDeniedAt: data.permissionDeniedAt.present
          ? data.permissionDeniedAt.value
          : this.permissionDeniedAt,
      userMode: data.userMode.present ? data.userMode.value : this.userMode,
      quitDatePrepEnabled: data.quitDatePrepEnabled.present
          ? data.quitDatePrepEnabled.value
          : this.quitDatePrepEnabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbNotificationPreference(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('frequency: $frequency, ')
          ..write('quietHoursEnabled: $quietHoursEnabled, ')
          ..write('quietHoursStart: $quietHoursStart, ')
          ..write('quietHoursEnd: $quietHoursEnd, ')
          ..write('dailyCheckInEnabled: $dailyCheckInEnabled, ')
          ..write('encouragementEnabled: $encouragementEnabled, ')
          ..write('milestoneEnabled: $milestoneEnabled, ')
          ..write('cravingTipsEnabled: $cravingTipsEnabled, ')
          ..write('microChallengesEnabled: $microChallengesEnabled, ')
          ..write('progressUpdatesEnabled: $progressUpdatesEnabled, ')
          ..write('streakRemindersEnabled: $streakRemindersEnabled, ')
          ..write('healthFactsEnabled: $healthFactsEnabled, ')
          ..write('motivationalQuotesEnabled: $motivationalQuotesEnabled, ')
          ..write('preferredHours: $preferredHours, ')
          ..write('permissionDeniedAt: $permissionDeniedAt, ')
          ..write('userMode: $userMode, ')
          ..write('quitDatePrepEnabled: $quitDatePrepEnabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    userId,
    notificationsEnabled,
    frequency,
    quietHoursEnabled,
    quietHoursStart,
    quietHoursEnd,
    dailyCheckInEnabled,
    encouragementEnabled,
    milestoneEnabled,
    cravingTipsEnabled,
    microChallengesEnabled,
    progressUpdatesEnabled,
    streakRemindersEnabled,
    healthFactsEnabled,
    motivationalQuotesEnabled,
    preferredHours,
    permissionDeniedAt,
    userMode,
    quitDatePrepEnabled,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbNotificationPreference &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.notificationsEnabled == this.notificationsEnabled &&
          other.frequency == this.frequency &&
          other.quietHoursEnabled == this.quietHoursEnabled &&
          other.quietHoursStart == this.quietHoursStart &&
          other.quietHoursEnd == this.quietHoursEnd &&
          other.dailyCheckInEnabled == this.dailyCheckInEnabled &&
          other.encouragementEnabled == this.encouragementEnabled &&
          other.milestoneEnabled == this.milestoneEnabled &&
          other.cravingTipsEnabled == this.cravingTipsEnabled &&
          other.microChallengesEnabled == this.microChallengesEnabled &&
          other.progressUpdatesEnabled == this.progressUpdatesEnabled &&
          other.streakRemindersEnabled == this.streakRemindersEnabled &&
          other.healthFactsEnabled == this.healthFactsEnabled &&
          other.motivationalQuotesEnabled == this.motivationalQuotesEnabled &&
          other.preferredHours == this.preferredHours &&
          other.permissionDeniedAt == this.permissionDeniedAt &&
          other.userMode == this.userMode &&
          other.quitDatePrepEnabled == this.quitDatePrepEnabled &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NotificationPreferencesCompanion
    extends UpdateCompanion<DbNotificationPreference> {
  final Value<int> id;
  final Value<String> userId;
  final Value<bool> notificationsEnabled;
  final Value<String> frequency;
  final Value<bool> quietHoursEnabled;
  final Value<int> quietHoursStart;
  final Value<int> quietHoursEnd;
  final Value<bool> dailyCheckInEnabled;
  final Value<bool> encouragementEnabled;
  final Value<bool> milestoneEnabled;
  final Value<bool> cravingTipsEnabled;
  final Value<bool> microChallengesEnabled;
  final Value<bool> progressUpdatesEnabled;
  final Value<bool> streakRemindersEnabled;
  final Value<bool> healthFactsEnabled;
  final Value<bool> motivationalQuotesEnabled;
  final Value<List<int>?> preferredHours;
  final Value<DateTime?> permissionDeniedAt;
  final Value<String?> userMode;
  final Value<bool> quitDatePrepEnabled;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const NotificationPreferencesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.frequency = const Value.absent(),
    this.quietHoursEnabled = const Value.absent(),
    this.quietHoursStart = const Value.absent(),
    this.quietHoursEnd = const Value.absent(),
    this.dailyCheckInEnabled = const Value.absent(),
    this.encouragementEnabled = const Value.absent(),
    this.milestoneEnabled = const Value.absent(),
    this.cravingTipsEnabled = const Value.absent(),
    this.microChallengesEnabled = const Value.absent(),
    this.progressUpdatesEnabled = const Value.absent(),
    this.streakRemindersEnabled = const Value.absent(),
    this.healthFactsEnabled = const Value.absent(),
    this.motivationalQuotesEnabled = const Value.absent(),
    this.preferredHours = const Value.absent(),
    this.permissionDeniedAt = const Value.absent(),
    this.userMode = const Value.absent(),
    this.quitDatePrepEnabled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NotificationPreferencesCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    this.notificationsEnabled = const Value.absent(),
    required String frequency,
    this.quietHoursEnabled = const Value.absent(),
    this.quietHoursStart = const Value.absent(),
    this.quietHoursEnd = const Value.absent(),
    this.dailyCheckInEnabled = const Value.absent(),
    this.encouragementEnabled = const Value.absent(),
    this.milestoneEnabled = const Value.absent(),
    this.cravingTipsEnabled = const Value.absent(),
    this.microChallengesEnabled = const Value.absent(),
    this.progressUpdatesEnabled = const Value.absent(),
    this.streakRemindersEnabled = const Value.absent(),
    this.healthFactsEnabled = const Value.absent(),
    this.motivationalQuotesEnabled = const Value.absent(),
    this.preferredHours = const Value.absent(),
    this.permissionDeniedAt = const Value.absent(),
    this.userMode = const Value.absent(),
    this.quitDatePrepEnabled = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
  }) : userId = Value(userId),
       frequency = Value(frequency),
       createdAt = Value(createdAt);
  static Insertable<DbNotificationPreference> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<bool>? notificationsEnabled,
    Expression<String>? frequency,
    Expression<bool>? quietHoursEnabled,
    Expression<int>? quietHoursStart,
    Expression<int>? quietHoursEnd,
    Expression<bool>? dailyCheckInEnabled,
    Expression<bool>? encouragementEnabled,
    Expression<bool>? milestoneEnabled,
    Expression<bool>? cravingTipsEnabled,
    Expression<bool>? microChallengesEnabled,
    Expression<bool>? progressUpdatesEnabled,
    Expression<bool>? streakRemindersEnabled,
    Expression<bool>? healthFactsEnabled,
    Expression<bool>? motivationalQuotesEnabled,
    Expression<String>? preferredHours,
    Expression<DateTime>? permissionDeniedAt,
    Expression<String>? userMode,
    Expression<bool>? quitDatePrepEnabled,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (frequency != null) 'frequency': frequency,
      if (quietHoursEnabled != null) 'quiet_hours_enabled': quietHoursEnabled,
      if (quietHoursStart != null) 'quiet_hours_start': quietHoursStart,
      if (quietHoursEnd != null) 'quiet_hours_end': quietHoursEnd,
      if (dailyCheckInEnabled != null)
        'daily_check_in_enabled': dailyCheckInEnabled,
      if (encouragementEnabled != null)
        'encouragement_enabled': encouragementEnabled,
      if (milestoneEnabled != null) 'milestone_enabled': milestoneEnabled,
      if (cravingTipsEnabled != null)
        'craving_tips_enabled': cravingTipsEnabled,
      if (microChallengesEnabled != null)
        'micro_challenges_enabled': microChallengesEnabled,
      if (progressUpdatesEnabled != null)
        'progress_updates_enabled': progressUpdatesEnabled,
      if (streakRemindersEnabled != null)
        'streak_reminders_enabled': streakRemindersEnabled,
      if (healthFactsEnabled != null)
        'health_facts_enabled': healthFactsEnabled,
      if (motivationalQuotesEnabled != null)
        'motivational_quotes_enabled': motivationalQuotesEnabled,
      if (preferredHours != null) 'preferred_hours': preferredHours,
      if (permissionDeniedAt != null)
        'permission_denied_at': permissionDeniedAt,
      if (userMode != null) 'user_mode': userMode,
      if (quitDatePrepEnabled != null)
        'quit_date_prep_enabled': quitDatePrepEnabled,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  NotificationPreferencesCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<bool>? notificationsEnabled,
    Value<String>? frequency,
    Value<bool>? quietHoursEnabled,
    Value<int>? quietHoursStart,
    Value<int>? quietHoursEnd,
    Value<bool>? dailyCheckInEnabled,
    Value<bool>? encouragementEnabled,
    Value<bool>? milestoneEnabled,
    Value<bool>? cravingTipsEnabled,
    Value<bool>? microChallengesEnabled,
    Value<bool>? progressUpdatesEnabled,
    Value<bool>? streakRemindersEnabled,
    Value<bool>? healthFactsEnabled,
    Value<bool>? motivationalQuotesEnabled,
    Value<List<int>?>? preferredHours,
    Value<DateTime?>? permissionDeniedAt,
    Value<String?>? userMode,
    Value<bool>? quitDatePrepEnabled,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return NotificationPreferencesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      frequency: frequency ?? this.frequency,
      quietHoursEnabled: quietHoursEnabled ?? this.quietHoursEnabled,
      quietHoursStart: quietHoursStart ?? this.quietHoursStart,
      quietHoursEnd: quietHoursEnd ?? this.quietHoursEnd,
      dailyCheckInEnabled: dailyCheckInEnabled ?? this.dailyCheckInEnabled,
      encouragementEnabled: encouragementEnabled ?? this.encouragementEnabled,
      milestoneEnabled: milestoneEnabled ?? this.milestoneEnabled,
      cravingTipsEnabled: cravingTipsEnabled ?? this.cravingTipsEnabled,
      microChallengesEnabled:
          microChallengesEnabled ?? this.microChallengesEnabled,
      progressUpdatesEnabled:
          progressUpdatesEnabled ?? this.progressUpdatesEnabled,
      streakRemindersEnabled:
          streakRemindersEnabled ?? this.streakRemindersEnabled,
      healthFactsEnabled: healthFactsEnabled ?? this.healthFactsEnabled,
      motivationalQuotesEnabled:
          motivationalQuotesEnabled ?? this.motivationalQuotesEnabled,
      preferredHours: preferredHours ?? this.preferredHours,
      permissionDeniedAt: permissionDeniedAt ?? this.permissionDeniedAt,
      userMode: userMode ?? this.userMode,
      quitDatePrepEnabled: quitDatePrepEnabled ?? this.quitDatePrepEnabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (quietHoursEnabled.present) {
      map['quiet_hours_enabled'] = Variable<bool>(quietHoursEnabled.value);
    }
    if (quietHoursStart.present) {
      map['quiet_hours_start'] = Variable<int>(quietHoursStart.value);
    }
    if (quietHoursEnd.present) {
      map['quiet_hours_end'] = Variable<int>(quietHoursEnd.value);
    }
    if (dailyCheckInEnabled.present) {
      map['daily_check_in_enabled'] = Variable<bool>(dailyCheckInEnabled.value);
    }
    if (encouragementEnabled.present) {
      map['encouragement_enabled'] = Variable<bool>(encouragementEnabled.value);
    }
    if (milestoneEnabled.present) {
      map['milestone_enabled'] = Variable<bool>(milestoneEnabled.value);
    }
    if (cravingTipsEnabled.present) {
      map['craving_tips_enabled'] = Variable<bool>(cravingTipsEnabled.value);
    }
    if (microChallengesEnabled.present) {
      map['micro_challenges_enabled'] = Variable<bool>(
        microChallengesEnabled.value,
      );
    }
    if (progressUpdatesEnabled.present) {
      map['progress_updates_enabled'] = Variable<bool>(
        progressUpdatesEnabled.value,
      );
    }
    if (streakRemindersEnabled.present) {
      map['streak_reminders_enabled'] = Variable<bool>(
        streakRemindersEnabled.value,
      );
    }
    if (healthFactsEnabled.present) {
      map['health_facts_enabled'] = Variable<bool>(healthFactsEnabled.value);
    }
    if (motivationalQuotesEnabled.present) {
      map['motivational_quotes_enabled'] = Variable<bool>(
        motivationalQuotesEnabled.value,
      );
    }
    if (preferredHours.present) {
      map['preferred_hours'] = Variable<String>(
        $NotificationPreferencesTable.$converterpreferredHoursn.toSql(
          preferredHours.value,
        ),
      );
    }
    if (permissionDeniedAt.present) {
      map['permission_denied_at'] = Variable<DateTime>(
        permissionDeniedAt.value,
      );
    }
    if (userMode.present) {
      map['user_mode'] = Variable<String>(userMode.value);
    }
    if (quitDatePrepEnabled.present) {
      map['quit_date_prep_enabled'] = Variable<bool>(quitDatePrepEnabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationPreferencesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('frequency: $frequency, ')
          ..write('quietHoursEnabled: $quietHoursEnabled, ')
          ..write('quietHoursStart: $quietHoursStart, ')
          ..write('quietHoursEnd: $quietHoursEnd, ')
          ..write('dailyCheckInEnabled: $dailyCheckInEnabled, ')
          ..write('encouragementEnabled: $encouragementEnabled, ')
          ..write('milestoneEnabled: $milestoneEnabled, ')
          ..write('cravingTipsEnabled: $cravingTipsEnabled, ')
          ..write('microChallengesEnabled: $microChallengesEnabled, ')
          ..write('progressUpdatesEnabled: $progressUpdatesEnabled, ')
          ..write('streakRemindersEnabled: $streakRemindersEnabled, ')
          ..write('healthFactsEnabled: $healthFactsEnabled, ')
          ..write('motivationalQuotesEnabled: $motivationalQuotesEnabled, ')
          ..write('preferredHours: $preferredHours, ')
          ..write('permissionDeniedAt: $permissionDeniedAt, ')
          ..write('userMode: $userMode, ')
          ..write('quitDatePrepEnabled: $quitDatePrepEnabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $NotificationHistoryTable extends NotificationHistory
    with TableInfo<$NotificationHistoryTable, DbNotificationHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sentAtMeta = const VerificationMeta('sentAt');
  @override
  late final GeneratedColumn<DateTime> sentAt = GeneratedColumn<DateTime>(
    'sent_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wasOpenedMeta = const VerificationMeta(
    'wasOpened',
  );
  @override
  late final GeneratedColumn<bool> wasOpened = GeneratedColumn<bool>(
    'was_opened',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("was_opened" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _openedAtMeta = const VerificationMeta(
    'openedAt',
  );
  @override
  late final GeneratedColumn<DateTime> openedAt = GeneratedColumn<DateTime>(
    'opened_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    type,
    title,
    body,
    sentAt,
    wasOpened,
    openedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbNotificationHistory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('sent_at')) {
      context.handle(
        _sentAtMeta,
        sentAt.isAcceptableOrUnknown(data['sent_at']!, _sentAtMeta),
      );
    } else if (isInserting) {
      context.missing(_sentAtMeta);
    }
    if (data.containsKey('was_opened')) {
      context.handle(
        _wasOpenedMeta,
        wasOpened.isAcceptableOrUnknown(data['was_opened']!, _wasOpenedMeta),
      );
    }
    if (data.containsKey('opened_at')) {
      context.handle(
        _openedAtMeta,
        openedAt.isAcceptableOrUnknown(data['opened_at']!, _openedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbNotificationHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbNotificationHistory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      sentAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}sent_at'],
      )!,
      wasOpened: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}was_opened'],
      )!,
      openedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}opened_at'],
      ),
    );
  }

  @override
  $NotificationHistoryTable createAlias(String alias) {
    return $NotificationHistoryTable(attachedDatabase, alias);
  }
}

class DbNotificationHistory extends DataClass
    implements Insertable<DbNotificationHistory> {
  final int id;
  final String userId;
  final String type;
  final String title;
  final String body;
  final DateTime sentAt;
  final bool wasOpened;
  final DateTime? openedAt;
  const DbNotificationHistory({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.body,
    required this.sentAt,
    required this.wasOpened,
    this.openedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['sent_at'] = Variable<DateTime>(sentAt);
    map['was_opened'] = Variable<bool>(wasOpened);
    if (!nullToAbsent || openedAt != null) {
      map['opened_at'] = Variable<DateTime>(openedAt);
    }
    return map;
  }

  NotificationHistoryCompanion toCompanion(bool nullToAbsent) {
    return NotificationHistoryCompanion(
      id: Value(id),
      userId: Value(userId),
      type: Value(type),
      title: Value(title),
      body: Value(body),
      sentAt: Value(sentAt),
      wasOpened: Value(wasOpened),
      openedAt: openedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(openedAt),
    );
  }

  factory DbNotificationHistory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbNotificationHistory(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      sentAt: serializer.fromJson<DateTime>(json['sentAt']),
      wasOpened: serializer.fromJson<bool>(json['wasOpened']),
      openedAt: serializer.fromJson<DateTime?>(json['openedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'sentAt': serializer.toJson<DateTime>(sentAt),
      'wasOpened': serializer.toJson<bool>(wasOpened),
      'openedAt': serializer.toJson<DateTime?>(openedAt),
    };
  }

  DbNotificationHistory copyWith({
    int? id,
    String? userId,
    String? type,
    String? title,
    String? body,
    DateTime? sentAt,
    bool? wasOpened,
    Value<DateTime?> openedAt = const Value.absent(),
  }) => DbNotificationHistory(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    type: type ?? this.type,
    title: title ?? this.title,
    body: body ?? this.body,
    sentAt: sentAt ?? this.sentAt,
    wasOpened: wasOpened ?? this.wasOpened,
    openedAt: openedAt.present ? openedAt.value : this.openedAt,
  );
  DbNotificationHistory copyWithCompanion(NotificationHistoryCompanion data) {
    return DbNotificationHistory(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      sentAt: data.sentAt.present ? data.sentAt.value : this.sentAt,
      wasOpened: data.wasOpened.present ? data.wasOpened.value : this.wasOpened,
      openedAt: data.openedAt.present ? data.openedAt.value : this.openedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbNotificationHistory(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('sentAt: $sentAt, ')
          ..write('wasOpened: $wasOpened, ')
          ..write('openedAt: $openedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, type, title, body, sentAt, wasOpened, openedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbNotificationHistory &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.title == this.title &&
          other.body == this.body &&
          other.sentAt == this.sentAt &&
          other.wasOpened == this.wasOpened &&
          other.openedAt == this.openedAt);
}

class NotificationHistoryCompanion
    extends UpdateCompanion<DbNotificationHistory> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> type;
  final Value<String> title;
  final Value<String> body;
  final Value<DateTime> sentAt;
  final Value<bool> wasOpened;
  final Value<DateTime?> openedAt;
  const NotificationHistoryCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.sentAt = const Value.absent(),
    this.wasOpened = const Value.absent(),
    this.openedAt = const Value.absent(),
  });
  NotificationHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String type,
    required String title,
    required String body,
    required DateTime sentAt,
    this.wasOpened = const Value.absent(),
    this.openedAt = const Value.absent(),
  }) : userId = Value(userId),
       type = Value(type),
       title = Value(title),
       body = Value(body),
       sentAt = Value(sentAt);
  static Insertable<DbNotificationHistory> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? body,
    Expression<DateTime>? sentAt,
    Expression<bool>? wasOpened,
    Expression<DateTime>? openedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (sentAt != null) 'sent_at': sentAt,
      if (wasOpened != null) 'was_opened': wasOpened,
      if (openedAt != null) 'opened_at': openedAt,
    });
  }

  NotificationHistoryCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? type,
    Value<String>? title,
    Value<String>? body,
    Value<DateTime>? sentAt,
    Value<bool>? wasOpened,
    Value<DateTime?>? openedAt,
  }) {
    return NotificationHistoryCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      title: title ?? this.title,
      body: body ?? this.body,
      sentAt: sentAt ?? this.sentAt,
      wasOpened: wasOpened ?? this.wasOpened,
      openedAt: openedAt ?? this.openedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (sentAt.present) {
      map['sent_at'] = Variable<DateTime>(sentAt.value);
    }
    if (wasOpened.present) {
      map['was_opened'] = Variable<bool>(wasOpened.value);
    }
    if (openedAt.present) {
      map['opened_at'] = Variable<DateTime>(openedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationHistoryCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('sentAt: $sentAt, ')
          ..write('wasOpened: $wasOpened, ')
          ..write('openedAt: $openedAt')
          ..write(')'))
        .toString();
  }
}

class $RelapsePlansTable extends RelapsePlans
    with TableInfo<$RelapsePlansTable, DbRelapsePlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelapsePlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  customSteps = GeneratedColumn<String>(
    'custom_steps',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<String>?>($RelapsePlansTable.$convertercustomStepsn);
  @override
  late final GeneratedColumnWithTypeConverter<
    List<Map<String, dynamic>>?,
    String
  >
  panicSteps =
      GeneratedColumn<String>(
        'panic_steps',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<Map<String, dynamic>>?>(
        $RelapsePlansTable.$converterpanicStepsn,
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nextReviewDateMeta = const VerificationMeta(
    'nextReviewDate',
  );
  @override
  late final GeneratedColumn<DateTime> nextReviewDate =
      GeneratedColumn<DateTime>(
        'next_review_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _personalRecoveryNoteMeta =
      const VerificationMeta('personalRecoveryNote');
  @override
  late final GeneratedColumn<String> personalRecoveryNote =
      GeneratedColumn<String>(
        'personal_recovery_note',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _lastReviewedAtMeta = const VerificationMeta(
    'lastReviewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReviewedAt =
      GeneratedColumn<DateTime>(
        'last_reviewed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    customSteps,
    panicSteps,
    notes,
    nextReviewDate,
    personalRecoveryNote,
    lastReviewedAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relapse_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbRelapsePlan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('next_review_date')) {
      context.handle(
        _nextReviewDateMeta,
        nextReviewDate.isAcceptableOrUnknown(
          data['next_review_date']!,
          _nextReviewDateMeta,
        ),
      );
    }
    if (data.containsKey('personal_recovery_note')) {
      context.handle(
        _personalRecoveryNoteMeta,
        personalRecoveryNote.isAcceptableOrUnknown(
          data['personal_recovery_note']!,
          _personalRecoveryNoteMeta,
        ),
      );
    }
    if (data.containsKey('last_reviewed_at')) {
      context.handle(
        _lastReviewedAtMeta,
        lastReviewedAt.isAcceptableOrUnknown(
          data['last_reviewed_at']!,
          _lastReviewedAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbRelapsePlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbRelapsePlan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      customSteps: $RelapsePlansTable.$convertercustomStepsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}custom_steps'],
        ),
      ),
      panicSteps: $RelapsePlansTable.$converterpanicStepsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}panic_steps'],
        ),
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      nextReviewDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_review_date'],
      ),
      personalRecoveryNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}personal_recovery_note'],
      ),
      lastReviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reviewed_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $RelapsePlansTable createAlias(String alias) {
    return $RelapsePlansTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertercustomSteps =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $convertercustomStepsn =
      NullAwareTypeConverter.wrap($convertercustomSteps);
  static TypeConverter<List<Map<String, dynamic>>, String>
  $converterpanicSteps = const PanicStepListConverter();
  static TypeConverter<List<Map<String, dynamic>>?, String?>
  $converterpanicStepsn = NullAwareTypeConverter.wrap($converterpanicSteps);
}

class DbRelapsePlan extends DataClass implements Insertable<DbRelapsePlan> {
  final int id;
  final String userId;
  final List<String>? customSteps;
  final List<Map<String, dynamic>>? panicSteps;
  final String? notes;
  final DateTime? nextReviewDate;
  final String? personalRecoveryNote;
  final DateTime? lastReviewedAt;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const DbRelapsePlan({
    required this.id,
    required this.userId,
    this.customSteps,
    this.panicSteps,
    this.notes,
    this.nextReviewDate,
    this.personalRecoveryNote,
    this.lastReviewedAt,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || customSteps != null) {
      map['custom_steps'] = Variable<String>(
        $RelapsePlansTable.$convertercustomStepsn.toSql(customSteps),
      );
    }
    if (!nullToAbsent || panicSteps != null) {
      map['panic_steps'] = Variable<String>(
        $RelapsePlansTable.$converterpanicStepsn.toSql(panicSteps),
      );
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || nextReviewDate != null) {
      map['next_review_date'] = Variable<DateTime>(nextReviewDate);
    }
    if (!nullToAbsent || personalRecoveryNote != null) {
      map['personal_recovery_note'] = Variable<String>(personalRecoveryNote);
    }
    if (!nullToAbsent || lastReviewedAt != null) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  RelapsePlansCompanion toCompanion(bool nullToAbsent) {
    return RelapsePlansCompanion(
      id: Value(id),
      userId: Value(userId),
      customSteps: customSteps == null && nullToAbsent
          ? const Value.absent()
          : Value(customSteps),
      panicSteps: panicSteps == null && nullToAbsent
          ? const Value.absent()
          : Value(panicSteps),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      nextReviewDate: nextReviewDate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextReviewDate),
      personalRecoveryNote: personalRecoveryNote == null && nullToAbsent
          ? const Value.absent()
          : Value(personalRecoveryNote),
      lastReviewedAt: lastReviewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewedAt),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbRelapsePlan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbRelapsePlan(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      customSteps: serializer.fromJson<List<String>?>(json['customSteps']),
      panicSteps: serializer.fromJson<List<Map<String, dynamic>>?>(
        json['panicSteps'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
      nextReviewDate: serializer.fromJson<DateTime?>(json['nextReviewDate']),
      personalRecoveryNote: serializer.fromJson<String?>(
        json['personalRecoveryNote'],
      ),
      lastReviewedAt: serializer.fromJson<DateTime?>(json['lastReviewedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'customSteps': serializer.toJson<List<String>?>(customSteps),
      'panicSteps': serializer.toJson<List<Map<String, dynamic>>?>(panicSteps),
      'notes': serializer.toJson<String?>(notes),
      'nextReviewDate': serializer.toJson<DateTime?>(nextReviewDate),
      'personalRecoveryNote': serializer.toJson<String?>(personalRecoveryNote),
      'lastReviewedAt': serializer.toJson<DateTime?>(lastReviewedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  DbRelapsePlan copyWith({
    int? id,
    String? userId,
    Value<List<String>?> customSteps = const Value.absent(),
    Value<List<Map<String, dynamic>>?> panicSteps = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<DateTime?> nextReviewDate = const Value.absent(),
    Value<String?> personalRecoveryNote = const Value.absent(),
    Value<DateTime?> lastReviewedAt = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => DbRelapsePlan(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    customSteps: customSteps.present ? customSteps.value : this.customSteps,
    panicSteps: panicSteps.present ? panicSteps.value : this.panicSteps,
    notes: notes.present ? notes.value : this.notes,
    nextReviewDate: nextReviewDate.present
        ? nextReviewDate.value
        : this.nextReviewDate,
    personalRecoveryNote: personalRecoveryNote.present
        ? personalRecoveryNote.value
        : this.personalRecoveryNote,
    lastReviewedAt: lastReviewedAt.present
        ? lastReviewedAt.value
        : this.lastReviewedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbRelapsePlan copyWithCompanion(RelapsePlansCompanion data) {
    return DbRelapsePlan(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      customSteps: data.customSteps.present
          ? data.customSteps.value
          : this.customSteps,
      panicSteps: data.panicSteps.present
          ? data.panicSteps.value
          : this.panicSteps,
      notes: data.notes.present ? data.notes.value : this.notes,
      nextReviewDate: data.nextReviewDate.present
          ? data.nextReviewDate.value
          : this.nextReviewDate,
      personalRecoveryNote: data.personalRecoveryNote.present
          ? data.personalRecoveryNote.value
          : this.personalRecoveryNote,
      lastReviewedAt: data.lastReviewedAt.present
          ? data.lastReviewedAt.value
          : this.lastReviewedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbRelapsePlan(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('customSteps: $customSteps, ')
          ..write('panicSteps: $panicSteps, ')
          ..write('notes: $notes, ')
          ..write('nextReviewDate: $nextReviewDate, ')
          ..write('personalRecoveryNote: $personalRecoveryNote, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    customSteps,
    panicSteps,
    notes,
    nextReviewDate,
    personalRecoveryNote,
    lastReviewedAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbRelapsePlan &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.customSteps == this.customSteps &&
          other.panicSteps == this.panicSteps &&
          other.notes == this.notes &&
          other.nextReviewDate == this.nextReviewDate &&
          other.personalRecoveryNote == this.personalRecoveryNote &&
          other.lastReviewedAt == this.lastReviewedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RelapsePlansCompanion extends UpdateCompanion<DbRelapsePlan> {
  final Value<int> id;
  final Value<String> userId;
  final Value<List<String>?> customSteps;
  final Value<List<Map<String, dynamic>>?> panicSteps;
  final Value<String?> notes;
  final Value<DateTime?> nextReviewDate;
  final Value<String?> personalRecoveryNote;
  final Value<DateTime?> lastReviewedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const RelapsePlansCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.customSteps = const Value.absent(),
    this.panicSteps = const Value.absent(),
    this.notes = const Value.absent(),
    this.nextReviewDate = const Value.absent(),
    this.personalRecoveryNote = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RelapsePlansCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    this.customSteps = const Value.absent(),
    this.panicSteps = const Value.absent(),
    this.notes = const Value.absent(),
    this.nextReviewDate = const Value.absent(),
    this.personalRecoveryNote = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
  }) : userId = Value(userId),
       createdAt = Value(createdAt);
  static Insertable<DbRelapsePlan> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? customSteps,
    Expression<String>? panicSteps,
    Expression<String>? notes,
    Expression<DateTime>? nextReviewDate,
    Expression<String>? personalRecoveryNote,
    Expression<DateTime>? lastReviewedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (customSteps != null) 'custom_steps': customSteps,
      if (panicSteps != null) 'panic_steps': panicSteps,
      if (notes != null) 'notes': notes,
      if (nextReviewDate != null) 'next_review_date': nextReviewDate,
      if (personalRecoveryNote != null)
        'personal_recovery_note': personalRecoveryNote,
      if (lastReviewedAt != null) 'last_reviewed_at': lastReviewedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RelapsePlansCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<List<String>?>? customSteps,
    Value<List<Map<String, dynamic>>?>? panicSteps,
    Value<String?>? notes,
    Value<DateTime?>? nextReviewDate,
    Value<String?>? personalRecoveryNote,
    Value<DateTime?>? lastReviewedAt,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return RelapsePlansCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      customSteps: customSteps ?? this.customSteps,
      panicSteps: panicSteps ?? this.panicSteps,
      notes: notes ?? this.notes,
      nextReviewDate: nextReviewDate ?? this.nextReviewDate,
      personalRecoveryNote: personalRecoveryNote ?? this.personalRecoveryNote,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (customSteps.present) {
      map['custom_steps'] = Variable<String>(
        $RelapsePlansTable.$convertercustomStepsn.toSql(customSteps.value),
      );
    }
    if (panicSteps.present) {
      map['panic_steps'] = Variable<String>(
        $RelapsePlansTable.$converterpanicStepsn.toSql(panicSteps.value),
      );
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (nextReviewDate.present) {
      map['next_review_date'] = Variable<DateTime>(nextReviewDate.value);
    }
    if (personalRecoveryNote.present) {
      map['personal_recovery_note'] = Variable<String>(
        personalRecoveryNote.value,
      );
    }
    if (lastReviewedAt.present) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelapsePlansCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('customSteps: $customSteps, ')
          ..write('panicSteps: $panicSteps, ')
          ..write('notes: $notes, ')
          ..write('nextReviewDate: $nextReviewDate, ')
          ..write('personalRecoveryNote: $personalRecoveryNote, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $RelapseContactsTable extends RelapseContacts
    with TableInfo<$RelapseContactsTable, DbRelapseContact> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelapseContactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relationshipMeta = const VerificationMeta(
    'relationship',
  );
  @override
  late final GeneratedColumn<String> relationship = GeneratedColumn<String>(
    'relationship',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _displayOrderMeta = const VerificationMeta(
    'displayOrder',
  );
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
    'display_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    name,
    phoneNumber,
    relationship,
    notes,
    displayOrder,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relapse_contacts';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbRelapseContact> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    }
    if (data.containsKey('relationship')) {
      context.handle(
        _relationshipMeta,
        relationship.isAcceptableOrUnknown(
          data['relationship']!,
          _relationshipMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('display_order')) {
      context.handle(
        _displayOrderMeta,
        displayOrder.isAcceptableOrUnknown(
          data['display_order']!,
          _displayOrderMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayOrderMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbRelapseContact map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbRelapseContact(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
      relationship: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relationship'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      displayOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}display_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $RelapseContactsTable createAlias(String alias) {
    return $RelapseContactsTable(attachedDatabase, alias);
  }
}

class DbRelapseContact extends DataClass
    implements Insertable<DbRelapseContact> {
  final int id;
  final String userId;
  final String name;
  final String? phoneNumber;
  final String? relationship;
  final String? notes;
  final int displayOrder;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const DbRelapseContact({
    required this.id,
    required this.userId,
    required this.name,
    this.phoneNumber,
    this.relationship,
    this.notes,
    required this.displayOrder,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || relationship != null) {
      map['relationship'] = Variable<String>(relationship);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['display_order'] = Variable<int>(displayOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  RelapseContactsCompanion toCompanion(bool nullToAbsent) {
    return RelapseContactsCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      relationship: relationship == null && nullToAbsent
          ? const Value.absent()
          : Value(relationship),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      displayOrder: Value(displayOrder),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbRelapseContact.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbRelapseContact(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      relationship: serializer.fromJson<String?>(json['relationship']),
      notes: serializer.fromJson<String?>(json['notes']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'relationship': serializer.toJson<String?>(relationship),
      'notes': serializer.toJson<String?>(notes),
      'displayOrder': serializer.toJson<int>(displayOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  DbRelapseContact copyWith({
    int? id,
    String? userId,
    String? name,
    Value<String?> phoneNumber = const Value.absent(),
    Value<String?> relationship = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    int? displayOrder,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => DbRelapseContact(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
    relationship: relationship.present ? relationship.value : this.relationship,
    notes: notes.present ? notes.value : this.notes,
    displayOrder: displayOrder ?? this.displayOrder,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbRelapseContact copyWithCompanion(RelapseContactsCompanion data) {
    return DbRelapseContact(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      relationship: data.relationship.present
          ? data.relationship.value
          : this.relationship,
      notes: data.notes.present ? data.notes.value : this.notes,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbRelapseContact(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('relationship: $relationship, ')
          ..write('notes: $notes, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    name,
    phoneNumber,
    relationship,
    notes,
    displayOrder,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbRelapseContact &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.phoneNumber == this.phoneNumber &&
          other.relationship == this.relationship &&
          other.notes == this.notes &&
          other.displayOrder == this.displayOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RelapseContactsCompanion extends UpdateCompanion<DbRelapseContact> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> name;
  final Value<String?> phoneNumber;
  final Value<String?> relationship;
  final Value<String?> notes;
  final Value<int> displayOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const RelapseContactsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.relationship = const Value.absent(),
    this.notes = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RelapseContactsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String name,
    this.phoneNumber = const Value.absent(),
    this.relationship = const Value.absent(),
    this.notes = const Value.absent(),
    required int displayOrder,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
  }) : userId = Value(userId),
       name = Value(name),
       displayOrder = Value(displayOrder),
       createdAt = Value(createdAt);
  static Insertable<DbRelapseContact> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? phoneNumber,
    Expression<String>? relationship,
    Expression<String>? notes,
    Expression<int>? displayOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (relationship != null) 'relationship': relationship,
      if (notes != null) 'notes': notes,
      if (displayOrder != null) 'display_order': displayOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RelapseContactsCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? name,
    Value<String?>? phoneNumber,
    Value<String?>? relationship,
    Value<String?>? notes,
    Value<int>? displayOrder,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return RelapseContactsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      relationship: relationship ?? this.relationship,
      notes: notes ?? this.notes,
      displayOrder: displayOrder ?? this.displayOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<String>(relationship.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelapseContactsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('relationship: $relationship, ')
          ..write('notes: $notes, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LapseRecoverySessionsTable extends LapseRecoverySessions
    with TableInfo<$LapseRecoverySessionsTable, DbLapseRecoverySession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LapseRecoverySessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _chosenActionMeta = const VerificationMeta(
    'chosenAction',
  );
  @override
  late final GeneratedColumn<String> chosenAction = GeneratedColumn<String>(
    'chosen_action',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  selectedTriggers =
      GeneratedColumn<String>(
        'selected_triggers',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>(
        $LapseRecoverySessionsTable.$converterselectedTriggersn,
      );
  static const VerificationMeta _openedToolkitMeta = const VerificationMeta(
    'openedToolkit',
  );
  @override
  late final GeneratedColumn<bool> openedToolkit = GeneratedColumn<bool>(
    'opened_toolkit',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("opened_toolkit" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _readRecoveryGuideMeta = const VerificationMeta(
    'readRecoveryGuide',
  );
  @override
  late final GeneratedColumn<bool> readRecoveryGuide = GeneratedColumn<bool>(
    'read_recovery_guide',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("read_recovery_guide" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _recoveryNoteMeta = const VerificationMeta(
    'recoveryNote',
  );
  @override
  late final GeneratedColumn<String> recoveryNote = GeneratedColumn<String>(
    'recovery_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    userId,
    startedAt,
    completedAt,
    chosenAction,
    selectedTriggers,
    openedToolkit,
    readRecoveryGuide,
    recoveryNote,
    mode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lapse_recovery_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbLapseRecoverySession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('chosen_action')) {
      context.handle(
        _chosenActionMeta,
        chosenAction.isAcceptableOrUnknown(
          data['chosen_action']!,
          _chosenActionMeta,
        ),
      );
    }
    if (data.containsKey('opened_toolkit')) {
      context.handle(
        _openedToolkitMeta,
        openedToolkit.isAcceptableOrUnknown(
          data['opened_toolkit']!,
          _openedToolkitMeta,
        ),
      );
    }
    if (data.containsKey('read_recovery_guide')) {
      context.handle(
        _readRecoveryGuideMeta,
        readRecoveryGuide.isAcceptableOrUnknown(
          data['read_recovery_guide']!,
          _readRecoveryGuideMeta,
        ),
      );
    }
    if (data.containsKey('recovery_note')) {
      context.handle(
        _recoveryNoteMeta,
        recoveryNote.isAcceptableOrUnknown(
          data['recovery_note']!,
          _recoveryNoteMeta,
        ),
      );
    }
    if (data.containsKey('mode')) {
      context.handle(
        _modeMeta,
        mode.isAcceptableOrUnknown(data['mode']!, _modeMeta),
      );
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbLapseRecoverySession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbLapseRecoverySession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      chosenAction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chosen_action'],
      ),
      selectedTriggers: $LapseRecoverySessionsTable.$converterselectedTriggersn
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}selected_triggers'],
            ),
          ),
      openedToolkit: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}opened_toolkit'],
      )!,
      readRecoveryGuide: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}read_recovery_guide'],
      )!,
      recoveryNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recovery_note'],
      ),
      mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode'],
      )!,
    );
  }

  @override
  $LapseRecoverySessionsTable createAlias(String alias) {
    return $LapseRecoverySessionsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterselectedTriggers =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterselectedTriggersn =
      NullAwareTypeConverter.wrap($converterselectedTriggers);
}

class DbLapseRecoverySession extends DataClass
    implements Insertable<DbLapseRecoverySession> {
  final int id;
  final String sessionId;
  final String userId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final String? chosenAction;
  final List<String>? selectedTriggers;
  final bool openedToolkit;
  final bool readRecoveryGuide;
  final String? recoveryNote;
  final String mode;
  const DbLapseRecoverySession({
    required this.id,
    required this.sessionId,
    required this.userId,
    required this.startedAt,
    this.completedAt,
    this.chosenAction,
    this.selectedTriggers,
    required this.openedToolkit,
    required this.readRecoveryGuide,
    this.recoveryNote,
    required this.mode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['user_id'] = Variable<String>(userId);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || chosenAction != null) {
      map['chosen_action'] = Variable<String>(chosenAction);
    }
    if (!nullToAbsent || selectedTriggers != null) {
      map['selected_triggers'] = Variable<String>(
        $LapseRecoverySessionsTable.$converterselectedTriggersn.toSql(
          selectedTriggers,
        ),
      );
    }
    map['opened_toolkit'] = Variable<bool>(openedToolkit);
    map['read_recovery_guide'] = Variable<bool>(readRecoveryGuide);
    if (!nullToAbsent || recoveryNote != null) {
      map['recovery_note'] = Variable<String>(recoveryNote);
    }
    map['mode'] = Variable<String>(mode);
    return map;
  }

  LapseRecoverySessionsCompanion toCompanion(bool nullToAbsent) {
    return LapseRecoverySessionsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      userId: Value(userId),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      chosenAction: chosenAction == null && nullToAbsent
          ? const Value.absent()
          : Value(chosenAction),
      selectedTriggers: selectedTriggers == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedTriggers),
      openedToolkit: Value(openedToolkit),
      readRecoveryGuide: Value(readRecoveryGuide),
      recoveryNote: recoveryNote == null && nullToAbsent
          ? const Value.absent()
          : Value(recoveryNote),
      mode: Value(mode),
    );
  }

  factory DbLapseRecoverySession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbLapseRecoverySession(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      userId: serializer.fromJson<String>(json['userId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      chosenAction: serializer.fromJson<String?>(json['chosenAction']),
      selectedTriggers: serializer.fromJson<List<String>?>(
        json['selectedTriggers'],
      ),
      openedToolkit: serializer.fromJson<bool>(json['openedToolkit']),
      readRecoveryGuide: serializer.fromJson<bool>(json['readRecoveryGuide']),
      recoveryNote: serializer.fromJson<String?>(json['recoveryNote']),
      mode: serializer.fromJson<String>(json['mode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'userId': serializer.toJson<String>(userId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'chosenAction': serializer.toJson<String?>(chosenAction),
      'selectedTriggers': serializer.toJson<List<String>?>(selectedTriggers),
      'openedToolkit': serializer.toJson<bool>(openedToolkit),
      'readRecoveryGuide': serializer.toJson<bool>(readRecoveryGuide),
      'recoveryNote': serializer.toJson<String?>(recoveryNote),
      'mode': serializer.toJson<String>(mode),
    };
  }

  DbLapseRecoverySession copyWith({
    int? id,
    String? sessionId,
    String? userId,
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    Value<String?> chosenAction = const Value.absent(),
    Value<List<String>?> selectedTriggers = const Value.absent(),
    bool? openedToolkit,
    bool? readRecoveryGuide,
    Value<String?> recoveryNote = const Value.absent(),
    String? mode,
  }) => DbLapseRecoverySession(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    userId: userId ?? this.userId,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    chosenAction: chosenAction.present ? chosenAction.value : this.chosenAction,
    selectedTriggers: selectedTriggers.present
        ? selectedTriggers.value
        : this.selectedTriggers,
    openedToolkit: openedToolkit ?? this.openedToolkit,
    readRecoveryGuide: readRecoveryGuide ?? this.readRecoveryGuide,
    recoveryNote: recoveryNote.present ? recoveryNote.value : this.recoveryNote,
    mode: mode ?? this.mode,
  );
  DbLapseRecoverySession copyWithCompanion(
    LapseRecoverySessionsCompanion data,
  ) {
    return DbLapseRecoverySession(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      userId: data.userId.present ? data.userId.value : this.userId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      chosenAction: data.chosenAction.present
          ? data.chosenAction.value
          : this.chosenAction,
      selectedTriggers: data.selectedTriggers.present
          ? data.selectedTriggers.value
          : this.selectedTriggers,
      openedToolkit: data.openedToolkit.present
          ? data.openedToolkit.value
          : this.openedToolkit,
      readRecoveryGuide: data.readRecoveryGuide.present
          ? data.readRecoveryGuide.value
          : this.readRecoveryGuide,
      recoveryNote: data.recoveryNote.present
          ? data.recoveryNote.value
          : this.recoveryNote,
      mode: data.mode.present ? data.mode.value : this.mode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbLapseRecoverySession(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('userId: $userId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('chosenAction: $chosenAction, ')
          ..write('selectedTriggers: $selectedTriggers, ')
          ..write('openedToolkit: $openedToolkit, ')
          ..write('readRecoveryGuide: $readRecoveryGuide, ')
          ..write('recoveryNote: $recoveryNote, ')
          ..write('mode: $mode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    userId,
    startedAt,
    completedAt,
    chosenAction,
    selectedTriggers,
    openedToolkit,
    readRecoveryGuide,
    recoveryNote,
    mode,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbLapseRecoverySession &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.userId == this.userId &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.chosenAction == this.chosenAction &&
          other.selectedTriggers == this.selectedTriggers &&
          other.openedToolkit == this.openedToolkit &&
          other.readRecoveryGuide == this.readRecoveryGuide &&
          other.recoveryNote == this.recoveryNote &&
          other.mode == this.mode);
}

class LapseRecoverySessionsCompanion
    extends UpdateCompanion<DbLapseRecoverySession> {
  final Value<int> id;
  final Value<String> sessionId;
  final Value<String> userId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<String?> chosenAction;
  final Value<List<String>?> selectedTriggers;
  final Value<bool> openedToolkit;
  final Value<bool> readRecoveryGuide;
  final Value<String?> recoveryNote;
  final Value<String> mode;
  const LapseRecoverySessionsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.userId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.chosenAction = const Value.absent(),
    this.selectedTriggers = const Value.absent(),
    this.openedToolkit = const Value.absent(),
    this.readRecoveryGuide = const Value.absent(),
    this.recoveryNote = const Value.absent(),
    this.mode = const Value.absent(),
  });
  LapseRecoverySessionsCompanion.insert({
    this.id = const Value.absent(),
    required String sessionId,
    required String userId,
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    this.chosenAction = const Value.absent(),
    this.selectedTriggers = const Value.absent(),
    this.openedToolkit = const Value.absent(),
    this.readRecoveryGuide = const Value.absent(),
    this.recoveryNote = const Value.absent(),
    required String mode,
  }) : sessionId = Value(sessionId),
       userId = Value(userId),
       startedAt = Value(startedAt),
       mode = Value(mode);
  static Insertable<DbLapseRecoverySession> custom({
    Expression<int>? id,
    Expression<String>? sessionId,
    Expression<String>? userId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<String>? chosenAction,
    Expression<String>? selectedTriggers,
    Expression<bool>? openedToolkit,
    Expression<bool>? readRecoveryGuide,
    Expression<String>? recoveryNote,
    Expression<String>? mode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (userId != null) 'user_id': userId,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (chosenAction != null) 'chosen_action': chosenAction,
      if (selectedTriggers != null) 'selected_triggers': selectedTriggers,
      if (openedToolkit != null) 'opened_toolkit': openedToolkit,
      if (readRecoveryGuide != null) 'read_recovery_guide': readRecoveryGuide,
      if (recoveryNote != null) 'recovery_note': recoveryNote,
      if (mode != null) 'mode': mode,
    });
  }

  LapseRecoverySessionsCompanion copyWith({
    Value<int>? id,
    Value<String>? sessionId,
    Value<String>? userId,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<String?>? chosenAction,
    Value<List<String>?>? selectedTriggers,
    Value<bool>? openedToolkit,
    Value<bool>? readRecoveryGuide,
    Value<String?>? recoveryNote,
    Value<String>? mode,
  }) {
    return LapseRecoverySessionsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      userId: userId ?? this.userId,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      chosenAction: chosenAction ?? this.chosenAction,
      selectedTriggers: selectedTriggers ?? this.selectedTriggers,
      openedToolkit: openedToolkit ?? this.openedToolkit,
      readRecoveryGuide: readRecoveryGuide ?? this.readRecoveryGuide,
      recoveryNote: recoveryNote ?? this.recoveryNote,
      mode: mode ?? this.mode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (chosenAction.present) {
      map['chosen_action'] = Variable<String>(chosenAction.value);
    }
    if (selectedTriggers.present) {
      map['selected_triggers'] = Variable<String>(
        $LapseRecoverySessionsTable.$converterselectedTriggersn.toSql(
          selectedTriggers.value,
        ),
      );
    }
    if (openedToolkit.present) {
      map['opened_toolkit'] = Variable<bool>(openedToolkit.value);
    }
    if (readRecoveryGuide.present) {
      map['read_recovery_guide'] = Variable<bool>(readRecoveryGuide.value);
    }
    if (recoveryNote.present) {
      map['recovery_note'] = Variable<String>(recoveryNote.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LapseRecoverySessionsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('userId: $userId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('chosenAction: $chosenAction, ')
          ..write('selectedTriggers: $selectedTriggers, ')
          ..write('openedToolkit: $openedToolkit, ')
          ..write('readRecoveryGuide: $readRecoveryGuide, ')
          ..write('recoveryNote: $recoveryNote, ')
          ..write('mode: $mode')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabase.connect(DatabaseConnection c) : super.connect(c);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $LogEntriesTable logEntries = $LogEntriesTable(this);
  late final $CravingEntriesTable cravingEntries = $CravingEntriesTable(this);
  late final $WeeklyReviewsTable weeklyReviews = $WeeklyReviewsTable(this);
  late final $AchievementsTable achievements = $AchievementsTable(this);
  late final $BreathingSessionsTable breathingSessions =
      $BreathingSessionsTable(this);
  late final $CbtSessionsTable cbtSessions = $CbtSessionsTable(this);
  late final $GroundingSessionsTable groundingSessions =
      $GroundingSessionsTable(this);
  late final $DistractionSessionsTable distractionSessions =
      $DistractionSessionsTable(this);
  late final $ToolkitExercisesTable toolkitExercises = $ToolkitExercisesTable(
    this,
  );
  late final $ToolkitSessionsTable toolkitSessions = $ToolkitSessionsTable(
    this,
  );
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  late final $ScheduledNotificationsTable scheduledNotifications =
      $ScheduledNotificationsTable(this);
  late final $NotificationPreferencesTable notificationPreferences =
      $NotificationPreferencesTable(this);
  late final $NotificationHistoryTable notificationHistory =
      $NotificationHistoryTable(this);
  late final $RelapsePlansTable relapsePlans = $RelapsePlansTable(this);
  late final $RelapseContactsTable relapseContacts = $RelapseContactsTable(
    this,
  );
  late final $LapseRecoverySessionsTable lapseRecoverySessions =
      $LapseRecoverySessionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userProfiles,
    logEntries,
    cravingEntries,
    weeklyReviews,
    achievements,
    breathingSessions,
    cbtSessions,
    groundingSessions,
    distractionSessions,
    toolkitExercises,
    toolkitSessions,
    journalEntries,
    scheduledNotifications,
    notificationPreferences,
    notificationHistory,
    relapsePlans,
    relapseContacts,
    lapseRecoverySessions,
  ];
}

typedef $$UserProfilesTableCreateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<int> id,
      required String userId,
      Value<String?> nickname,
      required String goalType,
      Value<bool> modeLocked,
      Value<int> longestStreakDays,
      Value<int> recoveryCount,
      Value<DateTime?> lastLapseAt,
      Value<int?> cigarettesPerDay,
      Value<int?> cigarettesPerPack,
      Value<double?> costPerPack,
      Value<int?> ttfcMinutesIndex,
      Value<int?> yearsSmoking,
      Value<String?> reductionPlanJson,
      Value<int?> previousQuitAttempts,
      Value<List<String>?> previousAids,
      Value<int?> confidenceToQuit,
      Value<List<String>?> smokingWindows,
      Value<int?> episodesPerWeek,
      Value<int?> episodeDurationMinutes,
      Value<bool?> pornInvolvementFlag,
      Value<int?> distressLevel,
      Value<int?> sleepEffectIndex,
      Value<int?> focusEffectIndex,
      Value<int?> relationshipEffectIndex,
      Value<int?> previousReductionAttempts,
      Value<int?> confidenceToReduce,
      Value<int?> frequencyTarget,
      Value<List<String>?> timeOfDayPatterns,
      Value<List<String>?> values,
      Value<List<String>?> triggers,
      Value<List<String>?> reasons,
      Value<DateTime?> quitDate,
      required DateTime createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$UserProfilesTableUpdateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String?> nickname,
      Value<String> goalType,
      Value<bool> modeLocked,
      Value<int> longestStreakDays,
      Value<int> recoveryCount,
      Value<DateTime?> lastLapseAt,
      Value<int?> cigarettesPerDay,
      Value<int?> cigarettesPerPack,
      Value<double?> costPerPack,
      Value<int?> ttfcMinutesIndex,
      Value<int?> yearsSmoking,
      Value<String?> reductionPlanJson,
      Value<int?> previousQuitAttempts,
      Value<List<String>?> previousAids,
      Value<int?> confidenceToQuit,
      Value<List<String>?> smokingWindows,
      Value<int?> episodesPerWeek,
      Value<int?> episodeDurationMinutes,
      Value<bool?> pornInvolvementFlag,
      Value<int?> distressLevel,
      Value<int?> sleepEffectIndex,
      Value<int?> focusEffectIndex,
      Value<int?> relationshipEffectIndex,
      Value<int?> previousReductionAttempts,
      Value<int?> confidenceToReduce,
      Value<int?> frequencyTarget,
      Value<List<String>?> timeOfDayPatterns,
      Value<List<String>?> values,
      Value<List<String>?> triggers,
      Value<List<String>?> reasons,
      Value<DateTime?> quitDate,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get goalType => $composableBuilder(
    column: $table.goalType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get modeLocked => $composableBuilder(
    column: $table.modeLocked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get longestStreakDays => $composableBuilder(
    column: $table.longestStreakDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get recoveryCount => $composableBuilder(
    column: $table.recoveryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastLapseAt => $composableBuilder(
    column: $table.lastLapseAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cigarettesPerDay => $composableBuilder(
    column: $table.cigarettesPerDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cigarettesPerPack => $composableBuilder(
    column: $table.cigarettesPerPack,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costPerPack => $composableBuilder(
    column: $table.costPerPack,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ttfcMinutesIndex => $composableBuilder(
    column: $table.ttfcMinutesIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get yearsSmoking => $composableBuilder(
    column: $table.yearsSmoking,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reductionPlanJson => $composableBuilder(
    column: $table.reductionPlanJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get previousQuitAttempts => $composableBuilder(
    column: $table.previousQuitAttempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get previousAids => $composableBuilder(
    column: $table.previousAids,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get confidenceToQuit => $composableBuilder(
    column: $table.confidenceToQuit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get smokingWindows => $composableBuilder(
    column: $table.smokingWindows,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get episodesPerWeek => $composableBuilder(
    column: $table.episodesPerWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get episodeDurationMinutes => $composableBuilder(
    column: $table.episodeDurationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pornInvolvementFlag => $composableBuilder(
    column: $table.pornInvolvementFlag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get distressLevel => $composableBuilder(
    column: $table.distressLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sleepEffectIndex => $composableBuilder(
    column: $table.sleepEffectIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get focusEffectIndex => $composableBuilder(
    column: $table.focusEffectIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get relationshipEffectIndex => $composableBuilder(
    column: $table.relationshipEffectIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get previousReductionAttempts => $composableBuilder(
    column: $table.previousReductionAttempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get confidenceToReduce => $composableBuilder(
    column: $table.confidenceToReduce,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get frequencyTarget => $composableBuilder(
    column: $table.frequencyTarget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get timeOfDayPatterns => $composableBuilder(
    column: $table.timeOfDayPatterns,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get values => $composableBuilder(
    column: $table.values,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get triggers => $composableBuilder(
    column: $table.triggers,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get reasons => $composableBuilder(
    column: $table.reasons,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get quitDate => $composableBuilder(
    column: $table.quitDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goalType => $composableBuilder(
    column: $table.goalType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get modeLocked => $composableBuilder(
    column: $table.modeLocked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get longestStreakDays => $composableBuilder(
    column: $table.longestStreakDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recoveryCount => $composableBuilder(
    column: $table.recoveryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastLapseAt => $composableBuilder(
    column: $table.lastLapseAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cigarettesPerDay => $composableBuilder(
    column: $table.cigarettesPerDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cigarettesPerPack => $composableBuilder(
    column: $table.cigarettesPerPack,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costPerPack => $composableBuilder(
    column: $table.costPerPack,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ttfcMinutesIndex => $composableBuilder(
    column: $table.ttfcMinutesIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get yearsSmoking => $composableBuilder(
    column: $table.yearsSmoking,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reductionPlanJson => $composableBuilder(
    column: $table.reductionPlanJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get previousQuitAttempts => $composableBuilder(
    column: $table.previousQuitAttempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get previousAids => $composableBuilder(
    column: $table.previousAids,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get confidenceToQuit => $composableBuilder(
    column: $table.confidenceToQuit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get smokingWindows => $composableBuilder(
    column: $table.smokingWindows,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episodesPerWeek => $composableBuilder(
    column: $table.episodesPerWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get episodeDurationMinutes => $composableBuilder(
    column: $table.episodeDurationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pornInvolvementFlag => $composableBuilder(
    column: $table.pornInvolvementFlag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get distressLevel => $composableBuilder(
    column: $table.distressLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sleepEffectIndex => $composableBuilder(
    column: $table.sleepEffectIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get focusEffectIndex => $composableBuilder(
    column: $table.focusEffectIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get relationshipEffectIndex => $composableBuilder(
    column: $table.relationshipEffectIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get previousReductionAttempts => $composableBuilder(
    column: $table.previousReductionAttempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get confidenceToReduce => $composableBuilder(
    column: $table.confidenceToReduce,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get frequencyTarget => $composableBuilder(
    column: $table.frequencyTarget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timeOfDayPatterns => $composableBuilder(
    column: $table.timeOfDayPatterns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get values => $composableBuilder(
    column: $table.values,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggers => $composableBuilder(
    column: $table.triggers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reasons => $composableBuilder(
    column: $table.reasons,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get quitDate => $composableBuilder(
    column: $table.quitDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<String> get goalType =>
      $composableBuilder(column: $table.goalType, builder: (column) => column);

  GeneratedColumn<bool> get modeLocked => $composableBuilder(
    column: $table.modeLocked,
    builder: (column) => column,
  );

  GeneratedColumn<int> get longestStreakDays => $composableBuilder(
    column: $table.longestStreakDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get recoveryCount => $composableBuilder(
    column: $table.recoveryCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastLapseAt => $composableBuilder(
    column: $table.lastLapseAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cigarettesPerDay => $composableBuilder(
    column: $table.cigarettesPerDay,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cigarettesPerPack => $composableBuilder(
    column: $table.cigarettesPerPack,
    builder: (column) => column,
  );

  GeneratedColumn<double> get costPerPack => $composableBuilder(
    column: $table.costPerPack,
    builder: (column) => column,
  );

  GeneratedColumn<int> get ttfcMinutesIndex => $composableBuilder(
    column: $table.ttfcMinutesIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get yearsSmoking => $composableBuilder(
    column: $table.yearsSmoking,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reductionPlanJson => $composableBuilder(
    column: $table.reductionPlanJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get previousQuitAttempts => $composableBuilder(
    column: $table.previousQuitAttempts,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<String>?, String> get previousAids =>
      $composableBuilder(
        column: $table.previousAids,
        builder: (column) => column,
      );

  GeneratedColumn<int> get confidenceToQuit => $composableBuilder(
    column: $table.confidenceToQuit,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<String>?, String> get smokingWindows =>
      $composableBuilder(
        column: $table.smokingWindows,
        builder: (column) => column,
      );

  GeneratedColumn<int> get episodesPerWeek => $composableBuilder(
    column: $table.episodesPerWeek,
    builder: (column) => column,
  );

  GeneratedColumn<int> get episodeDurationMinutes => $composableBuilder(
    column: $table.episodeDurationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get pornInvolvementFlag => $composableBuilder(
    column: $table.pornInvolvementFlag,
    builder: (column) => column,
  );

  GeneratedColumn<int> get distressLevel => $composableBuilder(
    column: $table.distressLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sleepEffectIndex => $composableBuilder(
    column: $table.sleepEffectIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get focusEffectIndex => $composableBuilder(
    column: $table.focusEffectIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get relationshipEffectIndex => $composableBuilder(
    column: $table.relationshipEffectIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get previousReductionAttempts => $composableBuilder(
    column: $table.previousReductionAttempts,
    builder: (column) => column,
  );

  GeneratedColumn<int> get confidenceToReduce => $composableBuilder(
    column: $table.confidenceToReduce,
    builder: (column) => column,
  );

  GeneratedColumn<int> get frequencyTarget => $composableBuilder(
    column: $table.frequencyTarget,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<String>?, String>
  get timeOfDayPatterns => $composableBuilder(
    column: $table.timeOfDayPatterns,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<String>?, String> get values =>
      $composableBuilder(column: $table.values, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get triggers =>
      $composableBuilder(column: $table.triggers, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get reasons =>
      $composableBuilder(column: $table.reasons, builder: (column) => column);

  GeneratedColumn<DateTime> get quitDate =>
      $composableBuilder(column: $table.quitDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesTable,
          DbUserProfile,
          $$UserProfilesTableFilterComposer,
          $$UserProfilesTableOrderingComposer,
          $$UserProfilesTableAnnotationComposer,
          $$UserProfilesTableCreateCompanionBuilder,
          $$UserProfilesTableUpdateCompanionBuilder,
          (
            DbUserProfile,
            BaseReferences<_$AppDatabase, $UserProfilesTable, DbUserProfile>,
          ),
          DbUserProfile,
          PrefetchHooks Function()
        > {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> nickname = const Value.absent(),
                Value<String> goalType = const Value.absent(),
                Value<bool> modeLocked = const Value.absent(),
                Value<int> longestStreakDays = const Value.absent(),
                Value<int> recoveryCount = const Value.absent(),
                Value<DateTime?> lastLapseAt = const Value.absent(),
                Value<int?> cigarettesPerDay = const Value.absent(),
                Value<int?> cigarettesPerPack = const Value.absent(),
                Value<double?> costPerPack = const Value.absent(),
                Value<int?> ttfcMinutesIndex = const Value.absent(),
                Value<int?> yearsSmoking = const Value.absent(),
                Value<String?> reductionPlanJson = const Value.absent(),
                Value<int?> previousQuitAttempts = const Value.absent(),
                Value<List<String>?> previousAids = const Value.absent(),
                Value<int?> confidenceToQuit = const Value.absent(),
                Value<List<String>?> smokingWindows = const Value.absent(),
                Value<int?> episodesPerWeek = const Value.absent(),
                Value<int?> episodeDurationMinutes = const Value.absent(),
                Value<bool?> pornInvolvementFlag = const Value.absent(),
                Value<int?> distressLevel = const Value.absent(),
                Value<int?> sleepEffectIndex = const Value.absent(),
                Value<int?> focusEffectIndex = const Value.absent(),
                Value<int?> relationshipEffectIndex = const Value.absent(),
                Value<int?> previousReductionAttempts = const Value.absent(),
                Value<int?> confidenceToReduce = const Value.absent(),
                Value<int?> frequencyTarget = const Value.absent(),
                Value<List<String>?> timeOfDayPatterns = const Value.absent(),
                Value<List<String>?> values = const Value.absent(),
                Value<List<String>?> triggers = const Value.absent(),
                Value<List<String>?> reasons = const Value.absent(),
                Value<DateTime?> quitDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => UserProfilesCompanion(
                id: id,
                userId: userId,
                nickname: nickname,
                goalType: goalType,
                modeLocked: modeLocked,
                longestStreakDays: longestStreakDays,
                recoveryCount: recoveryCount,
                lastLapseAt: lastLapseAt,
                cigarettesPerDay: cigarettesPerDay,
                cigarettesPerPack: cigarettesPerPack,
                costPerPack: costPerPack,
                ttfcMinutesIndex: ttfcMinutesIndex,
                yearsSmoking: yearsSmoking,
                reductionPlanJson: reductionPlanJson,
                previousQuitAttempts: previousQuitAttempts,
                previousAids: previousAids,
                confidenceToQuit: confidenceToQuit,
                smokingWindows: smokingWindows,
                episodesPerWeek: episodesPerWeek,
                episodeDurationMinutes: episodeDurationMinutes,
                pornInvolvementFlag: pornInvolvementFlag,
                distressLevel: distressLevel,
                sleepEffectIndex: sleepEffectIndex,
                focusEffectIndex: focusEffectIndex,
                relationshipEffectIndex: relationshipEffectIndex,
                previousReductionAttempts: previousReductionAttempts,
                confidenceToReduce: confidenceToReduce,
                frequencyTarget: frequencyTarget,
                timeOfDayPatterns: timeOfDayPatterns,
                values: values,
                triggers: triggers,
                reasons: reasons,
                quitDate: quitDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                Value<String?> nickname = const Value.absent(),
                required String goalType,
                Value<bool> modeLocked = const Value.absent(),
                Value<int> longestStreakDays = const Value.absent(),
                Value<int> recoveryCount = const Value.absent(),
                Value<DateTime?> lastLapseAt = const Value.absent(),
                Value<int?> cigarettesPerDay = const Value.absent(),
                Value<int?> cigarettesPerPack = const Value.absent(),
                Value<double?> costPerPack = const Value.absent(),
                Value<int?> ttfcMinutesIndex = const Value.absent(),
                Value<int?> yearsSmoking = const Value.absent(),
                Value<String?> reductionPlanJson = const Value.absent(),
                Value<int?> previousQuitAttempts = const Value.absent(),
                Value<List<String>?> previousAids = const Value.absent(),
                Value<int?> confidenceToQuit = const Value.absent(),
                Value<List<String>?> smokingWindows = const Value.absent(),
                Value<int?> episodesPerWeek = const Value.absent(),
                Value<int?> episodeDurationMinutes = const Value.absent(),
                Value<bool?> pornInvolvementFlag = const Value.absent(),
                Value<int?> distressLevel = const Value.absent(),
                Value<int?> sleepEffectIndex = const Value.absent(),
                Value<int?> focusEffectIndex = const Value.absent(),
                Value<int?> relationshipEffectIndex = const Value.absent(),
                Value<int?> previousReductionAttempts = const Value.absent(),
                Value<int?> confidenceToReduce = const Value.absent(),
                Value<int?> frequencyTarget = const Value.absent(),
                Value<List<String>?> timeOfDayPatterns = const Value.absent(),
                Value<List<String>?> values = const Value.absent(),
                Value<List<String>?> triggers = const Value.absent(),
                Value<List<String>?> reasons = const Value.absent(),
                Value<DateTime?> quitDate = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => UserProfilesCompanion.insert(
                id: id,
                userId: userId,
                nickname: nickname,
                goalType: goalType,
                modeLocked: modeLocked,
                longestStreakDays: longestStreakDays,
                recoveryCount: recoveryCount,
                lastLapseAt: lastLapseAt,
                cigarettesPerDay: cigarettesPerDay,
                cigarettesPerPack: cigarettesPerPack,
                costPerPack: costPerPack,
                ttfcMinutesIndex: ttfcMinutesIndex,
                yearsSmoking: yearsSmoking,
                reductionPlanJson: reductionPlanJson,
                previousQuitAttempts: previousQuitAttempts,
                previousAids: previousAids,
                confidenceToQuit: confidenceToQuit,
                smokingWindows: smokingWindows,
                episodesPerWeek: episodesPerWeek,
                episodeDurationMinutes: episodeDurationMinutes,
                pornInvolvementFlag: pornInvolvementFlag,
                distressLevel: distressLevel,
                sleepEffectIndex: sleepEffectIndex,
                focusEffectIndex: focusEffectIndex,
                relationshipEffectIndex: relationshipEffectIndex,
                previousReductionAttempts: previousReductionAttempts,
                confidenceToReduce: confidenceToReduce,
                frequencyTarget: frequencyTarget,
                timeOfDayPatterns: timeOfDayPatterns,
                values: values,
                triggers: triggers,
                reasons: reasons,
                quitDate: quitDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesTable,
      DbUserProfile,
      $$UserProfilesTableFilterComposer,
      $$UserProfilesTableOrderingComposer,
      $$UserProfilesTableAnnotationComposer,
      $$UserProfilesTableCreateCompanionBuilder,
      $$UserProfilesTableUpdateCompanionBuilder,
      (
        DbUserProfile,
        BaseReferences<_$AppDatabase, $UserProfilesTable, DbUserProfile>,
      ),
      DbUserProfile,
      PrefetchHooks Function()
    >;
typedef $$LogEntriesTableCreateCompanionBuilder =
    LogEntriesCompanion Function({
      Value<int> id,
      required String userId,
      required String type,
      required DateTime timestamp,
      Value<String?> mood,
      Value<List<String>?> triggers,
      Value<String?> notes,
      Value<int?> quantity,
      Value<int?> durationSeconds,
      Value<int?> intensity,
      Value<int?> distressRating,
      Value<String?> location,
      Value<bool?> wasResisted,
      required DateTime createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$LogEntriesTableUpdateCompanionBuilder =
    LogEntriesCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> type,
      Value<DateTime> timestamp,
      Value<String?> mood,
      Value<List<String>?> triggers,
      Value<String?> notes,
      Value<int?> quantity,
      Value<int?> durationSeconds,
      Value<int?> intensity,
      Value<int?> distressRating,
      Value<String?> location,
      Value<bool?> wasResisted,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

class $$LogEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $LogEntriesTable> {
  $$LogEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get triggers => $composableBuilder(
    column: $table.triggers,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intensity => $composableBuilder(
    column: $table.intensity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get distressRating => $composableBuilder(
    column: $table.distressRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get wasResisted => $composableBuilder(
    column: $table.wasResisted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LogEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $LogEntriesTable> {
  $$LogEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggers => $composableBuilder(
    column: $table.triggers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intensity => $composableBuilder(
    column: $table.intensity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get distressRating => $composableBuilder(
    column: $table.distressRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get wasResisted => $composableBuilder(
    column: $table.wasResisted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LogEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LogEntriesTable> {
  $$LogEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get triggers =>
      $composableBuilder(column: $table.triggers, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intensity =>
      $composableBuilder(column: $table.intensity, builder: (column) => column);

  GeneratedColumn<int> get distressRating => $composableBuilder(
    column: $table.distressRating,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<bool> get wasResisted => $composableBuilder(
    column: $table.wasResisted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LogEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LogEntriesTable,
          DbLogEntry,
          $$LogEntriesTableFilterComposer,
          $$LogEntriesTableOrderingComposer,
          $$LogEntriesTableAnnotationComposer,
          $$LogEntriesTableCreateCompanionBuilder,
          $$LogEntriesTableUpdateCompanionBuilder,
          (
            DbLogEntry,
            BaseReferences<_$AppDatabase, $LogEntriesTable, DbLogEntry>,
          ),
          DbLogEntry,
          PrefetchHooks Function()
        > {
  $$LogEntriesTableTableManager(_$AppDatabase db, $LogEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LogEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LogEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LogEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String?> mood = const Value.absent(),
                Value<List<String>?> triggers = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> quantity = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<int?> intensity = const Value.absent(),
                Value<int?> distressRating = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<bool?> wasResisted = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => LogEntriesCompanion(
                id: id,
                userId: userId,
                type: type,
                timestamp: timestamp,
                mood: mood,
                triggers: triggers,
                notes: notes,
                quantity: quantity,
                durationSeconds: durationSeconds,
                intensity: intensity,
                distressRating: distressRating,
                location: location,
                wasResisted: wasResisted,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String type,
                required DateTime timestamp,
                Value<String?> mood = const Value.absent(),
                Value<List<String>?> triggers = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> quantity = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<int?> intensity = const Value.absent(),
                Value<int?> distressRating = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<bool?> wasResisted = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => LogEntriesCompanion.insert(
                id: id,
                userId: userId,
                type: type,
                timestamp: timestamp,
                mood: mood,
                triggers: triggers,
                notes: notes,
                quantity: quantity,
                durationSeconds: durationSeconds,
                intensity: intensity,
                distressRating: distressRating,
                location: location,
                wasResisted: wasResisted,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LogEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LogEntriesTable,
      DbLogEntry,
      $$LogEntriesTableFilterComposer,
      $$LogEntriesTableOrderingComposer,
      $$LogEntriesTableAnnotationComposer,
      $$LogEntriesTableCreateCompanionBuilder,
      $$LogEntriesTableUpdateCompanionBuilder,
      (DbLogEntry, BaseReferences<_$AppDatabase, $LogEntriesTable, DbLogEntry>),
      DbLogEntry,
      PrefetchHooks Function()
    >;
typedef $$CravingEntriesTableCreateCompanionBuilder =
    CravingEntriesCompanion Function({
      Value<int> id,
      required String userId,
      required DateTime startTime,
      Value<DateTime?> endTime,
      required String initialIntensity,
      Value<String?> finalIntensity,
      Value<String?> outcome,
      Value<List<String>?> triggers,
      Value<List<String>?> copingStrategiesUsed,
      Value<String?> notes,
      Value<String?> location,
      required DateTime createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$CravingEntriesTableUpdateCompanionBuilder =
    CravingEntriesCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<DateTime> startTime,
      Value<DateTime?> endTime,
      Value<String> initialIntensity,
      Value<String?> finalIntensity,
      Value<String?> outcome,
      Value<List<String>?> triggers,
      Value<List<String>?> copingStrategiesUsed,
      Value<String?> notes,
      Value<String?> location,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

class $$CravingEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CravingEntriesTable> {
  $$CravingEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get initialIntensity => $composableBuilder(
    column: $table.initialIntensity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get finalIntensity => $composableBuilder(
    column: $table.finalIntensity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get triggers => $composableBuilder(
    column: $table.triggers,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get copingStrategiesUsed => $composableBuilder(
    column: $table.copingStrategiesUsed,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CravingEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CravingEntriesTable> {
  $$CravingEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get initialIntensity => $composableBuilder(
    column: $table.initialIntensity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get finalIntensity => $composableBuilder(
    column: $table.finalIntensity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggers => $composableBuilder(
    column: $table.triggers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get copingStrategiesUsed => $composableBuilder(
    column: $table.copingStrategiesUsed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CravingEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CravingEntriesTable> {
  $$CravingEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get initialIntensity => $composableBuilder(
    column: $table.initialIntensity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get finalIntensity => $composableBuilder(
    column: $table.finalIntensity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get outcome =>
      $composableBuilder(column: $table.outcome, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get triggers =>
      $composableBuilder(column: $table.triggers, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String>
  get copingStrategiesUsed => $composableBuilder(
    column: $table.copingStrategiesUsed,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CravingEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CravingEntriesTable,
          DbCravingEntry,
          $$CravingEntriesTableFilterComposer,
          $$CravingEntriesTableOrderingComposer,
          $$CravingEntriesTableAnnotationComposer,
          $$CravingEntriesTableCreateCompanionBuilder,
          $$CravingEntriesTableUpdateCompanionBuilder,
          (
            DbCravingEntry,
            BaseReferences<_$AppDatabase, $CravingEntriesTable, DbCravingEntry>,
          ),
          DbCravingEntry,
          PrefetchHooks Function()
        > {
  $$CravingEntriesTableTableManager(
    _$AppDatabase db,
    $CravingEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CravingEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CravingEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CravingEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<String> initialIntensity = const Value.absent(),
                Value<String?> finalIntensity = const Value.absent(),
                Value<String?> outcome = const Value.absent(),
                Value<List<String>?> triggers = const Value.absent(),
                Value<List<String>?> copingStrategiesUsed =
                    const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => CravingEntriesCompanion(
                id: id,
                userId: userId,
                startTime: startTime,
                endTime: endTime,
                initialIntensity: initialIntensity,
                finalIntensity: finalIntensity,
                outcome: outcome,
                triggers: triggers,
                copingStrategiesUsed: copingStrategiesUsed,
                notes: notes,
                location: location,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required DateTime startTime,
                Value<DateTime?> endTime = const Value.absent(),
                required String initialIntensity,
                Value<String?> finalIntensity = const Value.absent(),
                Value<String?> outcome = const Value.absent(),
                Value<List<String>?> triggers = const Value.absent(),
                Value<List<String>?> copingStrategiesUsed =
                    const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> location = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => CravingEntriesCompanion.insert(
                id: id,
                userId: userId,
                startTime: startTime,
                endTime: endTime,
                initialIntensity: initialIntensity,
                finalIntensity: finalIntensity,
                outcome: outcome,
                triggers: triggers,
                copingStrategiesUsed: copingStrategiesUsed,
                notes: notes,
                location: location,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CravingEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CravingEntriesTable,
      DbCravingEntry,
      $$CravingEntriesTableFilterComposer,
      $$CravingEntriesTableOrderingComposer,
      $$CravingEntriesTableAnnotationComposer,
      $$CravingEntriesTableCreateCompanionBuilder,
      $$CravingEntriesTableUpdateCompanionBuilder,
      (
        DbCravingEntry,
        BaseReferences<_$AppDatabase, $CravingEntriesTable, DbCravingEntry>,
      ),
      DbCravingEntry,
      PrefetchHooks Function()
    >;
typedef $$WeeklyReviewsTableCreateCompanionBuilder =
    WeeklyReviewsCompanion Function({
      Value<int> id,
      required String userId,
      required DateTime weekStart,
      required int checkInsCount,
      required int toolkitSessionsCount,
      required int cravingsResisted,
      required int lapseEvents,
      Value<String?> topTrigger,
      Value<String?> mostUsedExercise,
      Value<String?> motivationalSummary,
      required DateTime generatedAt,
    });
typedef $$WeeklyReviewsTableUpdateCompanionBuilder =
    WeeklyReviewsCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<DateTime> weekStart,
      Value<int> checkInsCount,
      Value<int> toolkitSessionsCount,
      Value<int> cravingsResisted,
      Value<int> lapseEvents,
      Value<String?> topTrigger,
      Value<String?> mostUsedExercise,
      Value<String?> motivationalSummary,
      Value<DateTime> generatedAt,
    });

class $$WeeklyReviewsTableFilterComposer
    extends Composer<_$AppDatabase, $WeeklyReviewsTable> {
  $$WeeklyReviewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get weekStart => $composableBuilder(
    column: $table.weekStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get checkInsCount => $composableBuilder(
    column: $table.checkInsCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get toolkitSessionsCount => $composableBuilder(
    column: $table.toolkitSessionsCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cravingsResisted => $composableBuilder(
    column: $table.cravingsResisted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lapseEvents => $composableBuilder(
    column: $table.lapseEvents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get topTrigger => $composableBuilder(
    column: $table.topTrigger,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mostUsedExercise => $composableBuilder(
    column: $table.mostUsedExercise,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get motivationalSummary => $composableBuilder(
    column: $table.motivationalSummary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeeklyReviewsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeeklyReviewsTable> {
  $$WeeklyReviewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get weekStart => $composableBuilder(
    column: $table.weekStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get checkInsCount => $composableBuilder(
    column: $table.checkInsCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get toolkitSessionsCount => $composableBuilder(
    column: $table.toolkitSessionsCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cravingsResisted => $composableBuilder(
    column: $table.cravingsResisted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lapseEvents => $composableBuilder(
    column: $table.lapseEvents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get topTrigger => $composableBuilder(
    column: $table.topTrigger,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mostUsedExercise => $composableBuilder(
    column: $table.mostUsedExercise,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get motivationalSummary => $composableBuilder(
    column: $table.motivationalSummary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeeklyReviewsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeeklyReviewsTable> {
  $$WeeklyReviewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get weekStart =>
      $composableBuilder(column: $table.weekStart, builder: (column) => column);

  GeneratedColumn<int> get checkInsCount => $composableBuilder(
    column: $table.checkInsCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get toolkitSessionsCount => $composableBuilder(
    column: $table.toolkitSessionsCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cravingsResisted => $composableBuilder(
    column: $table.cravingsResisted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lapseEvents => $composableBuilder(
    column: $table.lapseEvents,
    builder: (column) => column,
  );

  GeneratedColumn<String> get topTrigger => $composableBuilder(
    column: $table.topTrigger,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mostUsedExercise => $composableBuilder(
    column: $table.mostUsedExercise,
    builder: (column) => column,
  );

  GeneratedColumn<String> get motivationalSummary => $composableBuilder(
    column: $table.motivationalSummary,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => column,
  );
}

class $$WeeklyReviewsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeeklyReviewsTable,
          DbWeeklyReview,
          $$WeeklyReviewsTableFilterComposer,
          $$WeeklyReviewsTableOrderingComposer,
          $$WeeklyReviewsTableAnnotationComposer,
          $$WeeklyReviewsTableCreateCompanionBuilder,
          $$WeeklyReviewsTableUpdateCompanionBuilder,
          (
            DbWeeklyReview,
            BaseReferences<_$AppDatabase, $WeeklyReviewsTable, DbWeeklyReview>,
          ),
          DbWeeklyReview,
          PrefetchHooks Function()
        > {
  $$WeeklyReviewsTableTableManager(_$AppDatabase db, $WeeklyReviewsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeeklyReviewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeeklyReviewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeeklyReviewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> weekStart = const Value.absent(),
                Value<int> checkInsCount = const Value.absent(),
                Value<int> toolkitSessionsCount = const Value.absent(),
                Value<int> cravingsResisted = const Value.absent(),
                Value<int> lapseEvents = const Value.absent(),
                Value<String?> topTrigger = const Value.absent(),
                Value<String?> mostUsedExercise = const Value.absent(),
                Value<String?> motivationalSummary = const Value.absent(),
                Value<DateTime> generatedAt = const Value.absent(),
              }) => WeeklyReviewsCompanion(
                id: id,
                userId: userId,
                weekStart: weekStart,
                checkInsCount: checkInsCount,
                toolkitSessionsCount: toolkitSessionsCount,
                cravingsResisted: cravingsResisted,
                lapseEvents: lapseEvents,
                topTrigger: topTrigger,
                mostUsedExercise: mostUsedExercise,
                motivationalSummary: motivationalSummary,
                generatedAt: generatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required DateTime weekStart,
                required int checkInsCount,
                required int toolkitSessionsCount,
                required int cravingsResisted,
                required int lapseEvents,
                Value<String?> topTrigger = const Value.absent(),
                Value<String?> mostUsedExercise = const Value.absent(),
                Value<String?> motivationalSummary = const Value.absent(),
                required DateTime generatedAt,
              }) => WeeklyReviewsCompanion.insert(
                id: id,
                userId: userId,
                weekStart: weekStart,
                checkInsCount: checkInsCount,
                toolkitSessionsCount: toolkitSessionsCount,
                cravingsResisted: cravingsResisted,
                lapseEvents: lapseEvents,
                topTrigger: topTrigger,
                mostUsedExercise: mostUsedExercise,
                motivationalSummary: motivationalSummary,
                generatedAt: generatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeeklyReviewsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeeklyReviewsTable,
      DbWeeklyReview,
      $$WeeklyReviewsTableFilterComposer,
      $$WeeklyReviewsTableOrderingComposer,
      $$WeeklyReviewsTableAnnotationComposer,
      $$WeeklyReviewsTableCreateCompanionBuilder,
      $$WeeklyReviewsTableUpdateCompanionBuilder,
      (
        DbWeeklyReview,
        BaseReferences<_$AppDatabase, $WeeklyReviewsTable, DbWeeklyReview>,
      ),
      DbWeeklyReview,
      PrefetchHooks Function()
    >;
typedef $$AchievementsTableCreateCompanionBuilder =
    AchievementsCompanion Function({
      Value<int> id,
      required String userId,
      required String achievementId,
      required String name,
      required String description,
      required String iconEmoji,
      required String category,
      Value<String?> modeFilter,
      required int progressValue,
      required int progressMax,
      required bool isUnlocked,
      Value<DateTime?> unlockedAt,
    });
typedef $$AchievementsTableUpdateCompanionBuilder =
    AchievementsCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> achievementId,
      Value<String> name,
      Value<String> description,
      Value<String> iconEmoji,
      Value<String> category,
      Value<String?> modeFilter,
      Value<int> progressValue,
      Value<int> progressMax,
      Value<bool> isUnlocked,
      Value<DateTime?> unlockedAt,
    });

class $$AchievementsTableFilterComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get achievementId => $composableBuilder(
    column: $table.achievementId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconEmoji => $composableBuilder(
    column: $table.iconEmoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modeFilter => $composableBuilder(
    column: $table.modeFilter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get progressValue => $composableBuilder(
    column: $table.progressValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get progressMax => $composableBuilder(
    column: $table.progressMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUnlocked => $composableBuilder(
    column: $table.isUnlocked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AchievementsTableOrderingComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get achievementId => $composableBuilder(
    column: $table.achievementId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconEmoji => $composableBuilder(
    column: $table.iconEmoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modeFilter => $composableBuilder(
    column: $table.modeFilter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get progressValue => $composableBuilder(
    column: $table.progressValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get progressMax => $composableBuilder(
    column: $table.progressMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUnlocked => $composableBuilder(
    column: $table.isUnlocked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AchievementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get achievementId => $composableBuilder(
    column: $table.achievementId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get iconEmoji =>
      $composableBuilder(column: $table.iconEmoji, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get modeFilter => $composableBuilder(
    column: $table.modeFilter,
    builder: (column) => column,
  );

  GeneratedColumn<int> get progressValue => $composableBuilder(
    column: $table.progressValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get progressMax => $composableBuilder(
    column: $table.progressMax,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isUnlocked => $composableBuilder(
    column: $table.isUnlocked,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => column,
  );
}

class $$AchievementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AchievementsTable,
          DbAchievement,
          $$AchievementsTableFilterComposer,
          $$AchievementsTableOrderingComposer,
          $$AchievementsTableAnnotationComposer,
          $$AchievementsTableCreateCompanionBuilder,
          $$AchievementsTableUpdateCompanionBuilder,
          (
            DbAchievement,
            BaseReferences<_$AppDatabase, $AchievementsTable, DbAchievement>,
          ),
          DbAchievement,
          PrefetchHooks Function()
        > {
  $$AchievementsTableTableManager(_$AppDatabase db, $AchievementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AchievementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AchievementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AchievementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> achievementId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> iconEmoji = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> modeFilter = const Value.absent(),
                Value<int> progressValue = const Value.absent(),
                Value<int> progressMax = const Value.absent(),
                Value<bool> isUnlocked = const Value.absent(),
                Value<DateTime?> unlockedAt = const Value.absent(),
              }) => AchievementsCompanion(
                id: id,
                userId: userId,
                achievementId: achievementId,
                name: name,
                description: description,
                iconEmoji: iconEmoji,
                category: category,
                modeFilter: modeFilter,
                progressValue: progressValue,
                progressMax: progressMax,
                isUnlocked: isUnlocked,
                unlockedAt: unlockedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String achievementId,
                required String name,
                required String description,
                required String iconEmoji,
                required String category,
                Value<String?> modeFilter = const Value.absent(),
                required int progressValue,
                required int progressMax,
                required bool isUnlocked,
                Value<DateTime?> unlockedAt = const Value.absent(),
              }) => AchievementsCompanion.insert(
                id: id,
                userId: userId,
                achievementId: achievementId,
                name: name,
                description: description,
                iconEmoji: iconEmoji,
                category: category,
                modeFilter: modeFilter,
                progressValue: progressValue,
                progressMax: progressMax,
                isUnlocked: isUnlocked,
                unlockedAt: unlockedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AchievementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AchievementsTable,
      DbAchievement,
      $$AchievementsTableFilterComposer,
      $$AchievementsTableOrderingComposer,
      $$AchievementsTableAnnotationComposer,
      $$AchievementsTableCreateCompanionBuilder,
      $$AchievementsTableUpdateCompanionBuilder,
      (
        DbAchievement,
        BaseReferences<_$AppDatabase, $AchievementsTable, DbAchievement>,
      ),
      DbAchievement,
      PrefetchHooks Function()
    >;
typedef $$BreathingSessionsTableCreateCompanionBuilder =
    BreathingSessionsCompanion Function({
      Value<int> id,
      required String userId,
      required String pattern,
      required int durationSeconds,
      required int cyclesCompleted,
      required DateTime startTime,
      Value<DateTime?> endTime,
      Value<int?> cravingId,
      Value<int?> effectivenessRating,
      required DateTime createdAt,
    });
typedef $$BreathingSessionsTableUpdateCompanionBuilder =
    BreathingSessionsCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> pattern,
      Value<int> durationSeconds,
      Value<int> cyclesCompleted,
      Value<DateTime> startTime,
      Value<DateTime?> endTime,
      Value<int?> cravingId,
      Value<int?> effectivenessRating,
      Value<DateTime> createdAt,
    });

class $$BreathingSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $BreathingSessionsTable> {
  $$BreathingSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pattern => $composableBuilder(
    column: $table.pattern,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cyclesCompleted => $composableBuilder(
    column: $table.cyclesCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cravingId => $composableBuilder(
    column: $table.cravingId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get effectivenessRating => $composableBuilder(
    column: $table.effectivenessRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BreathingSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $BreathingSessionsTable> {
  $$BreathingSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pattern => $composableBuilder(
    column: $table.pattern,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cyclesCompleted => $composableBuilder(
    column: $table.cyclesCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cravingId => $composableBuilder(
    column: $table.cravingId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get effectivenessRating => $composableBuilder(
    column: $table.effectivenessRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BreathingSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BreathingSessionsTable> {
  $$BreathingSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get pattern =>
      $composableBuilder(column: $table.pattern, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cyclesCompleted => $composableBuilder(
    column: $table.cyclesCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get cravingId =>
      $composableBuilder(column: $table.cravingId, builder: (column) => column);

  GeneratedColumn<int> get effectivenessRating => $composableBuilder(
    column: $table.effectivenessRating,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BreathingSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BreathingSessionsTable,
          DbBreathingSession,
          $$BreathingSessionsTableFilterComposer,
          $$BreathingSessionsTableOrderingComposer,
          $$BreathingSessionsTableAnnotationComposer,
          $$BreathingSessionsTableCreateCompanionBuilder,
          $$BreathingSessionsTableUpdateCompanionBuilder,
          (
            DbBreathingSession,
            BaseReferences<
              _$AppDatabase,
              $BreathingSessionsTable,
              DbBreathingSession
            >,
          ),
          DbBreathingSession,
          PrefetchHooks Function()
        > {
  $$BreathingSessionsTableTableManager(
    _$AppDatabase db,
    $BreathingSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BreathingSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BreathingSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BreathingSessionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> pattern = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<int> cyclesCompleted = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<int?> cravingId = const Value.absent(),
                Value<int?> effectivenessRating = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BreathingSessionsCompanion(
                id: id,
                userId: userId,
                pattern: pattern,
                durationSeconds: durationSeconds,
                cyclesCompleted: cyclesCompleted,
                startTime: startTime,
                endTime: endTime,
                cravingId: cravingId,
                effectivenessRating: effectivenessRating,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String pattern,
                required int durationSeconds,
                required int cyclesCompleted,
                required DateTime startTime,
                Value<DateTime?> endTime = const Value.absent(),
                Value<int?> cravingId = const Value.absent(),
                Value<int?> effectivenessRating = const Value.absent(),
                required DateTime createdAt,
              }) => BreathingSessionsCompanion.insert(
                id: id,
                userId: userId,
                pattern: pattern,
                durationSeconds: durationSeconds,
                cyclesCompleted: cyclesCompleted,
                startTime: startTime,
                endTime: endTime,
                cravingId: cravingId,
                effectivenessRating: effectivenessRating,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BreathingSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BreathingSessionsTable,
      DbBreathingSession,
      $$BreathingSessionsTableFilterComposer,
      $$BreathingSessionsTableOrderingComposer,
      $$BreathingSessionsTableAnnotationComposer,
      $$BreathingSessionsTableCreateCompanionBuilder,
      $$BreathingSessionsTableUpdateCompanionBuilder,
      (
        DbBreathingSession,
        BaseReferences<
          _$AppDatabase,
          $BreathingSessionsTable,
          DbBreathingSession
        >,
      ),
      DbBreathingSession,
      PrefetchHooks Function()
    >;
typedef $$CbtSessionsTableCreateCompanionBuilder =
    CbtSessionsCompanion Function({
      Value<int> id,
      required String userId,
      required String technique,
      required DateTime startTime,
      Value<DateTime?> endTime,
      Value<String?> thoughtsBefore,
      Value<String?> thoughtsAfter,
      Value<String?> consequences,
      Value<String?> alternativeChosen,
      Value<int?> cravingId,
      Value<bool?> wasHelpful,
      Value<int?> helpfulnessRating,
      required DateTime createdAt,
    });
typedef $$CbtSessionsTableUpdateCompanionBuilder =
    CbtSessionsCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> technique,
      Value<DateTime> startTime,
      Value<DateTime?> endTime,
      Value<String?> thoughtsBefore,
      Value<String?> thoughtsAfter,
      Value<String?> consequences,
      Value<String?> alternativeChosen,
      Value<int?> cravingId,
      Value<bool?> wasHelpful,
      Value<int?> helpfulnessRating,
      Value<DateTime> createdAt,
    });

class $$CbtSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $CbtSessionsTable> {
  $$CbtSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get technique => $composableBuilder(
    column: $table.technique,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thoughtsBefore => $composableBuilder(
    column: $table.thoughtsBefore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thoughtsAfter => $composableBuilder(
    column: $table.thoughtsAfter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get consequences => $composableBuilder(
    column: $table.consequences,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alternativeChosen => $composableBuilder(
    column: $table.alternativeChosen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cravingId => $composableBuilder(
    column: $table.cravingId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get wasHelpful => $composableBuilder(
    column: $table.wasHelpful,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get helpfulnessRating => $composableBuilder(
    column: $table.helpfulnessRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CbtSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CbtSessionsTable> {
  $$CbtSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get technique => $composableBuilder(
    column: $table.technique,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thoughtsBefore => $composableBuilder(
    column: $table.thoughtsBefore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thoughtsAfter => $composableBuilder(
    column: $table.thoughtsAfter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get consequences => $composableBuilder(
    column: $table.consequences,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alternativeChosen => $composableBuilder(
    column: $table.alternativeChosen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cravingId => $composableBuilder(
    column: $table.cravingId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get wasHelpful => $composableBuilder(
    column: $table.wasHelpful,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get helpfulnessRating => $composableBuilder(
    column: $table.helpfulnessRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CbtSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CbtSessionsTable> {
  $$CbtSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get technique =>
      $composableBuilder(column: $table.technique, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get thoughtsBefore => $composableBuilder(
    column: $table.thoughtsBefore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get thoughtsAfter => $composableBuilder(
    column: $table.thoughtsAfter,
    builder: (column) => column,
  );

  GeneratedColumn<String> get consequences => $composableBuilder(
    column: $table.consequences,
    builder: (column) => column,
  );

  GeneratedColumn<String> get alternativeChosen => $composableBuilder(
    column: $table.alternativeChosen,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cravingId =>
      $composableBuilder(column: $table.cravingId, builder: (column) => column);

  GeneratedColumn<bool> get wasHelpful => $composableBuilder(
    column: $table.wasHelpful,
    builder: (column) => column,
  );

  GeneratedColumn<int> get helpfulnessRating => $composableBuilder(
    column: $table.helpfulnessRating,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CbtSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CbtSessionsTable,
          DbCbtSession,
          $$CbtSessionsTableFilterComposer,
          $$CbtSessionsTableOrderingComposer,
          $$CbtSessionsTableAnnotationComposer,
          $$CbtSessionsTableCreateCompanionBuilder,
          $$CbtSessionsTableUpdateCompanionBuilder,
          (
            DbCbtSession,
            BaseReferences<_$AppDatabase, $CbtSessionsTable, DbCbtSession>,
          ),
          DbCbtSession,
          PrefetchHooks Function()
        > {
  $$CbtSessionsTableTableManager(_$AppDatabase db, $CbtSessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CbtSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CbtSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CbtSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> technique = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<String?> thoughtsBefore = const Value.absent(),
                Value<String?> thoughtsAfter = const Value.absent(),
                Value<String?> consequences = const Value.absent(),
                Value<String?> alternativeChosen = const Value.absent(),
                Value<int?> cravingId = const Value.absent(),
                Value<bool?> wasHelpful = const Value.absent(),
                Value<int?> helpfulnessRating = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CbtSessionsCompanion(
                id: id,
                userId: userId,
                technique: technique,
                startTime: startTime,
                endTime: endTime,
                thoughtsBefore: thoughtsBefore,
                thoughtsAfter: thoughtsAfter,
                consequences: consequences,
                alternativeChosen: alternativeChosen,
                cravingId: cravingId,
                wasHelpful: wasHelpful,
                helpfulnessRating: helpfulnessRating,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String technique,
                required DateTime startTime,
                Value<DateTime?> endTime = const Value.absent(),
                Value<String?> thoughtsBefore = const Value.absent(),
                Value<String?> thoughtsAfter = const Value.absent(),
                Value<String?> consequences = const Value.absent(),
                Value<String?> alternativeChosen = const Value.absent(),
                Value<int?> cravingId = const Value.absent(),
                Value<bool?> wasHelpful = const Value.absent(),
                Value<int?> helpfulnessRating = const Value.absent(),
                required DateTime createdAt,
              }) => CbtSessionsCompanion.insert(
                id: id,
                userId: userId,
                technique: technique,
                startTime: startTime,
                endTime: endTime,
                thoughtsBefore: thoughtsBefore,
                thoughtsAfter: thoughtsAfter,
                consequences: consequences,
                alternativeChosen: alternativeChosen,
                cravingId: cravingId,
                wasHelpful: wasHelpful,
                helpfulnessRating: helpfulnessRating,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CbtSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CbtSessionsTable,
      DbCbtSession,
      $$CbtSessionsTableFilterComposer,
      $$CbtSessionsTableOrderingComposer,
      $$CbtSessionsTableAnnotationComposer,
      $$CbtSessionsTableCreateCompanionBuilder,
      $$CbtSessionsTableUpdateCompanionBuilder,
      (
        DbCbtSession,
        BaseReferences<_$AppDatabase, $CbtSessionsTable, DbCbtSession>,
      ),
      DbCbtSession,
      PrefetchHooks Function()
    >;
typedef $$GroundingSessionsTableCreateCompanionBuilder =
    GroundingSessionsCompanion Function({
      Value<int> id,
      required String userId,
      required String exercise,
      required DateTime startTime,
      Value<DateTime?> endTime,
      Value<String?> seeItems,
      Value<String?> touchItems,
      Value<String?> hearItems,
      Value<String?> smellItems,
      Value<String?> tasteItems,
      Value<String?> notes,
      Value<int?> cravingId,
      Value<int?> effectivenessRating,
      required DateTime createdAt,
    });
typedef $$GroundingSessionsTableUpdateCompanionBuilder =
    GroundingSessionsCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> exercise,
      Value<DateTime> startTime,
      Value<DateTime?> endTime,
      Value<String?> seeItems,
      Value<String?> touchItems,
      Value<String?> hearItems,
      Value<String?> smellItems,
      Value<String?> tasteItems,
      Value<String?> notes,
      Value<int?> cravingId,
      Value<int?> effectivenessRating,
      Value<DateTime> createdAt,
    });

class $$GroundingSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $GroundingSessionsTable> {
  $$GroundingSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exercise => $composableBuilder(
    column: $table.exercise,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get seeItems => $composableBuilder(
    column: $table.seeItems,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get touchItems => $composableBuilder(
    column: $table.touchItems,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hearItems => $composableBuilder(
    column: $table.hearItems,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get smellItems => $composableBuilder(
    column: $table.smellItems,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tasteItems => $composableBuilder(
    column: $table.tasteItems,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cravingId => $composableBuilder(
    column: $table.cravingId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get effectivenessRating => $composableBuilder(
    column: $table.effectivenessRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GroundingSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $GroundingSessionsTable> {
  $$GroundingSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exercise => $composableBuilder(
    column: $table.exercise,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seeItems => $composableBuilder(
    column: $table.seeItems,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get touchItems => $composableBuilder(
    column: $table.touchItems,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hearItems => $composableBuilder(
    column: $table.hearItems,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get smellItems => $composableBuilder(
    column: $table.smellItems,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tasteItems => $composableBuilder(
    column: $table.tasteItems,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cravingId => $composableBuilder(
    column: $table.cravingId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get effectivenessRating => $composableBuilder(
    column: $table.effectivenessRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GroundingSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroundingSessionsTable> {
  $$GroundingSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get exercise =>
      $composableBuilder(column: $table.exercise, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get seeItems =>
      $composableBuilder(column: $table.seeItems, builder: (column) => column);

  GeneratedColumn<String> get touchItems => $composableBuilder(
    column: $table.touchItems,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hearItems =>
      $composableBuilder(column: $table.hearItems, builder: (column) => column);

  GeneratedColumn<String> get smellItems => $composableBuilder(
    column: $table.smellItems,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tasteItems => $composableBuilder(
    column: $table.tasteItems,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get cravingId =>
      $composableBuilder(column: $table.cravingId, builder: (column) => column);

  GeneratedColumn<int> get effectivenessRating => $composableBuilder(
    column: $table.effectivenessRating,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$GroundingSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GroundingSessionsTable,
          DbGroundingSession,
          $$GroundingSessionsTableFilterComposer,
          $$GroundingSessionsTableOrderingComposer,
          $$GroundingSessionsTableAnnotationComposer,
          $$GroundingSessionsTableCreateCompanionBuilder,
          $$GroundingSessionsTableUpdateCompanionBuilder,
          (
            DbGroundingSession,
            BaseReferences<
              _$AppDatabase,
              $GroundingSessionsTable,
              DbGroundingSession
            >,
          ),
          DbGroundingSession,
          PrefetchHooks Function()
        > {
  $$GroundingSessionsTableTableManager(
    _$AppDatabase db,
    $GroundingSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroundingSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroundingSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroundingSessionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> exercise = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<String?> seeItems = const Value.absent(),
                Value<String?> touchItems = const Value.absent(),
                Value<String?> hearItems = const Value.absent(),
                Value<String?> smellItems = const Value.absent(),
                Value<String?> tasteItems = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> cravingId = const Value.absent(),
                Value<int?> effectivenessRating = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => GroundingSessionsCompanion(
                id: id,
                userId: userId,
                exercise: exercise,
                startTime: startTime,
                endTime: endTime,
                seeItems: seeItems,
                touchItems: touchItems,
                hearItems: hearItems,
                smellItems: smellItems,
                tasteItems: tasteItems,
                notes: notes,
                cravingId: cravingId,
                effectivenessRating: effectivenessRating,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String exercise,
                required DateTime startTime,
                Value<DateTime?> endTime = const Value.absent(),
                Value<String?> seeItems = const Value.absent(),
                Value<String?> touchItems = const Value.absent(),
                Value<String?> hearItems = const Value.absent(),
                Value<String?> smellItems = const Value.absent(),
                Value<String?> tasteItems = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> cravingId = const Value.absent(),
                Value<int?> effectivenessRating = const Value.absent(),
                required DateTime createdAt,
              }) => GroundingSessionsCompanion.insert(
                id: id,
                userId: userId,
                exercise: exercise,
                startTime: startTime,
                endTime: endTime,
                seeItems: seeItems,
                touchItems: touchItems,
                hearItems: hearItems,
                smellItems: smellItems,
                tasteItems: tasteItems,
                notes: notes,
                cravingId: cravingId,
                effectivenessRating: effectivenessRating,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GroundingSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GroundingSessionsTable,
      DbGroundingSession,
      $$GroundingSessionsTableFilterComposer,
      $$GroundingSessionsTableOrderingComposer,
      $$GroundingSessionsTableAnnotationComposer,
      $$GroundingSessionsTableCreateCompanionBuilder,
      $$GroundingSessionsTableUpdateCompanionBuilder,
      (
        DbGroundingSession,
        BaseReferences<
          _$AppDatabase,
          $GroundingSessionsTable,
          DbGroundingSession
        >,
      ),
      DbGroundingSession,
      PrefetchHooks Function()
    >;
typedef $$DistractionSessionsTableCreateCompanionBuilder =
    DistractionSessionsCompanion Function({
      Value<int> id,
      required String userId,
      required String activity,
      required DateTime startTime,
      Value<DateTime?> endTime,
      Value<bool?> wasEffective,
      Value<int?> effectivenessRating,
      Value<int?> cravingId,
      required DateTime createdAt,
    });
typedef $$DistractionSessionsTableUpdateCompanionBuilder =
    DistractionSessionsCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> activity,
      Value<DateTime> startTime,
      Value<DateTime?> endTime,
      Value<bool?> wasEffective,
      Value<int?> effectivenessRating,
      Value<int?> cravingId,
      Value<DateTime> createdAt,
    });

class $$DistractionSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $DistractionSessionsTable> {
  $$DistractionSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activity => $composableBuilder(
    column: $table.activity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get wasEffective => $composableBuilder(
    column: $table.wasEffective,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get effectivenessRating => $composableBuilder(
    column: $table.effectivenessRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cravingId => $composableBuilder(
    column: $table.cravingId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DistractionSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DistractionSessionsTable> {
  $$DistractionSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activity => $composableBuilder(
    column: $table.activity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get wasEffective => $composableBuilder(
    column: $table.wasEffective,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get effectivenessRating => $composableBuilder(
    column: $table.effectivenessRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cravingId => $composableBuilder(
    column: $table.cravingId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DistractionSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DistractionSessionsTable> {
  $$DistractionSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get activity =>
      $composableBuilder(column: $table.activity, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<bool> get wasEffective => $composableBuilder(
    column: $table.wasEffective,
    builder: (column) => column,
  );

  GeneratedColumn<int> get effectivenessRating => $composableBuilder(
    column: $table.effectivenessRating,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cravingId =>
      $composableBuilder(column: $table.cravingId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DistractionSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DistractionSessionsTable,
          DbDistractionSession,
          $$DistractionSessionsTableFilterComposer,
          $$DistractionSessionsTableOrderingComposer,
          $$DistractionSessionsTableAnnotationComposer,
          $$DistractionSessionsTableCreateCompanionBuilder,
          $$DistractionSessionsTableUpdateCompanionBuilder,
          (
            DbDistractionSession,
            BaseReferences<
              _$AppDatabase,
              $DistractionSessionsTable,
              DbDistractionSession
            >,
          ),
          DbDistractionSession,
          PrefetchHooks Function()
        > {
  $$DistractionSessionsTableTableManager(
    _$AppDatabase db,
    $DistractionSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DistractionSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DistractionSessionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DistractionSessionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> activity = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<bool?> wasEffective = const Value.absent(),
                Value<int?> effectivenessRating = const Value.absent(),
                Value<int?> cravingId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DistractionSessionsCompanion(
                id: id,
                userId: userId,
                activity: activity,
                startTime: startTime,
                endTime: endTime,
                wasEffective: wasEffective,
                effectivenessRating: effectivenessRating,
                cravingId: cravingId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String activity,
                required DateTime startTime,
                Value<DateTime?> endTime = const Value.absent(),
                Value<bool?> wasEffective = const Value.absent(),
                Value<int?> effectivenessRating = const Value.absent(),
                Value<int?> cravingId = const Value.absent(),
                required DateTime createdAt,
              }) => DistractionSessionsCompanion.insert(
                id: id,
                userId: userId,
                activity: activity,
                startTime: startTime,
                endTime: endTime,
                wasEffective: wasEffective,
                effectivenessRating: effectivenessRating,
                cravingId: cravingId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DistractionSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DistractionSessionsTable,
      DbDistractionSession,
      $$DistractionSessionsTableFilterComposer,
      $$DistractionSessionsTableOrderingComposer,
      $$DistractionSessionsTableAnnotationComposer,
      $$DistractionSessionsTableCreateCompanionBuilder,
      $$DistractionSessionsTableUpdateCompanionBuilder,
      (
        DbDistractionSession,
        BaseReferences<
          _$AppDatabase,
          $DistractionSessionsTable,
          DbDistractionSession
        >,
      ),
      DbDistractionSession,
      PrefetchHooks Function()
    >;
typedef $$ToolkitExercisesTableCreateCompanionBuilder =
    ToolkitExercisesCompanion Function({
      Value<int> id,
      required String exerciseId,
      required String name,
      required String category,
      Value<bool> isFavorite,
      Value<DateTime?> lastUsedAt,
      required int durationEstimateSeconds,
      required bool isSharedBothModes,
      Value<String?> modeFilter,
      required String shortDescription,
      required String fullInstructions,
      Value<String?> modeSpecificNote,
      required DateTime seededAt,
    });
typedef $$ToolkitExercisesTableUpdateCompanionBuilder =
    ToolkitExercisesCompanion Function({
      Value<int> id,
      Value<String> exerciseId,
      Value<String> name,
      Value<String> category,
      Value<bool> isFavorite,
      Value<DateTime?> lastUsedAt,
      Value<int> durationEstimateSeconds,
      Value<bool> isSharedBothModes,
      Value<String?> modeFilter,
      Value<String> shortDescription,
      Value<String> fullInstructions,
      Value<String?> modeSpecificNote,
      Value<DateTime> seededAt,
    });

class $$ToolkitExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ToolkitExercisesTable> {
  $$ToolkitExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUsedAt => $composableBuilder(
    column: $table.lastUsedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationEstimateSeconds => $composableBuilder(
    column: $table.durationEstimateSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSharedBothModes => $composableBuilder(
    column: $table.isSharedBothModes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modeFilter => $composableBuilder(
    column: $table.modeFilter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullInstructions => $composableBuilder(
    column: $table.fullInstructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modeSpecificNote => $composableBuilder(
    column: $table.modeSpecificNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get seededAt => $composableBuilder(
    column: $table.seededAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ToolkitExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ToolkitExercisesTable> {
  $$ToolkitExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUsedAt => $composableBuilder(
    column: $table.lastUsedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationEstimateSeconds => $composableBuilder(
    column: $table.durationEstimateSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSharedBothModes => $composableBuilder(
    column: $table.isSharedBothModes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modeFilter => $composableBuilder(
    column: $table.modeFilter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullInstructions => $composableBuilder(
    column: $table.fullInstructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modeSpecificNote => $composableBuilder(
    column: $table.modeSpecificNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get seededAt => $composableBuilder(
    column: $table.seededAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ToolkitExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ToolkitExercisesTable> {
  $$ToolkitExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastUsedAt => $composableBuilder(
    column: $table.lastUsedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationEstimateSeconds => $composableBuilder(
    column: $table.durationEstimateSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSharedBothModes => $composableBuilder(
    column: $table.isSharedBothModes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get modeFilter => $composableBuilder(
    column: $table.modeFilter,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fullInstructions => $composableBuilder(
    column: $table.fullInstructions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get modeSpecificNote => $composableBuilder(
    column: $table.modeSpecificNote,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get seededAt =>
      $composableBuilder(column: $table.seededAt, builder: (column) => column);
}

class $$ToolkitExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ToolkitExercisesTable,
          DbToolkitExercise,
          $$ToolkitExercisesTableFilterComposer,
          $$ToolkitExercisesTableOrderingComposer,
          $$ToolkitExercisesTableAnnotationComposer,
          $$ToolkitExercisesTableCreateCompanionBuilder,
          $$ToolkitExercisesTableUpdateCompanionBuilder,
          (
            DbToolkitExercise,
            BaseReferences<
              _$AppDatabase,
              $ToolkitExercisesTable,
              DbToolkitExercise
            >,
          ),
          DbToolkitExercise,
          PrefetchHooks Function()
        > {
  $$ToolkitExercisesTableTableManager(
    _$AppDatabase db,
    $ToolkitExercisesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ToolkitExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ToolkitExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ToolkitExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime?> lastUsedAt = const Value.absent(),
                Value<int> durationEstimateSeconds = const Value.absent(),
                Value<bool> isSharedBothModes = const Value.absent(),
                Value<String?> modeFilter = const Value.absent(),
                Value<String> shortDescription = const Value.absent(),
                Value<String> fullInstructions = const Value.absent(),
                Value<String?> modeSpecificNote = const Value.absent(),
                Value<DateTime> seededAt = const Value.absent(),
              }) => ToolkitExercisesCompanion(
                id: id,
                exerciseId: exerciseId,
                name: name,
                category: category,
                isFavorite: isFavorite,
                lastUsedAt: lastUsedAt,
                durationEstimateSeconds: durationEstimateSeconds,
                isSharedBothModes: isSharedBothModes,
                modeFilter: modeFilter,
                shortDescription: shortDescription,
                fullInstructions: fullInstructions,
                modeSpecificNote: modeSpecificNote,
                seededAt: seededAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String exerciseId,
                required String name,
                required String category,
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime?> lastUsedAt = const Value.absent(),
                required int durationEstimateSeconds,
                required bool isSharedBothModes,
                Value<String?> modeFilter = const Value.absent(),
                required String shortDescription,
                required String fullInstructions,
                Value<String?> modeSpecificNote = const Value.absent(),
                required DateTime seededAt,
              }) => ToolkitExercisesCompanion.insert(
                id: id,
                exerciseId: exerciseId,
                name: name,
                category: category,
                isFavorite: isFavorite,
                lastUsedAt: lastUsedAt,
                durationEstimateSeconds: durationEstimateSeconds,
                isSharedBothModes: isSharedBothModes,
                modeFilter: modeFilter,
                shortDescription: shortDescription,
                fullInstructions: fullInstructions,
                modeSpecificNote: modeSpecificNote,
                seededAt: seededAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ToolkitExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ToolkitExercisesTable,
      DbToolkitExercise,
      $$ToolkitExercisesTableFilterComposer,
      $$ToolkitExercisesTableOrderingComposer,
      $$ToolkitExercisesTableAnnotationComposer,
      $$ToolkitExercisesTableCreateCompanionBuilder,
      $$ToolkitExercisesTableUpdateCompanionBuilder,
      (
        DbToolkitExercise,
        BaseReferences<
          _$AppDatabase,
          $ToolkitExercisesTable,
          DbToolkitExercise
        >,
      ),
      DbToolkitExercise,
      PrefetchHooks Function()
    >;
typedef $$ToolkitSessionsTableCreateCompanionBuilder =
    ToolkitSessionsCompanion Function({
      Value<int> id,
      required String userId,
      required String exerciseId,
      required String exerciseName,
      required String exerciseCategory,
      required DateTime startedAt,
      Value<DateTime?> completedAt,
      Value<int?> feedbackRating,
      required String mode,
      Value<String?> linkedJournalEntryId,
    });
typedef $$ToolkitSessionsTableUpdateCompanionBuilder =
    ToolkitSessionsCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> exerciseId,
      Value<String> exerciseName,
      Value<String> exerciseCategory,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<int?> feedbackRating,
      Value<String> mode,
      Value<String?> linkedJournalEntryId,
    });

class $$ToolkitSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $ToolkitSessionsTable> {
  $$ToolkitSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseName => $composableBuilder(
    column: $table.exerciseName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseCategory => $composableBuilder(
    column: $table.exerciseCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get feedbackRating => $composableBuilder(
    column: $table.feedbackRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedJournalEntryId => $composableBuilder(
    column: $table.linkedJournalEntryId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ToolkitSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ToolkitSessionsTable> {
  $$ToolkitSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseName => $composableBuilder(
    column: $table.exerciseName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseCategory => $composableBuilder(
    column: $table.exerciseCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get feedbackRating => $composableBuilder(
    column: $table.feedbackRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedJournalEntryId => $composableBuilder(
    column: $table.linkedJournalEntryId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ToolkitSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ToolkitSessionsTable> {
  $$ToolkitSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exerciseName => $composableBuilder(
    column: $table.exerciseName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exerciseCategory => $composableBuilder(
    column: $table.exerciseCategory,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get feedbackRating => $composableBuilder(
    column: $table.feedbackRating,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<String> get linkedJournalEntryId => $composableBuilder(
    column: $table.linkedJournalEntryId,
    builder: (column) => column,
  );
}

class $$ToolkitSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ToolkitSessionsTable,
          DbToolkitSession,
          $$ToolkitSessionsTableFilterComposer,
          $$ToolkitSessionsTableOrderingComposer,
          $$ToolkitSessionsTableAnnotationComposer,
          $$ToolkitSessionsTableCreateCompanionBuilder,
          $$ToolkitSessionsTableUpdateCompanionBuilder,
          (
            DbToolkitSession,
            BaseReferences<
              _$AppDatabase,
              $ToolkitSessionsTable,
              DbToolkitSession
            >,
          ),
          DbToolkitSession,
          PrefetchHooks Function()
        > {
  $$ToolkitSessionsTableTableManager(
    _$AppDatabase db,
    $ToolkitSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ToolkitSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ToolkitSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ToolkitSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<String> exerciseName = const Value.absent(),
                Value<String> exerciseCategory = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int?> feedbackRating = const Value.absent(),
                Value<String> mode = const Value.absent(),
                Value<String?> linkedJournalEntryId = const Value.absent(),
              }) => ToolkitSessionsCompanion(
                id: id,
                userId: userId,
                exerciseId: exerciseId,
                exerciseName: exerciseName,
                exerciseCategory: exerciseCategory,
                startedAt: startedAt,
                completedAt: completedAt,
                feedbackRating: feedbackRating,
                mode: mode,
                linkedJournalEntryId: linkedJournalEntryId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String exerciseId,
                required String exerciseName,
                required String exerciseCategory,
                required DateTime startedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int?> feedbackRating = const Value.absent(),
                required String mode,
                Value<String?> linkedJournalEntryId = const Value.absent(),
              }) => ToolkitSessionsCompanion.insert(
                id: id,
                userId: userId,
                exerciseId: exerciseId,
                exerciseName: exerciseName,
                exerciseCategory: exerciseCategory,
                startedAt: startedAt,
                completedAt: completedAt,
                feedbackRating: feedbackRating,
                mode: mode,
                linkedJournalEntryId: linkedJournalEntryId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ToolkitSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ToolkitSessionsTable,
      DbToolkitSession,
      $$ToolkitSessionsTableFilterComposer,
      $$ToolkitSessionsTableOrderingComposer,
      $$ToolkitSessionsTableAnnotationComposer,
      $$ToolkitSessionsTableCreateCompanionBuilder,
      $$ToolkitSessionsTableUpdateCompanionBuilder,
      (
        DbToolkitSession,
        BaseReferences<_$AppDatabase, $ToolkitSessionsTable, DbToolkitSession>,
      ),
      DbToolkitSession,
      PrefetchHooks Function()
    >;
typedef $$JournalEntriesTableCreateCompanionBuilder =
    JournalEntriesCompanion Function({
      Value<int> id,
      required String entryId,
      required String userId,
      required DateTime createdAt,
      Value<DateTime?> updatedAt,
      required String content,
      Value<String?> moodTag,
      Value<String?> sourceExerciseId,
      Value<String?> sourceExerciseName,
    });
typedef $$JournalEntriesTableUpdateCompanionBuilder =
    JournalEntriesCompanion Function({
      Value<int> id,
      Value<String> entryId,
      Value<String> userId,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<String> content,
      Value<String?> moodTag,
      Value<String?> sourceExerciseId,
      Value<String?> sourceExerciseName,
    });

class $$JournalEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entryId => $composableBuilder(
    column: $table.entryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moodTag => $composableBuilder(
    column: $table.moodTag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceExerciseId => $composableBuilder(
    column: $table.sourceExerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceExerciseName => $composableBuilder(
    column: $table.sourceExerciseName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JournalEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entryId => $composableBuilder(
    column: $table.entryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moodTag => $composableBuilder(
    column: $table.moodTag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceExerciseId => $composableBuilder(
    column: $table.sourceExerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceExerciseName => $composableBuilder(
    column: $table.sourceExerciseName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JournalEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entryId =>
      $composableBuilder(column: $table.entryId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get moodTag =>
      $composableBuilder(column: $table.moodTag, builder: (column) => column);

  GeneratedColumn<String> get sourceExerciseId => $composableBuilder(
    column: $table.sourceExerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceExerciseName => $composableBuilder(
    column: $table.sourceExerciseName,
    builder: (column) => column,
  );
}

class $$JournalEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalEntriesTable,
          DbJournalEntry,
          $$JournalEntriesTableFilterComposer,
          $$JournalEntriesTableOrderingComposer,
          $$JournalEntriesTableAnnotationComposer,
          $$JournalEntriesTableCreateCompanionBuilder,
          $$JournalEntriesTableUpdateCompanionBuilder,
          (
            DbJournalEntry,
            BaseReferences<_$AppDatabase, $JournalEntriesTable, DbJournalEntry>,
          ),
          DbJournalEntry,
          PrefetchHooks Function()
        > {
  $$JournalEntriesTableTableManager(
    _$AppDatabase db,
    $JournalEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entryId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String?> moodTag = const Value.absent(),
                Value<String?> sourceExerciseId = const Value.absent(),
                Value<String?> sourceExerciseName = const Value.absent(),
              }) => JournalEntriesCompanion(
                id: id,
                entryId: entryId,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                content: content,
                moodTag: moodTag,
                sourceExerciseId: sourceExerciseId,
                sourceExerciseName: sourceExerciseName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entryId,
                required String userId,
                required DateTime createdAt,
                Value<DateTime?> updatedAt = const Value.absent(),
                required String content,
                Value<String?> moodTag = const Value.absent(),
                Value<String?> sourceExerciseId = const Value.absent(),
                Value<String?> sourceExerciseName = const Value.absent(),
              }) => JournalEntriesCompanion.insert(
                id: id,
                entryId: entryId,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                content: content,
                moodTag: moodTag,
                sourceExerciseId: sourceExerciseId,
                sourceExerciseName: sourceExerciseName,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JournalEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalEntriesTable,
      DbJournalEntry,
      $$JournalEntriesTableFilterComposer,
      $$JournalEntriesTableOrderingComposer,
      $$JournalEntriesTableAnnotationComposer,
      $$JournalEntriesTableCreateCompanionBuilder,
      $$JournalEntriesTableUpdateCompanionBuilder,
      (
        DbJournalEntry,
        BaseReferences<_$AppDatabase, $JournalEntriesTable, DbJournalEntry>,
      ),
      DbJournalEntry,
      PrefetchHooks Function()
    >;
typedef $$ScheduledNotificationsTableCreateCompanionBuilder =
    ScheduledNotificationsCompanion Function({
      Value<int> id,
      required String userId,
      required String type,
      required String title,
      required String body,
      required DateTime scheduledTime,
      Value<bool> isSent,
      Value<DateTime?> sentAt,
      Value<bool> wasOpened,
      Value<DateTime?> openedAt,
      Value<bool> wasDismissed,
      Value<String?> payload,
      Value<int?> relatedStreakDays,
      Value<int?> relatedMoneySaved,
      required DateTime createdAt,
    });
typedef $$ScheduledNotificationsTableUpdateCompanionBuilder =
    ScheduledNotificationsCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> type,
      Value<String> title,
      Value<String> body,
      Value<DateTime> scheduledTime,
      Value<bool> isSent,
      Value<DateTime?> sentAt,
      Value<bool> wasOpened,
      Value<DateTime?> openedAt,
      Value<bool> wasDismissed,
      Value<String?> payload,
      Value<int?> relatedStreakDays,
      Value<int?> relatedMoneySaved,
      Value<DateTime> createdAt,
    });

class $$ScheduledNotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduledNotificationsTable> {
  $$ScheduledNotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledTime => $composableBuilder(
    column: $table.scheduledTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSent => $composableBuilder(
    column: $table.isSent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sentAt => $composableBuilder(
    column: $table.sentAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get wasOpened => $composableBuilder(
    column: $table.wasOpened,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get openedAt => $composableBuilder(
    column: $table.openedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get wasDismissed => $composableBuilder(
    column: $table.wasDismissed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get relatedStreakDays => $composableBuilder(
    column: $table.relatedStreakDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get relatedMoneySaved => $composableBuilder(
    column: $table.relatedMoneySaved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ScheduledNotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduledNotificationsTable> {
  $$ScheduledNotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledTime => $composableBuilder(
    column: $table.scheduledTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSent => $composableBuilder(
    column: $table.isSent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sentAt => $composableBuilder(
    column: $table.sentAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get wasOpened => $composableBuilder(
    column: $table.wasOpened,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get openedAt => $composableBuilder(
    column: $table.openedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get wasDismissed => $composableBuilder(
    column: $table.wasDismissed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get relatedStreakDays => $composableBuilder(
    column: $table.relatedStreakDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get relatedMoneySaved => $composableBuilder(
    column: $table.relatedMoneySaved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScheduledNotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduledNotificationsTable> {
  $$ScheduledNotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledTime => $composableBuilder(
    column: $table.scheduledTime,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSent =>
      $composableBuilder(column: $table.isSent, builder: (column) => column);

  GeneratedColumn<DateTime> get sentAt =>
      $composableBuilder(column: $table.sentAt, builder: (column) => column);

  GeneratedColumn<bool> get wasOpened =>
      $composableBuilder(column: $table.wasOpened, builder: (column) => column);

  GeneratedColumn<DateTime> get openedAt =>
      $composableBuilder(column: $table.openedAt, builder: (column) => column);

  GeneratedColumn<bool> get wasDismissed => $composableBuilder(
    column: $table.wasDismissed,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get relatedStreakDays => $composableBuilder(
    column: $table.relatedStreakDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get relatedMoneySaved => $composableBuilder(
    column: $table.relatedMoneySaved,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ScheduledNotificationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduledNotificationsTable,
          DbScheduledNotification,
          $$ScheduledNotificationsTableFilterComposer,
          $$ScheduledNotificationsTableOrderingComposer,
          $$ScheduledNotificationsTableAnnotationComposer,
          $$ScheduledNotificationsTableCreateCompanionBuilder,
          $$ScheduledNotificationsTableUpdateCompanionBuilder,
          (
            DbScheduledNotification,
            BaseReferences<
              _$AppDatabase,
              $ScheduledNotificationsTable,
              DbScheduledNotification
            >,
          ),
          DbScheduledNotification,
          PrefetchHooks Function()
        > {
  $$ScheduledNotificationsTableTableManager(
    _$AppDatabase db,
    $ScheduledNotificationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduledNotificationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ScheduledNotificationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ScheduledNotificationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<DateTime> scheduledTime = const Value.absent(),
                Value<bool> isSent = const Value.absent(),
                Value<DateTime?> sentAt = const Value.absent(),
                Value<bool> wasOpened = const Value.absent(),
                Value<DateTime?> openedAt = const Value.absent(),
                Value<bool> wasDismissed = const Value.absent(),
                Value<String?> payload = const Value.absent(),
                Value<int?> relatedStreakDays = const Value.absent(),
                Value<int?> relatedMoneySaved = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ScheduledNotificationsCompanion(
                id: id,
                userId: userId,
                type: type,
                title: title,
                body: body,
                scheduledTime: scheduledTime,
                isSent: isSent,
                sentAt: sentAt,
                wasOpened: wasOpened,
                openedAt: openedAt,
                wasDismissed: wasDismissed,
                payload: payload,
                relatedStreakDays: relatedStreakDays,
                relatedMoneySaved: relatedMoneySaved,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String type,
                required String title,
                required String body,
                required DateTime scheduledTime,
                Value<bool> isSent = const Value.absent(),
                Value<DateTime?> sentAt = const Value.absent(),
                Value<bool> wasOpened = const Value.absent(),
                Value<DateTime?> openedAt = const Value.absent(),
                Value<bool> wasDismissed = const Value.absent(),
                Value<String?> payload = const Value.absent(),
                Value<int?> relatedStreakDays = const Value.absent(),
                Value<int?> relatedMoneySaved = const Value.absent(),
                required DateTime createdAt,
              }) => ScheduledNotificationsCompanion.insert(
                id: id,
                userId: userId,
                type: type,
                title: title,
                body: body,
                scheduledTime: scheduledTime,
                isSent: isSent,
                sentAt: sentAt,
                wasOpened: wasOpened,
                openedAt: openedAt,
                wasDismissed: wasDismissed,
                payload: payload,
                relatedStreakDays: relatedStreakDays,
                relatedMoneySaved: relatedMoneySaved,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ScheduledNotificationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduledNotificationsTable,
      DbScheduledNotification,
      $$ScheduledNotificationsTableFilterComposer,
      $$ScheduledNotificationsTableOrderingComposer,
      $$ScheduledNotificationsTableAnnotationComposer,
      $$ScheduledNotificationsTableCreateCompanionBuilder,
      $$ScheduledNotificationsTableUpdateCompanionBuilder,
      (
        DbScheduledNotification,
        BaseReferences<
          _$AppDatabase,
          $ScheduledNotificationsTable,
          DbScheduledNotification
        >,
      ),
      DbScheduledNotification,
      PrefetchHooks Function()
    >;
typedef $$NotificationPreferencesTableCreateCompanionBuilder =
    NotificationPreferencesCompanion Function({
      Value<int> id,
      required String userId,
      Value<bool> notificationsEnabled,
      required String frequency,
      Value<bool> quietHoursEnabled,
      Value<int> quietHoursStart,
      Value<int> quietHoursEnd,
      Value<bool> dailyCheckInEnabled,
      Value<bool> encouragementEnabled,
      Value<bool> milestoneEnabled,
      Value<bool> cravingTipsEnabled,
      Value<bool> microChallengesEnabled,
      Value<bool> progressUpdatesEnabled,
      Value<bool> streakRemindersEnabled,
      Value<bool> healthFactsEnabled,
      Value<bool> motivationalQuotesEnabled,
      Value<List<int>?> preferredHours,
      Value<DateTime?> permissionDeniedAt,
      Value<String?> userMode,
      Value<bool> quitDatePrepEnabled,
      required DateTime createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$NotificationPreferencesTableUpdateCompanionBuilder =
    NotificationPreferencesCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<bool> notificationsEnabled,
      Value<String> frequency,
      Value<bool> quietHoursEnabled,
      Value<int> quietHoursStart,
      Value<int> quietHoursEnd,
      Value<bool> dailyCheckInEnabled,
      Value<bool> encouragementEnabled,
      Value<bool> milestoneEnabled,
      Value<bool> cravingTipsEnabled,
      Value<bool> microChallengesEnabled,
      Value<bool> progressUpdatesEnabled,
      Value<bool> streakRemindersEnabled,
      Value<bool> healthFactsEnabled,
      Value<bool> motivationalQuotesEnabled,
      Value<List<int>?> preferredHours,
      Value<DateTime?> permissionDeniedAt,
      Value<String?> userMode,
      Value<bool> quitDatePrepEnabled,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

class $$NotificationPreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationPreferencesTable> {
  $$NotificationPreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get quietHoursEnabled => $composableBuilder(
    column: $table.quietHoursEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quietHoursStart => $composableBuilder(
    column: $table.quietHoursStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quietHoursEnd => $composableBuilder(
    column: $table.quietHoursEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get dailyCheckInEnabled => $composableBuilder(
    column: $table.dailyCheckInEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get encouragementEnabled => $composableBuilder(
    column: $table.encouragementEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get milestoneEnabled => $composableBuilder(
    column: $table.milestoneEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get cravingTipsEnabled => $composableBuilder(
    column: $table.cravingTipsEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get microChallengesEnabled => $composableBuilder(
    column: $table.microChallengesEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get progressUpdatesEnabled => $composableBuilder(
    column: $table.progressUpdatesEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get streakRemindersEnabled => $composableBuilder(
    column: $table.streakRemindersEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get healthFactsEnabled => $composableBuilder(
    column: $table.healthFactsEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get motivationalQuotesEnabled => $composableBuilder(
    column: $table.motivationalQuotesEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<int>?, List<int>, String>
  get preferredHours => $composableBuilder(
    column: $table.preferredHours,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get permissionDeniedAt => $composableBuilder(
    column: $table.permissionDeniedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userMode => $composableBuilder(
    column: $table.userMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get quitDatePrepEnabled => $composableBuilder(
    column: $table.quitDatePrepEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotificationPreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationPreferencesTable> {
  $$NotificationPreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get quietHoursEnabled => $composableBuilder(
    column: $table.quietHoursEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quietHoursStart => $composableBuilder(
    column: $table.quietHoursStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quietHoursEnd => $composableBuilder(
    column: $table.quietHoursEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get dailyCheckInEnabled => $composableBuilder(
    column: $table.dailyCheckInEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get encouragementEnabled => $composableBuilder(
    column: $table.encouragementEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get milestoneEnabled => $composableBuilder(
    column: $table.milestoneEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get cravingTipsEnabled => $composableBuilder(
    column: $table.cravingTipsEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get microChallengesEnabled => $composableBuilder(
    column: $table.microChallengesEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get progressUpdatesEnabled => $composableBuilder(
    column: $table.progressUpdatesEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get streakRemindersEnabled => $composableBuilder(
    column: $table.streakRemindersEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get healthFactsEnabled => $composableBuilder(
    column: $table.healthFactsEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get motivationalQuotesEnabled => $composableBuilder(
    column: $table.motivationalQuotesEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get preferredHours => $composableBuilder(
    column: $table.preferredHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get permissionDeniedAt => $composableBuilder(
    column: $table.permissionDeniedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userMode => $composableBuilder(
    column: $table.userMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get quitDatePrepEnabled => $composableBuilder(
    column: $table.quitDatePrepEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotificationPreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationPreferencesTable> {
  $$NotificationPreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<bool> get quietHoursEnabled => $composableBuilder(
    column: $table.quietHoursEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quietHoursStart => $composableBuilder(
    column: $table.quietHoursStart,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quietHoursEnd => $composableBuilder(
    column: $table.quietHoursEnd,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get dailyCheckInEnabled => $composableBuilder(
    column: $table.dailyCheckInEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get encouragementEnabled => $composableBuilder(
    column: $table.encouragementEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get milestoneEnabled => $composableBuilder(
    column: $table.milestoneEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get cravingTipsEnabled => $composableBuilder(
    column: $table.cravingTipsEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get microChallengesEnabled => $composableBuilder(
    column: $table.microChallengesEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get progressUpdatesEnabled => $composableBuilder(
    column: $table.progressUpdatesEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get streakRemindersEnabled => $composableBuilder(
    column: $table.streakRemindersEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get healthFactsEnabled => $composableBuilder(
    column: $table.healthFactsEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get motivationalQuotesEnabled => $composableBuilder(
    column: $table.motivationalQuotesEnabled,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<int>?, String> get preferredHours =>
      $composableBuilder(
        column: $table.preferredHours,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get permissionDeniedAt => $composableBuilder(
    column: $table.permissionDeniedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userMode =>
      $composableBuilder(column: $table.userMode, builder: (column) => column);

  GeneratedColumn<bool> get quitDatePrepEnabled => $composableBuilder(
    column: $table.quitDatePrepEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$NotificationPreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationPreferencesTable,
          DbNotificationPreference,
          $$NotificationPreferencesTableFilterComposer,
          $$NotificationPreferencesTableOrderingComposer,
          $$NotificationPreferencesTableAnnotationComposer,
          $$NotificationPreferencesTableCreateCompanionBuilder,
          $$NotificationPreferencesTableUpdateCompanionBuilder,
          (
            DbNotificationPreference,
            BaseReferences<
              _$AppDatabase,
              $NotificationPreferencesTable,
              DbNotificationPreference
            >,
          ),
          DbNotificationPreference,
          PrefetchHooks Function()
        > {
  $$NotificationPreferencesTableTableManager(
    _$AppDatabase db,
    $NotificationPreferencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationPreferencesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$NotificationPreferencesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$NotificationPreferencesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<String> frequency = const Value.absent(),
                Value<bool> quietHoursEnabled = const Value.absent(),
                Value<int> quietHoursStart = const Value.absent(),
                Value<int> quietHoursEnd = const Value.absent(),
                Value<bool> dailyCheckInEnabled = const Value.absent(),
                Value<bool> encouragementEnabled = const Value.absent(),
                Value<bool> milestoneEnabled = const Value.absent(),
                Value<bool> cravingTipsEnabled = const Value.absent(),
                Value<bool> microChallengesEnabled = const Value.absent(),
                Value<bool> progressUpdatesEnabled = const Value.absent(),
                Value<bool> streakRemindersEnabled = const Value.absent(),
                Value<bool> healthFactsEnabled = const Value.absent(),
                Value<bool> motivationalQuotesEnabled = const Value.absent(),
                Value<List<int>?> preferredHours = const Value.absent(),
                Value<DateTime?> permissionDeniedAt = const Value.absent(),
                Value<String?> userMode = const Value.absent(),
                Value<bool> quitDatePrepEnabled = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => NotificationPreferencesCompanion(
                id: id,
                userId: userId,
                notificationsEnabled: notificationsEnabled,
                frequency: frequency,
                quietHoursEnabled: quietHoursEnabled,
                quietHoursStart: quietHoursStart,
                quietHoursEnd: quietHoursEnd,
                dailyCheckInEnabled: dailyCheckInEnabled,
                encouragementEnabled: encouragementEnabled,
                milestoneEnabled: milestoneEnabled,
                cravingTipsEnabled: cravingTipsEnabled,
                microChallengesEnabled: microChallengesEnabled,
                progressUpdatesEnabled: progressUpdatesEnabled,
                streakRemindersEnabled: streakRemindersEnabled,
                healthFactsEnabled: healthFactsEnabled,
                motivationalQuotesEnabled: motivationalQuotesEnabled,
                preferredHours: preferredHours,
                permissionDeniedAt: permissionDeniedAt,
                userMode: userMode,
                quitDatePrepEnabled: quitDatePrepEnabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                Value<bool> notificationsEnabled = const Value.absent(),
                required String frequency,
                Value<bool> quietHoursEnabled = const Value.absent(),
                Value<int> quietHoursStart = const Value.absent(),
                Value<int> quietHoursEnd = const Value.absent(),
                Value<bool> dailyCheckInEnabled = const Value.absent(),
                Value<bool> encouragementEnabled = const Value.absent(),
                Value<bool> milestoneEnabled = const Value.absent(),
                Value<bool> cravingTipsEnabled = const Value.absent(),
                Value<bool> microChallengesEnabled = const Value.absent(),
                Value<bool> progressUpdatesEnabled = const Value.absent(),
                Value<bool> streakRemindersEnabled = const Value.absent(),
                Value<bool> healthFactsEnabled = const Value.absent(),
                Value<bool> motivationalQuotesEnabled = const Value.absent(),
                Value<List<int>?> preferredHours = const Value.absent(),
                Value<DateTime?> permissionDeniedAt = const Value.absent(),
                Value<String?> userMode = const Value.absent(),
                Value<bool> quitDatePrepEnabled = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => NotificationPreferencesCompanion.insert(
                id: id,
                userId: userId,
                notificationsEnabled: notificationsEnabled,
                frequency: frequency,
                quietHoursEnabled: quietHoursEnabled,
                quietHoursStart: quietHoursStart,
                quietHoursEnd: quietHoursEnd,
                dailyCheckInEnabled: dailyCheckInEnabled,
                encouragementEnabled: encouragementEnabled,
                milestoneEnabled: milestoneEnabled,
                cravingTipsEnabled: cravingTipsEnabled,
                microChallengesEnabled: microChallengesEnabled,
                progressUpdatesEnabled: progressUpdatesEnabled,
                streakRemindersEnabled: streakRemindersEnabled,
                healthFactsEnabled: healthFactsEnabled,
                motivationalQuotesEnabled: motivationalQuotesEnabled,
                preferredHours: preferredHours,
                permissionDeniedAt: permissionDeniedAt,
                userMode: userMode,
                quitDatePrepEnabled: quitDatePrepEnabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationPreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationPreferencesTable,
      DbNotificationPreference,
      $$NotificationPreferencesTableFilterComposer,
      $$NotificationPreferencesTableOrderingComposer,
      $$NotificationPreferencesTableAnnotationComposer,
      $$NotificationPreferencesTableCreateCompanionBuilder,
      $$NotificationPreferencesTableUpdateCompanionBuilder,
      (
        DbNotificationPreference,
        BaseReferences<
          _$AppDatabase,
          $NotificationPreferencesTable,
          DbNotificationPreference
        >,
      ),
      DbNotificationPreference,
      PrefetchHooks Function()
    >;
typedef $$NotificationHistoryTableCreateCompanionBuilder =
    NotificationHistoryCompanion Function({
      Value<int> id,
      required String userId,
      required String type,
      required String title,
      required String body,
      required DateTime sentAt,
      Value<bool> wasOpened,
      Value<DateTime?> openedAt,
    });
typedef $$NotificationHistoryTableUpdateCompanionBuilder =
    NotificationHistoryCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> type,
      Value<String> title,
      Value<String> body,
      Value<DateTime> sentAt,
      Value<bool> wasOpened,
      Value<DateTime?> openedAt,
    });

class $$NotificationHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationHistoryTable> {
  $$NotificationHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sentAt => $composableBuilder(
    column: $table.sentAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get wasOpened => $composableBuilder(
    column: $table.wasOpened,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get openedAt => $composableBuilder(
    column: $table.openedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotificationHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationHistoryTable> {
  $$NotificationHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sentAt => $composableBuilder(
    column: $table.sentAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get wasOpened => $composableBuilder(
    column: $table.wasOpened,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get openedAt => $composableBuilder(
    column: $table.openedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotificationHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationHistoryTable> {
  $$NotificationHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get sentAt =>
      $composableBuilder(column: $table.sentAt, builder: (column) => column);

  GeneratedColumn<bool> get wasOpened =>
      $composableBuilder(column: $table.wasOpened, builder: (column) => column);

  GeneratedColumn<DateTime> get openedAt =>
      $composableBuilder(column: $table.openedAt, builder: (column) => column);
}

class $$NotificationHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationHistoryTable,
          DbNotificationHistory,
          $$NotificationHistoryTableFilterComposer,
          $$NotificationHistoryTableOrderingComposer,
          $$NotificationHistoryTableAnnotationComposer,
          $$NotificationHistoryTableCreateCompanionBuilder,
          $$NotificationHistoryTableUpdateCompanionBuilder,
          (
            DbNotificationHistory,
            BaseReferences<
              _$AppDatabase,
              $NotificationHistoryTable,
              DbNotificationHistory
            >,
          ),
          DbNotificationHistory,
          PrefetchHooks Function()
        > {
  $$NotificationHistoryTableTableManager(
    _$AppDatabase db,
    $NotificationHistoryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationHistoryTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$NotificationHistoryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<DateTime> sentAt = const Value.absent(),
                Value<bool> wasOpened = const Value.absent(),
                Value<DateTime?> openedAt = const Value.absent(),
              }) => NotificationHistoryCompanion(
                id: id,
                userId: userId,
                type: type,
                title: title,
                body: body,
                sentAt: sentAt,
                wasOpened: wasOpened,
                openedAt: openedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String type,
                required String title,
                required String body,
                required DateTime sentAt,
                Value<bool> wasOpened = const Value.absent(),
                Value<DateTime?> openedAt = const Value.absent(),
              }) => NotificationHistoryCompanion.insert(
                id: id,
                userId: userId,
                type: type,
                title: title,
                body: body,
                sentAt: sentAt,
                wasOpened: wasOpened,
                openedAt: openedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationHistoryTable,
      DbNotificationHistory,
      $$NotificationHistoryTableFilterComposer,
      $$NotificationHistoryTableOrderingComposer,
      $$NotificationHistoryTableAnnotationComposer,
      $$NotificationHistoryTableCreateCompanionBuilder,
      $$NotificationHistoryTableUpdateCompanionBuilder,
      (
        DbNotificationHistory,
        BaseReferences<
          _$AppDatabase,
          $NotificationHistoryTable,
          DbNotificationHistory
        >,
      ),
      DbNotificationHistory,
      PrefetchHooks Function()
    >;
typedef $$RelapsePlansTableCreateCompanionBuilder =
    RelapsePlansCompanion Function({
      Value<int> id,
      required String userId,
      Value<List<String>?> customSteps,
      Value<List<Map<String, dynamic>>?> panicSteps,
      Value<String?> notes,
      Value<DateTime?> nextReviewDate,
      Value<String?> personalRecoveryNote,
      Value<DateTime?> lastReviewedAt,
      required DateTime createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$RelapsePlansTableUpdateCompanionBuilder =
    RelapsePlansCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<List<String>?> customSteps,
      Value<List<Map<String, dynamic>>?> panicSteps,
      Value<String?> notes,
      Value<DateTime?> nextReviewDate,
      Value<String?> personalRecoveryNote,
      Value<DateTime?> lastReviewedAt,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

class $$RelapsePlansTableFilterComposer
    extends Composer<_$AppDatabase, $RelapsePlansTable> {
  $$RelapsePlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get customSteps => $composableBuilder(
    column: $table.customSteps,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    List<Map<String, dynamic>>?,
    List<Map<String, dynamic>>,
    String
  >
  get panicSteps => $composableBuilder(
    column: $table.panicSteps,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextReviewDate => $composableBuilder(
    column: $table.nextReviewDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personalRecoveryNote => $composableBuilder(
    column: $table.personalRecoveryNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RelapsePlansTableOrderingComposer
    extends Composer<_$AppDatabase, $RelapsePlansTable> {
  $$RelapsePlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customSteps => $composableBuilder(
    column: $table.customSteps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get panicSteps => $composableBuilder(
    column: $table.panicSteps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextReviewDate => $composableBuilder(
    column: $table.nextReviewDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personalRecoveryNote => $composableBuilder(
    column: $table.personalRecoveryNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RelapsePlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelapsePlansTable> {
  $$RelapsePlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get customSteps =>
      $composableBuilder(
        column: $table.customSteps,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<Map<String, dynamic>>?, String>
  get panicSteps => $composableBuilder(
    column: $table.panicSteps,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get nextReviewDate => $composableBuilder(
    column: $table.nextReviewDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get personalRecoveryNote => $composableBuilder(
    column: $table.personalRecoveryNote,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$RelapsePlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelapsePlansTable,
          DbRelapsePlan,
          $$RelapsePlansTableFilterComposer,
          $$RelapsePlansTableOrderingComposer,
          $$RelapsePlansTableAnnotationComposer,
          $$RelapsePlansTableCreateCompanionBuilder,
          $$RelapsePlansTableUpdateCompanionBuilder,
          (
            DbRelapsePlan,
            BaseReferences<_$AppDatabase, $RelapsePlansTable, DbRelapsePlan>,
          ),
          DbRelapsePlan,
          PrefetchHooks Function()
        > {
  $$RelapsePlansTableTableManager(_$AppDatabase db, $RelapsePlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelapsePlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelapsePlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RelapsePlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<List<String>?> customSteps = const Value.absent(),
                Value<List<Map<String, dynamic>>?> panicSteps =
                    const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime?> nextReviewDate = const Value.absent(),
                Value<String?> personalRecoveryNote = const Value.absent(),
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => RelapsePlansCompanion(
                id: id,
                userId: userId,
                customSteps: customSteps,
                panicSteps: panicSteps,
                notes: notes,
                nextReviewDate: nextReviewDate,
                personalRecoveryNote: personalRecoveryNote,
                lastReviewedAt: lastReviewedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                Value<List<String>?> customSteps = const Value.absent(),
                Value<List<Map<String, dynamic>>?> panicSteps =
                    const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime?> nextReviewDate = const Value.absent(),
                Value<String?> personalRecoveryNote = const Value.absent(),
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => RelapsePlansCompanion.insert(
                id: id,
                userId: userId,
                customSteps: customSteps,
                panicSteps: panicSteps,
                notes: notes,
                nextReviewDate: nextReviewDate,
                personalRecoveryNote: personalRecoveryNote,
                lastReviewedAt: lastReviewedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RelapsePlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelapsePlansTable,
      DbRelapsePlan,
      $$RelapsePlansTableFilterComposer,
      $$RelapsePlansTableOrderingComposer,
      $$RelapsePlansTableAnnotationComposer,
      $$RelapsePlansTableCreateCompanionBuilder,
      $$RelapsePlansTableUpdateCompanionBuilder,
      (
        DbRelapsePlan,
        BaseReferences<_$AppDatabase, $RelapsePlansTable, DbRelapsePlan>,
      ),
      DbRelapsePlan,
      PrefetchHooks Function()
    >;
typedef $$RelapseContactsTableCreateCompanionBuilder =
    RelapseContactsCompanion Function({
      Value<int> id,
      required String userId,
      required String name,
      Value<String?> phoneNumber,
      Value<String?> relationship,
      Value<String?> notes,
      required int displayOrder,
      required DateTime createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$RelapseContactsTableUpdateCompanionBuilder =
    RelapseContactsCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> name,
      Value<String?> phoneNumber,
      Value<String?> relationship,
      Value<String?> notes,
      Value<int> displayOrder,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

class $$RelapseContactsTableFilterComposer
    extends Composer<_$AppDatabase, $RelapseContactsTable> {
  $$RelapseContactsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RelapseContactsTableOrderingComposer
    extends Composer<_$AppDatabase, $RelapseContactsTable> {
  $$RelapseContactsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RelapseContactsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelapseContactsTable> {
  $$RelapseContactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$RelapseContactsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelapseContactsTable,
          DbRelapseContact,
          $$RelapseContactsTableFilterComposer,
          $$RelapseContactsTableOrderingComposer,
          $$RelapseContactsTableAnnotationComposer,
          $$RelapseContactsTableCreateCompanionBuilder,
          $$RelapseContactsTableUpdateCompanionBuilder,
          (
            DbRelapseContact,
            BaseReferences<
              _$AppDatabase,
              $RelapseContactsTable,
              DbRelapseContact
            >,
          ),
          DbRelapseContact,
          PrefetchHooks Function()
        > {
  $$RelapseContactsTableTableManager(
    _$AppDatabase db,
    $RelapseContactsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelapseContactsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelapseContactsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RelapseContactsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<String?> relationship = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> displayOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => RelapseContactsCompanion(
                id: id,
                userId: userId,
                name: name,
                phoneNumber: phoneNumber,
                relationship: relationship,
                notes: notes,
                displayOrder: displayOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String name,
                Value<String?> phoneNumber = const Value.absent(),
                Value<String?> relationship = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required int displayOrder,
                required DateTime createdAt,
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => RelapseContactsCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                phoneNumber: phoneNumber,
                relationship: relationship,
                notes: notes,
                displayOrder: displayOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RelapseContactsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelapseContactsTable,
      DbRelapseContact,
      $$RelapseContactsTableFilterComposer,
      $$RelapseContactsTableOrderingComposer,
      $$RelapseContactsTableAnnotationComposer,
      $$RelapseContactsTableCreateCompanionBuilder,
      $$RelapseContactsTableUpdateCompanionBuilder,
      (
        DbRelapseContact,
        BaseReferences<_$AppDatabase, $RelapseContactsTable, DbRelapseContact>,
      ),
      DbRelapseContact,
      PrefetchHooks Function()
    >;
typedef $$LapseRecoverySessionsTableCreateCompanionBuilder =
    LapseRecoverySessionsCompanion Function({
      Value<int> id,
      required String sessionId,
      required String userId,
      required DateTime startedAt,
      Value<DateTime?> completedAt,
      Value<String?> chosenAction,
      Value<List<String>?> selectedTriggers,
      Value<bool> openedToolkit,
      Value<bool> readRecoveryGuide,
      Value<String?> recoveryNote,
      required String mode,
    });
typedef $$LapseRecoverySessionsTableUpdateCompanionBuilder =
    LapseRecoverySessionsCompanion Function({
      Value<int> id,
      Value<String> sessionId,
      Value<String> userId,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<String?> chosenAction,
      Value<List<String>?> selectedTriggers,
      Value<bool> openedToolkit,
      Value<bool> readRecoveryGuide,
      Value<String?> recoveryNote,
      Value<String> mode,
    });

class $$LapseRecoverySessionsTableFilterComposer
    extends Composer<_$AppDatabase, $LapseRecoverySessionsTable> {
  $$LapseRecoverySessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chosenAction => $composableBuilder(
    column: $table.chosenAction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get selectedTriggers => $composableBuilder(
    column: $table.selectedTriggers,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get openedToolkit => $composableBuilder(
    column: $table.openedToolkit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get readRecoveryGuide => $composableBuilder(
    column: $table.readRecoveryGuide,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recoveryNote => $composableBuilder(
    column: $table.recoveryNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LapseRecoverySessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $LapseRecoverySessionsTable> {
  $$LapseRecoverySessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chosenAction => $composableBuilder(
    column: $table.chosenAction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedTriggers => $composableBuilder(
    column: $table.selectedTriggers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get openedToolkit => $composableBuilder(
    column: $table.openedToolkit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get readRecoveryGuide => $composableBuilder(
    column: $table.readRecoveryGuide,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recoveryNote => $composableBuilder(
    column: $table.recoveryNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LapseRecoverySessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LapseRecoverySessionsTable> {
  $$LapseRecoverySessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get chosenAction => $composableBuilder(
    column: $table.chosenAction,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<String>?, String>
  get selectedTriggers => $composableBuilder(
    column: $table.selectedTriggers,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get openedToolkit => $composableBuilder(
    column: $table.openedToolkit,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get readRecoveryGuide => $composableBuilder(
    column: $table.readRecoveryGuide,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recoveryNote => $composableBuilder(
    column: $table.recoveryNote,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);
}

class $$LapseRecoverySessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LapseRecoverySessionsTable,
          DbLapseRecoverySession,
          $$LapseRecoverySessionsTableFilterComposer,
          $$LapseRecoverySessionsTableOrderingComposer,
          $$LapseRecoverySessionsTableAnnotationComposer,
          $$LapseRecoverySessionsTableCreateCompanionBuilder,
          $$LapseRecoverySessionsTableUpdateCompanionBuilder,
          (
            DbLapseRecoverySession,
            BaseReferences<
              _$AppDatabase,
              $LapseRecoverySessionsTable,
              DbLapseRecoverySession
            >,
          ),
          DbLapseRecoverySession,
          PrefetchHooks Function()
        > {
  $$LapseRecoverySessionsTableTableManager(
    _$AppDatabase db,
    $LapseRecoverySessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LapseRecoverySessionsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$LapseRecoverySessionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LapseRecoverySessionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String?> chosenAction = const Value.absent(),
                Value<List<String>?> selectedTriggers = const Value.absent(),
                Value<bool> openedToolkit = const Value.absent(),
                Value<bool> readRecoveryGuide = const Value.absent(),
                Value<String?> recoveryNote = const Value.absent(),
                Value<String> mode = const Value.absent(),
              }) => LapseRecoverySessionsCompanion(
                id: id,
                sessionId: sessionId,
                userId: userId,
                startedAt: startedAt,
                completedAt: completedAt,
                chosenAction: chosenAction,
                selectedTriggers: selectedTriggers,
                openedToolkit: openedToolkit,
                readRecoveryGuide: readRecoveryGuide,
                recoveryNote: recoveryNote,
                mode: mode,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String sessionId,
                required String userId,
                required DateTime startedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String?> chosenAction = const Value.absent(),
                Value<List<String>?> selectedTriggers = const Value.absent(),
                Value<bool> openedToolkit = const Value.absent(),
                Value<bool> readRecoveryGuide = const Value.absent(),
                Value<String?> recoveryNote = const Value.absent(),
                required String mode,
              }) => LapseRecoverySessionsCompanion.insert(
                id: id,
                sessionId: sessionId,
                userId: userId,
                startedAt: startedAt,
                completedAt: completedAt,
                chosenAction: chosenAction,
                selectedTriggers: selectedTriggers,
                openedToolkit: openedToolkit,
                readRecoveryGuide: readRecoveryGuide,
                recoveryNote: recoveryNote,
                mode: mode,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LapseRecoverySessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LapseRecoverySessionsTable,
      DbLapseRecoverySession,
      $$LapseRecoverySessionsTableFilterComposer,
      $$LapseRecoverySessionsTableOrderingComposer,
      $$LapseRecoverySessionsTableAnnotationComposer,
      $$LapseRecoverySessionsTableCreateCompanionBuilder,
      $$LapseRecoverySessionsTableUpdateCompanionBuilder,
      (
        DbLapseRecoverySession,
        BaseReferences<
          _$AppDatabase,
          $LapseRecoverySessionsTable,
          DbLapseRecoverySession
        >,
      ),
      DbLapseRecoverySession,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$LogEntriesTableTableManager get logEntries =>
      $$LogEntriesTableTableManager(_db, _db.logEntries);
  $$CravingEntriesTableTableManager get cravingEntries =>
      $$CravingEntriesTableTableManager(_db, _db.cravingEntries);
  $$WeeklyReviewsTableTableManager get weeklyReviews =>
      $$WeeklyReviewsTableTableManager(_db, _db.weeklyReviews);
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db, _db.achievements);
  $$BreathingSessionsTableTableManager get breathingSessions =>
      $$BreathingSessionsTableTableManager(_db, _db.breathingSessions);
  $$CbtSessionsTableTableManager get cbtSessions =>
      $$CbtSessionsTableTableManager(_db, _db.cbtSessions);
  $$GroundingSessionsTableTableManager get groundingSessions =>
      $$GroundingSessionsTableTableManager(_db, _db.groundingSessions);
  $$DistractionSessionsTableTableManager get distractionSessions =>
      $$DistractionSessionsTableTableManager(_db, _db.distractionSessions);
  $$ToolkitExercisesTableTableManager get toolkitExercises =>
      $$ToolkitExercisesTableTableManager(_db, _db.toolkitExercises);
  $$ToolkitSessionsTableTableManager get toolkitSessions =>
      $$ToolkitSessionsTableTableManager(_db, _db.toolkitSessions);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
  $$ScheduledNotificationsTableTableManager get scheduledNotifications =>
      $$ScheduledNotificationsTableTableManager(
        _db,
        _db.scheduledNotifications,
      );
  $$NotificationPreferencesTableTableManager get notificationPreferences =>
      $$NotificationPreferencesTableTableManager(
        _db,
        _db.notificationPreferences,
      );
  $$NotificationHistoryTableTableManager get notificationHistory =>
      $$NotificationHistoryTableTableManager(_db, _db.notificationHistory);
  $$RelapsePlansTableTableManager get relapsePlans =>
      $$RelapsePlansTableTableManager(_db, _db.relapsePlans);
  $$RelapseContactsTableTableManager get relapseContacts =>
      $$RelapseContactsTableTableManager(_db, _db.relapseContacts);
  $$LapseRecoverySessionsTableTableManager get lapseRecoverySessions =>
      $$LapseRecoverySessionsTableTableManager(_db, _db.lapseRecoverySessions);
}
