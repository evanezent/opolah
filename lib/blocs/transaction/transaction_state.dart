import 'package:equatable/equatable.dart';
import 'package:opolah/models/transaction.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  List<Object> get props => [];
}

class TransactionLoading extends TransactionState {}

class TransactionFailLoad extends TransactionState {}

class TransactionFail extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final String id;

  TransactionSuccess({this.id});
  List<Object> get props => [id];
}

class SuccessUpload extends TransactionState {
  final String imgUrl;

  SuccessUpload(this.imgUrl);

  List<Object> get props => [imgUrl];
}

class FailUpload extends TransactionState {}

class TransactionSuccessLoad extends TransactionState {
  final List<TransactionClass> transctionList;

  TransactionSuccessLoad(this.transctionList);

  List<Object> get props => [transctionList];

  @override
  String toString() {
    return 'Data : { Transaction List: $transctionList }';
  }
}
