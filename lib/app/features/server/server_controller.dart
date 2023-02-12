import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/user.dart';
import '../features.dart';

part 'server_controller.g.dart';

@riverpod
ServerController serverController(Ref ref) => ServerController(ref);

class ServerController with NavigatorController {
  final ServerService _serverService;
  final User? user;
  final Ref ref;
  @override
  final EventBus eventBus;
  ServerController(this.ref)
      : _serverService = ref.read(serverServiceProvider),
        eventBus = ref.read(eventBusProvider),
        user = ref.watch(currentUserProvider);

  Future<void> start(String serverId) => runAsync(
        action: () async {
          await _serverService.start(serverId, user!.id);
          ref.invalidate(serverStatusProvider(serverId));
          showSnackbar(text: 'Server started');
        },
        methodName: 'start',
      );

  void stop(String serverId) => runAsync(
        action: () async {
          await _serverService.stop(serverId, user!.id);
          ref.invalidate(serverStatusProvider(serverId));
          showSnackbar(text: 'Server stopped');
        },
        methodName: 'stop',
      );

  void restart(String serverId) => runAsync(
        action: () async {
          await _serverService.restart(serverId, user!.id);
          ref.invalidate(serverStatusProvider(serverId));
          showSnackbar(text: 'Server restarted');
        },
        methodName: 'restart',
      );
}
