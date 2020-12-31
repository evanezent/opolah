import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:opolah/models/transaction.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  List<Object> get props => [];
}

class LoadTransaction extends TransactionEvent {
  final String userID;

  LoadTransaction(this.userID);
  @override
  List<Object> get props => [userID];
}

class AddTransaction extends TransactionEvent {
  final TransactionClass transaction;

  const AddTransaction(this.transaction);

  @override
  List<Object> get props => [transaction];

  @override
  String toString() => 'Add Transaction { transaction: $transaction }';
}

class UploadPayment extends TransactionEvent {
  final File image;

  const UploadPayment(this.image);

  @override
  List<Object> get props => [image];

  @override
  String toString() => 'Upload Payment { image : ${image.path} }';
}

class UpdateTransaction extends TransactionEvent {
  final String id, imgUrl, bank;

  const UpdateTransaction(this.id, this.imgUrl, this.bank);

  @override
  List<Object> get props => [this.id, this.imgUrl, this.bank];
}

class TransactionUpdated extends TransactionEvent {
  final List<TransactionClass> transaction;

  const TransactionUpdated(this.transaction);

  @override
  List<Object> get props => [transaction];
}
