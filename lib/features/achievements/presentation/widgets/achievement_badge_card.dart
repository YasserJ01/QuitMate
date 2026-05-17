import 'package:flutter/material.dart';
import '../../domain/entities/achievement.dart';

class AchievementBadgeCard extends StatelessWidget {
  final Achievement achievement;
  final bool compact;
  final VoidCallback? onTap;

  const AchievementBadgeCard({
    super.key,
    required this.achievement,
    this.compact = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = _buildContent(context);
    return Semantics(
      label: achievement.isUnlocked
          ? '${achievement.name} — earned ${_formatDate(achievement.unlockedAt!)}'
          : '${achievement.name} — ${achievement.progressValue} of ${achievement.progressMax}',
      child: onTap != null
          ? InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(compact ? 8 : 12),
              child: card,
            )
          : card,
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: achievement.isUnlocked ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(compact ? 8 : 12),
        side: achievement.isUnlocked
            ? const BorderSide(color: Color(0xFFFFD700), width: 2)
            : BorderSide.none,
      ),
      child: Padding(
        padding: EdgeInsets.all(compact ? 8 : 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIcon(compact ? 28 : 40),
            if (!compact) ...[
              const SizedBox(height: 8),
              Text(
                achievement.name,
                style: theme.textTheme.labelLarge,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: 4),
            if (!achievement.isUnlocked) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: achievement.progressPercent,
                  minHeight: compact ? 4 : 6,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation(
                    theme.colorScheme.primary,
                  ),
                ),
              ),
              if (!compact) ...[
                const SizedBox(height: 4),
                Text(
                  '${achievement.progressValue} / ${achievement.progressMax}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ],
            if (achievement.isUnlocked &&
                achievement.unlockedAt != null &&
                !compact)
              Text(
                'Earned ${_formatDate(achievement.unlockedAt!)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(double size) {
    return ColorFiltered(
      colorFilter: achievement.isUnlocked
          ? const ColorFilter.mode(Colors.transparent, BlendMode.multiply)
          : const ColorFilter.matrix([
              0.2126, 0.7152, 0.0722, 0, 0, //
              0.2126, 0.7152, 0.0722, 0, 0, //
              0.2126, 0.7152, 0.0722, 0, 0, //
              0, 0, 0, 1, 0, //
            ]),
      child: Text(
        achievement.iconEmoji,
        style: TextStyle(fontSize: size),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final local = date.toLocal();
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[local.month - 1]} ${local.day}';
  }
}