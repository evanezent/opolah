import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/address.dart';

class AddressRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('address');

  Future addAddress(Address data) async {
    var newAddress = data.toJson();
    String iD = "";

    await collection.add(newAddress).then((value) {
      iD = value.id;
    }).catchError((err) {
      print(err);
      return "";
    });

    return iD;
  }

  Stream<List<Address>> getStream(String id) {
    return collection.where("userID", isEqualTo: id).snapshots().map((value) {
      return value.docs.map((data) => Address.fromSnapshot(data)).toList();
    });
  }
}
