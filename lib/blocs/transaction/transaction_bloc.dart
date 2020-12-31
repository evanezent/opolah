import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opolah/blocs/transaction/transaction_event.dart';
import 'package:opolah/blocs/transaction/transaction_state.dart';
import 'package:opolah/repositories/transaction_repo.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _transactionRepository;
  StreamSubscription _subscription;

  TransactionBloc({@required TransactionRepository transactionRepository})
      : assert(transactionRepository != null),
        this._transactionRepository = transactionRepository,
        super(TransactionLoading());

  Stream<TransactionState> mapLoadState(LoadTransaction event) async* {
    _subscription?.cancel();
    _subscription =
        _transactionRepository.getTransactions(event.userID).listen((data) {
      add(TransactionUpdated(data));
    });
  }

  Stream<TransactionState> mapAddTransaction(AddTransaction event) async* {
    var res = await _transactionRepository.addTransaction(event.transaction);
    if (res != "") {
      yield SuccessAdd();
    } else {
      yield FailAdd();
    }
  }

  Stream<TransactionState> mapUpdatingTransaction(
      TransactionUpdated event) async* {
    yield TransactionSuccessLoad(event.transaction);
  }

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is LoadTransaction) {
      yield* mapLoadState(event);
    } else if (event is TransactionUpdated) {
      yield* mapUpdatingTransaction(event);
    } else if (event is AddTransaction) {
      yield* mapAddTransaction(event);
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
