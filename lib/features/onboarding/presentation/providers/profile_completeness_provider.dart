import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitmate/features/tracking/presentation/providers/tracking_provider.dart';
import '../../data/models/user_profile.dart';
import '../../domain/services/profile_completeness_service.dart';
import '../providers/onboarding_provider.dart';

final profileCompletenessProvider = FutureProvider<ProfileCompleteness>((ref) async {
  final userId = await ref.read(currentUserIdProvider.future);
  if (userId == null) return ProfileCompleteness.empty();
  final profile = await ref.read(profileRepositoryProvider).getProfile(userId);
  if (profile == null) return ProfileCompleteness.empty();
  return ProfileCompletenessService().evaluate(profile);
});

/// Unified provider that returns dashboard data based on mode.
class DashboardData {
  final UserProfile profile;
  final ProfileCompleteness completeness;

  const DashboardData({
    required this.profile,
    required this.completeness,
  });
}

final dashboardDataProvider = FutureProvider<DashboardData>((ref) async {
  final userId = await ref.read(currentUserIdProvider.future);
  if (userId == null) throw Exception('No user found');
  final profile = await ref.read(profileRepositoryProvider).getProfile(userId);
  if (profile == null) throw Exception('Profile not found');
  final completeness = ProfileCompletenessService().evaluate(profile);
  return DashboardData(profile: profile, completeness: completeness);
});
