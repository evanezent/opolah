import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opolah/blocs/item/item_event.dart';
import 'package:opolah/blocs/item/item_state.dart';
import 'package:opolah/repositories/item_repo.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository _itemRepository;
  StreamSubscription _subscription;

  ItemBloc({@required ItemRepository itemRepository})
      : assert(itemRepository != null),
        this._itemRepository = itemRepository,
        super(ItemsLoading());

  Stream mapLoadState() async* {
    _subscription?.cancel();
    _subscription = _itemRepository.getItems().listen((data) {
      add(ItemsUpdated(data));
    });
  }

  Stream mapUpdatingItems(ItemsUpdated event) async* {
    yield ItemsLoaded(event.items);
  }

  @override
  Stream<ItemState> mapEventToState(ItemEvent event) async* {
    if (event is LoadItems) {
      yield* mapLoadState();
    } else if (event is ItemsUpdated) {
      yield* mapUpdatingItems(event);
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
