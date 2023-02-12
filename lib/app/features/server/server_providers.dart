import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features.dart';

part 'server_providers.g.dart';

@riverpod
Future<List<Server>> allServers(Ref ref) async {
  final currentUser = ref.watch(currentUserProvider);
  if (currentUser == null) {
    return Future.value([]);
  }

  return ref.watch(serverServiceProvider).servers(currentUser.id);
}

@riverpod
Future<ServerStatus> serverStatus(Ref ref, String serverId) async {
  final currentUser = ref.watch(currentUserProvider);
  if (currentUser == null) {
    return Future.value(ServerStatus.offline);
  }

  return ref.watch(serverServiceProvider).serverStatus(serverId, currentUser.id);
}
