import 'package:equatable/equatable.dart';
import 'package:opolah/models/address.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  List<Object> get props => [];
}

class AddressLoading extends AddressState {}

class AddressFailLoad extends AddressState {}

class FailAdd extends AddressState {}

class SuccessAdd extends AddressState {
  final String id;

  SuccessAdd(this.id);

  List<Object> get props => [this.id];
}

class AddressSuccessLoad extends AddressState {
  final List<Address> addressList;

  AddressSuccessLoad(this.addressList);

  List<Object> get props => [addressList];

  @override
  String toString() {
    return 'Data : { Address List: $addressList }';
  }
}
