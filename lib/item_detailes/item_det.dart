// ignore: must_be_immutable
import 'package:technicians/item_detailes/widgets.dart/image_datails.dart';
import 'package:technicians/item_detailes/widgets.dart/textf.dart';
import 'package:technicians/models/req_model.dart';
import 'package:technicians/models/item_model.dart';
import 'package:technicians/providers.dart/provider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ChocoDetailes extends StatefulWidget {
  ItemModel? chocoItem;
  ChocoDetailes({super.key, this.chocoItem});

  @override
  State<ChocoDetailes> createState() => _ChocoDetailesState();
}

class _ChocoDetailesState extends State<ChocoDetailes> {
  List<String> imagesList = [];
  var nutritionColumn1 = [];
  var nutritionColumn2 = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var responcive = ResponsiveBreakpoints.of(context);
    return Scaffold(
      // appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController userName = TextEditingController();
          TextEditingController phone = TextEditingController();
          TextEditingController email = TextEditingController();
          // TextEditingController age = TextEditingController();

          // TextEditingController education = TextEditingController();

          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) => SingleChildScrollView(
              child: AlertDialog(
                content: SizedBox(
                  width: 500,
                  // height: 500,
                  child: Column(
                    children: [
                      AppTextField(
                          controller: userName,
                          keyboardType: TextInputType.text,
                          icon: const Icon(Icons.abc),
                          hintText: 'اسم العميل',
                          label: 'اسم العميل'),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextField(
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          icon: const Icon(Icons.abc),
                          hintText: 'رقم الهاتف',
                          label: 'رقم الهاتف'),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          icon: const Icon(Icons.abc),
                          hintText: 'البريد الالكتروني',
                          label: 'البريد الالكتروني'),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // AppTextField(
                      //     controller: age,
                      //     keyboardType: TextInputType.number,
                      //     icon: const Icon(Icons.abc),
                      //     hintText: 'السن',
                      //     label: 'السن'),
                      const SizedBox(
                        height: 10,
                      ),
                      // AppTextField(
                      //     controller: education,
                      //     keyboardType: TextInputType.text,
                      //     icon: const Icon(Icons.abc),
                      //     hintText: 'المؤهل الدراسي',
                      //     label: 'المؤهل الدراسي'),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // AppTextField(
                      //     controller: iBanCodeController,
                      //     keyboardType: TextInputType.text,
                      //     icon: const Icon(Icons.abc),
                      //     hintText: 'IBAN',
                      //     label: 'IBAN'),
                      // StatefulBuilder(
                      //   builder: (context, setState) => Row(
                      //     children: [
                      //       const Text('Sent'),
                      //       Checkbox(
                      //         checkColor: Colors.white,
                      //         // fillColor: MaterialStateProperty.resolveWith(getColor),
                      //         value: sent,
                      //         onChanged: (bool? value) {
                      //           setState(() {
                      //             sent = value!;
                      //             debugPrint('value $value');
                      //           });
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // StatefulBuilder(
                      //   builder: (context, setState) => Column(
                      //     children: <Widget>[
                      //       ListTile(
                      //         title: const Text('USD'),
                      //         leading: Radio<SingingCharacter>(
                      //           value: SingingCharacter.USD,
                      //           groupValue: character,
                      //           onChanged: (SingingCharacter? value) {
                      //             setState(() {
                      //               character = value;
                      //             });
                      //           },
                      //         ),
                      //       ),
                      //       ListTile(
                      //         title: const Text('EUR'),
                      //         leading: Radio<SingingCharacter>(
                      //           value: SingingCharacter.EUR,
                      //           groupValue: character,
                      //           onChanged: (SingingCharacter? value) {
                      //             setState(() {
                      //               character = value;
                      //             });
                      //           },
                      //         ),
                      //       ),
                      //       ListTile(
                      //         title: const Text('GBP'),
                      //         leading: Radio<SingingCharacter>(
                      //           value: SingingCharacter.GBP,
                      //           groupValue: character,
                      //           onChanged: (SingingCharacter? value) {
                      //             setState(() {
                      //               character = value;
                      //             });
                      //           },
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                actions: [
                  // TextButton(
                  //   child: const Text('Send'),
                  //   onPressed: () async {
                  //     int? accountType;
                  //     if (character == SingingCharacter.EUR) {
                  //       debugPrint('_character 1');
                  //       accountType = 1;
                  //     }
                  //     if (character == SingingCharacter.USD) {
                  //       debugPrint('_character 2');
                  //       accountType = 2;
                  //     }
                  //     if (character == SingingCharacter.GBP) {
                  //       debugPrint('_character 3');
                  //       accountType = 3;
                  //     }
                  //     if (idController.text.isEmpty ||
                  //         toController.text.isEmpty ||
                  //         valueController.text.isEmpty ||
                  //         timeController.text.isEmpty ||
                  //         accountType == null) {
                  //       Fluttertoast.showToast(
                  //           msg: "Please Fill all data",
                  //           toastLength: Toast.LENGTH_SHORT,
                  //           gravity: ToastGravity.BOTTOM,
                  //           timeInSecForIosWeb: 1,
                  //           backgroundColor: Colors.red,
                  //           textColor: Colors.white,
                  //           fontSize: 16.0);
                  //     } else {
                  //       await addItemToLocal(DetailsData(
                  //           ammount: valueController.text,
                  //           sent: sent,
                  //           userName: toController.text,
                  //           id: int.parse(idController.text),
                  //           time: DateTime.parse(timeController.text),
                  //           accountType: accountType,
                  //           reference: int.parse(refController.text == ''
                  //               ? '0'
                  //               : refController.text),
                  //           bankCode: bankCodeController.text,
                  //           iBan: iBanCodeController.text));

                  //       Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const MainView(),
                  //           ));
                  //       Fluttertoast.showToast(
                  //           msg: "Transaction is Added",
                  //           toastLength: Toast.LENGTH_SHORT,
                  //           gravity: ToastGravity.BOTTOM,
                  //           timeInSecForIosWeb: 1,
                  //           backgroundColor: Colors.green,
                  //           textColor: Colors.white,
                  //           fontSize: 16.0);
                  //     }
                  //   },
                  // ),
                  TextButton(
                    child: const Text('تآكيد الاشتراك'),
                    onPressed: () async {
                      // Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Center(
                              child: Text("Request is added Sucssesfully"))));

                      var provider = context.read<MainProvider>();
                      await provider.addAnnouncement(
                          Requests(
                            // age: age.text,
                            username: userName.text,
                            phone: phone.text,
                            email: email.text,
                            // education: education.text,
                          ),
                          context);
                      Navigator.pop(context);
                    },
                  ),
                ],
                title: const Text('ارسال طلب الي الفني'),
              ),
            ),
          );
        },
        child: const Text('اشترك'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DeatilesImage(
                  itemId: widget.chocoItem?.id,
                  imagesList: [widget.chocoItem?.image ?? '']),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        widget.chocoItem?.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 25),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //   SizedBox(
              //     width: MediaQuery.of(context).size.width*0.70,
              //     // height: 50,
              //     child: SingleChildScrollView(
              //       child: Text(
              //         textAlign: TextAlign.center,
              //         widget.chocoItem?.discription??'',style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 18),maxLines: 4,overflow: TextOverflow.ellipsis,),
              //     ))
              // ],),
              const SizedBox(
                height: 10,
              ),
              Text(
                'مقدمه عن الاشتراك',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: responcive.isMobile ? 15 : 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                // height: MediaQuery.of(context).size.height*0.20,
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.brown, width: 2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      // bottomLeft: Radius.circular(23),
                      bottomRight: Radius.circular(40),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(9),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.chocoItem?.dis ?? '',
                      textAlign: TextAlign.right,
                      style: responcive.isMobile
                          ? Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.bold)
                          : Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 20),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
