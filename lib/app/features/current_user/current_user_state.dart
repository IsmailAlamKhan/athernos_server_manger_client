import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/models.dart';

part 'current_user_state.freezed.dart';

@freezed
class CurrentUserState with _$CurrentUserState {
  const factory CurrentUserState.loggedOut() = _LoggedOut;
  const factory CurrentUserState.loggedIn(User user) = _LoggedIn;
}
