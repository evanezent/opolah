import 'package:equatable/equatable.dart';
import 'package:opolah/models/cart.dart';

abstract class CartState extends Equatable {
  const CartState();

  List<Object> get props => [];
}

class CartLoading extends CartState {}

class CartFailLoad extends CartState {}

class FailAdd extends CartState {}
class SuccessAdd extends CartState {}

class CartSuccessLoad extends CartState {
  final List<Cart> cartList;

  CartSuccessLoad(this.cartList);

  List<Object> get props => [cartList];

  @override
  String toString() {
    return 'Data : { Cart List: $cartList }';
  }
}
