import 'package:equatable/equatable.dart';
import 'package:opolah/models/item.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  List<Object> get props => [];
}

class LoadItems extends ItemEvent {}

class ItemsUpdated extends ItemEvent {
  final List<Item> items;

  const ItemsUpdated(this.items);

  @override
  List<Object> get props => [items];
}
