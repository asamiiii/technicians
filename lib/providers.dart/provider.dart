import 'package:technicians/models/req_model.dart';
import 'package:technicians/remote_firebase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:toast/toast.dart';

class MainProvider extends ChangeNotifier {
  bool isLoading = false;
  List<String>? categoryList = [];
  List<String> branches = [];
  // List<Announcment> announcmentList = [];

  getItems() async {
    isLoading = true;
    notifyListeners();
    await FirebaseHelper.getItemsFromFirestore();
    isLoading = false;
    notifyListeners();
  }

  Future<void> addAnnouncement(Requests req, BuildContext context) async {
    isLoading = true;
    bool haveErro = false;
    notifyListeners();
    try {
      await FirebaseHelper.addReqToFirebase(req: req);
    } catch (error) {
      debugPrint('Error : $error');
      haveErro = true;
      isLoading = false;
      notifyListeners();
    }

    if (haveErro == true) {
      // Toast.show('Error when adding the data',
      //     duration: 5,
      //     gravity: Toast.bottom,
      //     backgroundColor: HexColor("#FF0000"));
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Center(child: Text("Error when adding the data"))));
    } else {
      // Toast.show('Request is added Sucssesfully',
      //     duration: 5, gravity: Toast.bottom);
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          // content: Center(child: Text("Request is added Sucssesfully"))));
    }

    isLoading = false;
    notifyListeners();
  }

  handlenutritionDeclaration() {}
}
