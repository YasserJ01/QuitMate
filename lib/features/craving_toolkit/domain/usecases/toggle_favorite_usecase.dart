import '../repositories/i_toolkit_repository.dart';

/// Toggles the favorite state of a single exercise by its stable UUID.
///
/// No confirmation dialog — instant, reversible.
class ToggleFavoriteUseCase {
  final IToolkitRepository _repository;

  const ToggleFavoriteUseCase(this._repository);

  Future<void> execute(String exerciseId) =>
      _repository.toggleFavorite(exerciseId);
}