import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:opolah/models/transaction.dart';
import 'package:random_string/random_string.dart';

class TransactionRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('transaction');
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<List<TransactionClass>> getStream(String id) async {
    List<TransactionClass> transactionList = [];

    await collection.where("userID", isEqualTo: id).get().then((value) {
      value.docs.forEach((element) {
        TransactionClass transaction =
            TransactionClass.fromJson(element.data());
        transaction.setID(element.id);
        transactionList.add(transaction);
      });
    });

    return transactionList;
  }

  Future addTransaction(TransactionClass data) async {
    String iD = '';
    await collection.add(data.toJson()).then((value) {
      iD = value.id;
    }).catchError((onError) => print(onError.toString()));

    return iD;
  }

  Future<Map> getItem(String id) async {
    var res = await collection.where('itemID', isEqualTo: id).get();
    return res.docs[0].data();
  }

  Future<bool> updateTransaction(String id, String imgUrl, String bank) async {
    bool success = false;
    String now = DateFormat("dd-MM-yyyy").format(DateTime.now());
    Map<String, dynamic> upData = {'proof': imgUrl, 'date': now, 'bank': bank};

    await collection
        .doc(id)
        .update(upData)
        .then((value) => success = true)
        .catchError((onError) {
      success = false;
      print(onError);
    });

    return success;
  }

  Future<String> uploadPaymentProof(File image) async {
    String urlRes = "";
    String imageCode = randomAlphaNumeric(10) + ".png";
    Reference fireRef = _firebaseStorage.ref().child(imageCode);

    TaskSnapshot task = await fireRef.putFile(image);
    await task.ref.getDownloadURL().then((value) {
      print(value);
      urlRes = value;
    });

    return urlRes;
  }
}
