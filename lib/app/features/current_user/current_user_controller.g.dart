// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_controller.dart';

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

String _$CurrentUserControllerHash() =>
    r'9313fb74ad6921acbbdba65873d3620399c3522e';

/// See also [CurrentUserController].
final currentUserControllerProvider =
    NotifierProvider<CurrentUserController, CurrentUserState>(
  CurrentUserController.new,
  name: r'currentUserControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$CurrentUserControllerHash,
);
typedef CurrentUserControllerRef = NotifierProviderRef<CurrentUserState>;

abstract class _$CurrentUserController extends Notifier<CurrentUserState> {
  @override
  CurrentUserState build();
}

String _$currentUserHash() => r'1662feb00c11f618b890df4e378879a78902cd64';

/// See also [currentUser].
final currentUserProvider = Provider<User?>(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
);
typedef CurrentUserRef = ProviderRef<User?>;
