// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features.dart';

class ServerTile extends HookConsumerWidget {
  const ServerTile({
    super.key,
    required this.server,
  });
  final Server server;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = useRef(server.status);
    final statusAsync = ref.watch(serverStatusProvider(server.id));
    final controller = ref.watch(serverControllerProvider);
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 10), (_) {
        ref.invalidate(serverStatusProvider(server.id));
      });
      return timer.cancel;
    }, [server]);

    useEffect(() {
      statusAsync.whenOrNull(
        data: (data) {
          if (status.value != data) {
            status.value = data;
          }
        },
      );
    }, [statusAsync]);

    List<Widget> trailing;
    switch (status.value) {
      case ServerStatus.offline:
        trailing = [
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () => controller.start(server.id),
          ),
        ];
        break;
      case ServerStatus.loading:
      case ServerStatus.preparing:
        trailing = [
          const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(),
          ),
        ];

        break;
      case ServerStatus.online:
        trailing = [
          IconButton(
            icon: const Icon(Icons.stop),
            onPressed: () => controller.stop(server.id),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.restart(server.id),
          ),
        ];
        break;
    }

    return ListTile(
      title: Text(server.address),
      subtitle: Text(status.value.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: trailing,
      ),
    );
  }
}
