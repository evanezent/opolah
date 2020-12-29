import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opolah/blocs/profile/profile_event.dart';
import 'package:opolah/blocs/profile/profile_state.dart';
import 'package:opolah/repositories/user_repo.dart';

class UserBloc extends Bloc<ProfileEvent, ProfileState> {
  final DataRepository _userRepository;
  StreamSubscription _subscription;

  UserBloc({@required DataRepository userRepo})
      : assert(userRepo != null),
        _userRepository = userRepo,
        super(ProfileLoading());

  Stream<ProfileState> mapLogin(LoginUser event) async* {
    var res = await _userRepository.loginUser(event.email, event.password);
    if ((res.contains("Password")) || (res.contains("email"))) {
      yield UserFail(msg: res);
    } else {
      yield UserSuccess();
    }
  }

  Stream<ProfileState> mapRegister(RegisterUser event) async* {
    var res = await _userRepository.registerUser(event.user);
    if (res == false) {
      yield UserFail();
    } else {
      yield UserSuccess();
    }
  }

  Stream<ProfileState> mapLoadUser(LoadUser event) async* {
    _subscription?.cancel();
    _subscription = _userRepository
        .loadUser(event.id)
        .listen((data) => add(UserUpdated(data)));
  }

  Stream<ProfileState> mapUpdateUser(UpdateUser event) async* {
    _userRepository.updateUser(event.user);
  }

  Stream<ProfileState> mapUpdateImage(UpdateImage event) async* {
    _userRepository.uploadImage(event.image);
  }

  Stream<ProfileState> mapUpdatingUserState(UserUpdated event) async* {
    yield ProfileSuccessLoad(event.user);
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadUser) {
      yield* mapLoadUser(event);
    } else if (event is LoginUser) {
      yield* mapLogin(event);
    } else if (event is RegisterUser) {
      yield* mapRegister(event);
    } else if (event is UpdateImage) {
      yield* mapUpdateImage(event);
    } else if (event is UpdateUser) {
      yield* mapUpdateUser(event);
    } else if (event is UserUpdated) {
      yield* mapUpdatingUserState(event);
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
