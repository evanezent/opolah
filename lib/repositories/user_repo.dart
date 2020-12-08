import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/user.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('user');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future registerUser(User data) async {
    var resEmail = checkEmail(data.email);
    var resPhone = checkPhone(data.phone);

    bool decision = true;

    await resEmail.then((value) async {
      await resPhone.then((value2) async {
        if (!value2 && !value) {
          await collection.add(data.toJson(data)).then((value) {
            decision = true;
          }).catchError((err) {
            print(err);
            decision = false;
          });
        } else {
          decision = false;
        }
      });
    });

    return decision;
  }

  Future checkEmail(String email) async {
    var res = await collection.where('email', isEqualTo: email).get();
    if (res.docs.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future checkPhone(String phone) async {
    var res = await collection.where('phone', isEqualTo: phone).get();
    if (res.docs.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future loginUser(String email, String password) async {
    String query = 'phone';
    if (email.contains('@')) {
      query = 'email';
    }

    var res = await collection.where(query, isEqualTo: email).get();

    if (res.docs.length == 0) {
      return "Email or phone doesn't exists";
    } else {
      if (res.docs[0]['password'] == password) {
        return 'pass';
      } else {
        return "Password not match";
      }
    }
  }
}
