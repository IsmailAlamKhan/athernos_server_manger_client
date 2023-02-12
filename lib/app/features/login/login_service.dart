import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user.dart';
import '../features.dart';

final loginServiceProvider = Provider<LoginService>((ref) => LoginServiceImpl(ref));

abstract class LoginService {
  Future<User?> login(LoginState state);
  Future<LoginState?> initialState();
}

mixin RemoteLoginServiceImpl on LoginService, HttpClientService {
  @override
  abstract final Ref<Object?> ref;

  Future<User?> loginRemote(LoginState state) {
    return post<Map<String, dynamic>>(
      path: '/login',
      data: {'username': state.username, 'password': state.password},
    ).then((response) {
      return User.fromJson(response.data);
    });
  }
}

mixin LocalLoginServiceImpl on LoginService {
  abstract final LocalStorage localStorage;

  @override
  Future<LoginState?> initialState() async {
    final userFromStorage = await localStorage.get<LoginState?>(
      LocalStorageKeys.currentUser,
      fromJson: LoginState.fromJson,
    );
    return userFromStorage;
  }

  Future<void> saveUser(LoginState user) async {
    await localStorage.set(LocalStorageKeys.currentUser, user);
  }
}

class LoginServiceImpl extends LoginService
    with HttpClientService, RemoteLoginServiceImpl, LocalLoginServiceImpl {
  @override
  final Ref<Object?> ref;

  @override
  final LocalStorage localStorage;

  LoginServiceImpl(this.ref) : localStorage = ref.read(localStorageProvider) {
    init();
  }

  @override
  Future<User?> login(LoginState state) async {
    final user = await loginRemote(state);
    if (user != null) {
      await saveUser(state);
    }
    return user;
  }
}
