import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user.dart';
import '../../utils/utils.dart';
import '../features.dart';

part 'current_user_controller.g.dart';

class UserLoggedInEvent with Event {
  final User user;
  UserLoggedInEvent(this.user);
}

class UserLoggedOutEvent with Event {}

@riverpodKeepAlive
User? currentUser(Ref ref) {
  final state = ref.watch(currentUserControllerProvider);
  return state.whenOrNull(loggedIn: (user) => user);
}

@riverpodKeepAlive
class CurrentUserController extends _$CurrentUserController with NavigatorController {
  @override
  late EventBus eventBus;
  @override
  CurrentUserState build() {
    eventBus = ref.read(eventBusProvider);

    return const CurrentUserState.loggedOut();
  }

  void init() {
    eventBus.on<UserLoggedInEvent>((event) => login(event.user));
    eventBus.on<UserLoggedOutEvent>((event) => logout());
  }

  void login(User user) {
    state = CurrentUserState.loggedIn(user);
    logInfo('User logged in: ${user.username}');
  }

  void logout() {
    state = const CurrentUserState.loggedOut();
    pushAndRemoveAll((context) => const LoginView());
  }
}
