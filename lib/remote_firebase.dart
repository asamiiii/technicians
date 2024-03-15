import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:technicians/dummy_data.dart';
import 'package:technicians/models/req_model.dart';
import 'package:technicians/models/item_model.dart';
import 'package:flutter/foundation.dart';
// import 'package:path/path.dart' as p;
// import 'package:firebase_storage/firebase_storage.dart';
// import '../../models/dept_model.dart';
// import '../../models/invoice_model.dart';

class FirebaseHelper {
  // static String? collectionName;

  static CollectionReference getInvoiceCollection() {
    return FirebaseFirestore.instance
        .collection('Items')
        .withConverter<ItemModel>(
          fromFirestore: (snapshot, _) => ItemModel.fromJson(snapshot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

  static Future getItemsFromFirestore() async {
    DummyData.clubsList.clear();
    var querySnapshot = await getInvoiceCollection().get();
    // Get data from docs and convert map to List
    for (var element in querySnapshot.docs) {
      DummyData.clubsList.add(element.data() as ItemModel);
    }
    debugPrint('Firebase :${DummyData.clubsList}');
  }
  //* ------ Announcment Services ------- *//

  static CollectionReference getReqtCollection() {
    return FirebaseFirestore.instance
        .collection('requests')
        .withConverter<Requests>(
          fromFirestore: (snapshot, _) => Requests.fromJson(snapshot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

  static Future<String> addReqToFirebase({required Requests? req}) async {
    var collection = getReqtCollection();
    var docRef = collection.doc();
    req?.id = docRef.id;
    await docRef.set(req);
    return docRef.id;
  }
}
