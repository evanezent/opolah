import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opolah/blocs/address/address_event.dart';
import 'package:opolah/blocs/address/address_state.dart';
import 'package:opolah/repositories/address_repo.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository _addressRepository;
  StreamSubscription _subscription;

  AddressBloc({@required AddressRepository addressRepository})
      : assert(addressRepository != null),
        this._addressRepository = addressRepository,
        super(AddressLoading());

  Stream<AddressState> mapLoadState(LoadAddress event) async* {
    _subscription?.cancel();
    _subscription = _addressRepository.getStream(event.userID).listen((data) {
      add(AddressUpdated(data));
    });
  }

  Stream<AddressState> mapAddAddress(AddNewAddress event) async* {
    var res = await _addressRepository.addAddress(event.address);
    if (res != "") {
      yield SuccessAdd(res);
    } else {
      yield FailAdd();
    }
  }

  Stream<AddressState> mapUpdatingAddress(AddressUpdated event) async* {
    yield AddressSuccessLoad(event.address);
  }

  @override
  Stream<AddressState> mapEventToState(AddressEvent event) async* {
    if (event is LoadAddress) {
      yield* mapLoadState(event);
    } else if (event is AddressUpdated) {
      yield* mapUpdatingAddress(event);
    } else if (event is AddNewAddress) {
      yield* mapAddAddress(event);
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
