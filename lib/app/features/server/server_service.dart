import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/utils.dart';
import '../features.dart';

final serverServiceProvider = Provider<ServerService>((ref) => ServerServiceImpl(ref));

abstract class ServerService {
  Future<List<Server>> servers(String userId);

  Future<void> start(String serverId, String userId);

  Future<void> stop(String serverId, String id);

  Future<void> restart(String serverId, String id);

  Future<ServerStatus> serverStatus(String serverId, String userId);
}

class ServerServiceImpl extends ServerService with HttpClientService {
  @override
  final Ref<Object?> ref;
  ServerServiceImpl(this.ref) {
    init();
  }

  @override
  Future<List<Server>> servers(String userId) {
    try {
      return get<List>(path: '/servers', params: {'id': userId})
          .then((value) => value.data.cast<Map<String, dynamic>>().map(Server.fromJson).toList());
    } catch (e, s) {
      logError('Error while fetching servers', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> start(String serverId, String userId) {
    try {
      return post(path: '/servers/$serverId/start', data: {'userId': userId});
    } catch (e, s) {
      logError('Error while starting server', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> restart(String serverId, String id) {
    try {
      return post(path: '/servers/$serverId/restart', data: {'userId': id});
    } catch (e, s) {
      logError('Error while restarting server', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> stop(String serverId, String id) {
    try {
      return post(path: '/servers/$serverId/stop', data: {'userId': id});
    } catch (e, s) {
      logError('Error while stopping server', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<ServerStatus> serverStatus(String serverId, String userId) {
    try {
      return get<String>(path: '/servers/$serverId/status', params: {'userId': userId})
          .then((value) => ServerStatus.values.byName(value.data));
    } catch (e, s) {
      logError('Error while fetching server status', error: e, stackTrace: s);
      rethrow;
    }
  }
}
