import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/exception.dart';
import '../features.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController with NavigatorController {
  late LoginService loginService;
  @override
  late EventBus eventBus;
  @override
  LoginState build() {
    loginService = ref.read(loginServiceProvider);
    eventBus = ref.read(eventBusProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) => getInitialState());
    return const LoginState();
  }

  Future<void> getInitialState() async {
    showLoading();

    final initialState = await loginService.initialState();
    if (initialState != null) {
      state = initialState;
    }
    hideLoading();
  }

  void usernameChanged(String username) {
    state = state.copyWith(username: username);
  }

  void passwordChanged(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> login() async {
    if (state.username == null || state.username!.isEmpty) {
      showSnackbar(text: 'Username is required');
      return;
    }
    if (state.password == null || state.password!.isEmpty) {
      showSnackbar(text: 'Password is required');
      return;
    }
    showLoading();
    try {
      final user = await loginService.login(state);
      eventBus.emit(UserLoggedInEvent(user!));
      hideLoading();
      pushReplacement((_) => const HomeView());
    } on AppException catch (e) {
      showSnackbar(text: e.message);
      hideLoading();
    }
  }
}
