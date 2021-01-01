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
  List<Object> get props => [msg != null ?? msg];
}

class UserSuccess extends ProfileState {
  final String userID;

  UserSuccess({this.userID});
  List<Object> get props => [userID != "" ?? userID];
}

class ImageSuccess extends ProfileState {
  final String img;

  ImageSuccess(this.img);
  List<Object> get props => [img];
}

class ImageFail extends ProfileState {}

class ProfileSuccessLoad extends ProfileState {
  final User profileList;

  ProfileSuccessLoad(this.profileList);

  List<Object> get props => [profileList];

  @override
  String toString() {
    return 'Data : { Profile List: $profileList }';
  }
}
