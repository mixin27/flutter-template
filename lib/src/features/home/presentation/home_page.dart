import 'package:auto_route/auto_route.dart';
import 'package:template/src/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return Center(
            child: Text('Home'.hardcoded),
          );
        },
      ),
    );
  }
}
