import 'package:equatable/equatable.dart';
import 'package:opolah/models/item.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  List<Object> get props => [];
}

class ItemsLoading extends ItemState {}

class ItemsLoaded extends ItemState {
  final List<Item> itemList;

  ItemsLoaded(this.itemList);

  List<Object> get props => [itemList];

  @override
  String toString() {
    return 'Data : { Item List: $itemList }';
  }
}
