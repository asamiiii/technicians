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
          TextEditingController det = TextEditingController();

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
                      AppTextField(
                          controller: det,
                          maxLines: 3,
                          keyboardType: TextInputType.text,
                          icon: const Icon(Icons.abc),
                          hintText: 'تفاصيل العطل',
                          label: 'تفاصيل العطل'),
                      const SizedBox(
                        height: 10,
                      ),
                      
                    ],
                  ),
                ),
                actions: [
                
                  TextButton(
                    child: const Text('تآكيد الطلب'),
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
                            det:det.text
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
        child: const Text('اطلب'),
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
                'معلومات عن الفني',
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
