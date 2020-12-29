import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:opolah/models/user.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  List<Object> get props => [];
}

class LoadUser extends ProfileEvent {
  final String id;

  LoadUser(this.id);
  @override
  List<Object> get props => [id];
}

class UpdateUser extends ProfileEvent {
  final User user;

  const UpdateUser(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Update User { User: $user }';
}

class UpdateImage extends ProfileEvent {
  final File image;

  const UpdateImage(this.image);

  @override
  List<Object> get props => [image];

  @override
  String toString() => 'Update Image { image : ${image.path} }';
}

class RegisterUser extends ProfileEvent {
  final User user;
  const RegisterUser(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Register user { user: $user }';
}

class LoginUser extends ProfileEvent {
  final String email, password;
  const LoginUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];

  @override
  String toString() =>
      'Register user { Email / Phone: $email, Password : $password }';
}

class UserUpdated extends ProfileEvent {
  final User user;

  const UserUpdated(this.user);

  @override
  List<Object> get props => [user];
}
