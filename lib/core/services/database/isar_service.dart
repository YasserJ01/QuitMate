import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../features/craving_toolkit/data/models/toolkit_models.dart';
import '../../../features/interventions/data/models/notification_models.dart';
import '../../../features/onboarding/data/models/user_profile.dart';
import '../../../features/tracking/data/models/craving_entry.dart';
import '../../../features/tracking/data/models/log_entry.dart';
import '../../../features/relapse_prevention/data/models/relapse_models.dart';


class IsarService {
  static Isar? _isar;
  static const _secureStorage = FlutterSecureStorage();
  static const _encryptionKeyKey = 'isar_encryption_key';

  static Future<Isar> get instance async {
    if (_isar != null && _isar!.isOpen) return _isar!;

    final dir = await getApplicationDocumentsDirectory();

    // Get or create encryption key
    String? encryptionKeyString = await _secureStorage.read(key: _encryptionKeyKey);
    List<int> encryptionKey;

    if (encryptionKeyString == null) {
      // Generate new encryption key
      encryptionKey = List<int>.generate(32, (i) => DateTime.now().millisecondsSinceEpoch % 256);
      await _secureStorage.write(
        key: _encryptionKeyKey,
        value: encryptionKey.join(','),
      );
    } else {
      encryptionKey = encryptionKeyString.split(',').map(int.parse).toList();
    }

    _isar = await Isar.open(
      [
        UserProfileSchema,
        LogEntrySchema,
        CravingEntrySchema,
        BreathingSessionSchema,
        CbtSessionSchema,
        GroundingSessionSchema,
        DistractionSessionSchema,
        ScheduledNotificationSchema,
        NotificationPreferencesSchema,
        NotificationHistorySchema,
        RelapseContactSchema,
        RelapsePlanSchema,
      ],
      directory: dir.path,
      // encryptionKey: encryptionKey,
    );

    return _isar!;
  }

  static Future<void> close() async {
    await _isar?.close();
    _isar = null;
  }
}