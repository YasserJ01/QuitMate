import 'package:isar/isar.dart';
import '../../../../core/services/database/isar_service.dart';
import '../models/user_profile.dart';

class ProfileRepository {
  Future<UserProfile?> getProfile(String userId) async {
    final isar = await IsarService.instance;
    return await isar.userProfiles
        .filter()
        .userIdEqualTo(userId)
        .findFirst();
  }

  Future<void> saveProfile(UserProfile profile) async {
    final isar = await IsarService.instance;
    await isar.writeTxn(() async {
      await isar.userProfiles.put(profile);
    });
  }

  Future<void> updateProfile(String userId, UserProfile updatedProfile) async {
    final isar = await IsarService.instance;
    final existing = await getProfile(userId);

    if (existing != null) {
      updatedProfile.id = existing.id;
      updatedProfile.createdAt = existing.createdAt;
      updatedProfile.updatedAt = DateTime.now();

      await isar.writeTxn(() async {
        await isar.userProfiles.put(updatedProfile);
      });
    }
  }

  Future<void> deleteProfile(String userId) async {
    final isar = await IsarService.instance;
    final profile = await getProfile(userId);

    if (profile != null) {
      await isar.writeTxn(() async {
        await isar.userProfiles.delete(profile.id);
      });
    }
  }
}