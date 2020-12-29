import 'package:equatable/equatable.dart';
import 'package:opolah/models/user.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {}

class UserFail extends ProfileState {
  final String msg;

  UserFail({this.msg});
  List<Object> get props => [msg];
}

class UserSuccess extends ProfileState {}

class ProfileSuccessLoad extends ProfileState {
  final User profileList;

  ProfileSuccessLoad(this.profileList);

  List<Object> get props => [profileList];

  @override
  String toString() {
    return 'Data : { Profile List: $profileList }';
  }
}
