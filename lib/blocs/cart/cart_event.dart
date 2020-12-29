import 'package:equatable/equatable.dart';
import 'package:opolah/models/cart.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  List<Object> get props => [];
}

class LoadCart extends CartEvent {
  final String userID;

  LoadCart(this.userID);
  @override
  List<Object> get props => [userID];
}

class UpdateCart extends CartEvent {
  final List<Cart> cart;

  const UpdateCart(this.cart);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'Update Cart { cart: $cart }';
}

class AddCart extends CartEvent {
  final Cart cart;

  const AddCart(this.cart);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'Add Cart { cart: $cart }';
}

class DeleteCart extends CartEvent {
  final Cart cart;

  const DeleteCart(this.cart);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'Delete Cart { cart: $cart }';
}

class CartUpdated extends CartEvent {
  final List<Cart> cart;

  const CartUpdated(this.cart);

  @override
  List<Object> get props => [cart];
}
