import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:quitmate/features/onboarding/data/repositories/profile_repository.dart';
import 'package:quitmate/core/services/storage/secure_storage_service.dart';

// Generate mocks with: flutter pub run build_runner build
@GenerateMocks([
  ProfileRepository,
  SecureStorageService,
])
void main() {}

class TestProviderContainer {
  static ProviderContainer createContainer({
    List<Override> overrides = const [],
  }) {
    final container = ProviderContainer(
      overrides: overrides,
    );
    addTearDown(container.dispose);
    return container;
  }
}

class TestConstants {
  static const testUserId = 'test-user-123';
  static const testNickname = 'TestUser';
  static const testCigarettesPerDay = 15;
  static const testCostPerPack = 12.5;
  static const testCigarettesPerPack = 20;
  static const testEpisodesPerWeek = 5;
}