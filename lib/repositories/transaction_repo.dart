import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/transaction.dart';

class TransactionRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('transaction');

  Future<List<TransactionClass>> getStream() async {
    List<TransactionClass> transactionList = [];

    await collection.get().then((value) {
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
}
