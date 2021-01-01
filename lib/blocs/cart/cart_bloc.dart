import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opolah/blocs/cart/cart_event.dart';
import 'package:opolah/blocs/cart/cart_state.dart';
import 'package:opolah/repositories/cart_repo.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;
  StreamSubscription _subscription;

  CartBloc({@required CartRepository cartRepository})
      : assert(cartRepository != null),
        this._cartRepository = cartRepository,
        super(CartLoading());

  Stream<CartState> mapLoadState(LoadCart event) async* {
    _subscription?.cancel();
    _subscription = _cartRepository.getCarts(event.userID).listen((data) {
      add(CartUpdated(data));
    });
  }

  Stream<CartState> mapUpdatingCarts(CartUpdated event) async* {
    yield CartSuccessLoad(event.cart);
  }

  Stream<CartState> mapAddCart(AddCart event) async* {
    var res = await _cartRepository.addNewCart(event.cart);
    if (res) {
      yield SuccessAdd();
    } else {
      yield FailAdd();
    }
  }

  Stream<CartState> mapDeleteCart(DeleteCart event) async* {
    _cartRepository.deleteTheCart(event.cart);
  }

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is LoadCart) {
      yield* mapLoadState(event);
    } else if (event is CartUpdated) {
      yield* mapUpdatingCarts(event);
    } else if (event is AddCart) {
      yield* mapAddCart(event);
    } else if (event is DeleteCart) {
      yield* mapDeleteCart(event);
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
