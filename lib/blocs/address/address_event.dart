import 'package:equatable/equatable.dart';
import 'package:opolah/models/address.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  List<Object> get props => [];
}

class LoadAddress extends AddressEvent {
  final String userID;

  LoadAddress(this.userID);
  @override
  List<Object> get props => [userID];
}

class AddNewAddress extends AddressEvent {
  final Address address;

  const AddNewAddress(this.address);

  @override
  List<Object> get props => [address];

  @override
  String toString() => 'Add address { address: $address }';
}

class DeleteAddress extends AddressEvent {
  final Address address;

  const DeleteAddress(this.address);

  @override
  List<Object> get props => [address];

  @override
  String toString() => 'Delete Cart { cart: $address }';
}

class AddressUpdated extends AddressEvent {
  final List<Address> address;

  const AddressUpdated(this.address);

  @override
  List<Object> get props => [address];
}
