import 'package:template/src/features/app/presentation/views/bottom_nav_controller.dart';
import 'package:template/src/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavControllerProvider) ?? 0;

    return Card(
      margin: const EdgeInsets.only(top: 1, right: 4, left: 4),
      elevation: 4,
      shadowColor: Theme.of(context).colorScheme.shadow,
      color: Theme.of(context).colorScheme.surfaceVariant,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: index,
        onTap: (idx) => ref
            .read(bottomNavControllerProvider.notifier)
            .setAndPersistValue(idx),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).textTheme.bodySmall!.color,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Ionicons.home_outline),
            label: 'Home'.hardcoded,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Ionicons.settings_outline),
            label: 'Settings'.hardcoded,
          ),
        ],
      ),
    );
  }
}
