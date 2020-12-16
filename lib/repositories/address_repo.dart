import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/address.dart';

class AddressRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('address');

  Future registerUser(Address data) async {
    var newAddress = data.toJson();

    await collection.add(newAddress).then((value) {
      return value.id;
    }).catchError((err) {
      print(err);
      return null;
    });
  }

  Future<List<Address>> getStream() async {
    List<Address> addressList = [];

    await collection.get().then((value) {
      value.docs.forEach((element) {
        Address address = Address.fromJson(element.data());
        address.setID(element.id);
        addressList.add(address);
      });
    });

    return addressList;
  }
}
