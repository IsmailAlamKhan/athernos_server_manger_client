// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$allServersHash() => r'879bb2523257bff5377fe29bebc7ce318096fe89';

/// See also [allServers].
final allServersProvider = AutoDisposeFutureProvider<List<Server>>(
  allServers,
  name: r'allServersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allServersHash,
);
typedef AllServersRef = AutoDisposeFutureProviderRef<List<Server>>;
String _$serverStatusHash() => r'c3b93054bac35f891d947829a486b92ad72ff09b';

/// See also [serverStatus].
class ServerStatusProvider extends AutoDisposeFutureProvider<ServerStatus> {
  ServerStatusProvider(
    this.serverId,
  ) : super(
          (ref) => serverStatus(
            ref,
            serverId,
          ),
          from: serverStatusProvider,
          name: r'serverStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$serverStatusHash,
        );

  final String serverId;

  @override
  bool operator ==(Object other) {
    return other is ServerStatusProvider && other.serverId == serverId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, serverId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ServerStatusRef = AutoDisposeFutureProviderRef<ServerStatus>;

/// See also [serverStatus].
final serverStatusProvider = ServerStatusFamily();

class ServerStatusFamily extends Family<AsyncValue<ServerStatus>> {
  ServerStatusFamily();

  ServerStatusProvider call(
    String serverId,
  ) {
    return ServerStatusProvider(
      serverId,
    );
  }

  @override
  AutoDisposeFutureProvider<ServerStatus> getProviderOverride(
    covariant ServerStatusProvider provider,
  ) {
    return call(
      provider.serverId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'serverStatusProvider';
}
