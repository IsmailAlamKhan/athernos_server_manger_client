import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/widgets/async_value_builder.dart';
import '../../utils/utils.dart';
import '../features.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    if (currentUser == null) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            text: '$appName | ',
            children: [
              TextSpan(
                text: currentUser.username,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(currentUserControllerProvider.notifier).logout(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => ref.invalidate(allServersProvider),
      ),
      body: AsyncValueBuilder(
        value: ref.watch(allServersProvider),
        builder: (context, servers) {
          return ListView.builder(
            itemCount: servers.length,
            itemBuilder: (context, index) {
              final server = servers[index];
              return ServerTile(server: server);
            },
          );
        },
      ),
    );
  }
}
