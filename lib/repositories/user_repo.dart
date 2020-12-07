import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/user.dart';

class DataRepository {
  // 1
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('user');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  // 3
  Future<DocumentReference> registerUser(User data) async {
    return await collection.add(data.toJson(data)).then((value) {
      print(value);
    });
  }

  // 4
  // updatePet(Pet pet) async {
  //   await collection.doc(pet.reference.id).update(pet.toJson());
  // }
}
