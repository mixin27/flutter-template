import 'package:auto_route/auto_route.dart';
import 'package:template/src/features/app/app.dart';
import 'package:template/src/features/home/home.dart';
import 'package:template/src/features/settings/settings.dart';
import 'package:template/src/shared/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SkeletonPage extends ConsumerStatefulWidget {
  const SkeletonPage({super.key});

  @override
  ConsumerState<SkeletonPage> createState() => _SkeletonPageState();
}

class _SkeletonPageState extends ConsumerState<SkeletonPage> {
  @override
  void initState() {
    ref.read(networkStateServiceProvider(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(bottomNavControllerProvider) ?? 0;
    flogI('SkeletonPage', 'bottomNavIndex', '$index');

    const List<Widget> pageNavigation = <Widget>[
      HomePage(),
      SettingsPage(),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,

      /// When switching between tabs this will fade the old
      /// layout out and the new layout in.
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: pageNavigation.elementAt(index),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
