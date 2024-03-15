import 'package:technicians/home.dart';
import 'package:technicians/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

List<String> passList = ['123', '321', '987', '423'];

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegScreen> {
  TextEditingController codeController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: HexColor('#d5a43b'),
      // floatingActionButton: FloatingActionButton(onPressed: (){},
      // child: const Text('Login Login')
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHight * 0.10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/1.jpeg',
                    width: screenWidth * 0.60,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('تطبيق تنظيم النوادي الرياضية')],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: screenWidth * 0.75,
                child: TextFormField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'User Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: screenWidth * 0.75,
                child: TextFormField(
                  controller: passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: screenWidth * 0.75,
                child: TextFormField(
                  key: const Key('conPass'),
                  keyboardType: TextInputType.emailAddress,
                  controller: confirmpassController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Confirm Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if(passController.text==confirmpassController.text){
                        debugPrint("press signup");
                  // showLoading(context, 'جاري تسجيل حسابك');
                   ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Center(child: Text("Loading"))));
                  bool user = await userReg(
                      context, codeController.text, passController.text);
                  //hideLoading(context);
                  if (user != false) {
                    // ignore: use_build_context_synchronously
                    // hideLoading(context);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                    // ignore: use_build_context_synchronously
                    //hideLoading(context);
                    // showSnakBarSuccess(context,
                    //     'تم التسجيل بنجاح', greenColor);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Center(child: Text("Registred Successfully"))));
                  }
                  }else{
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Center(child: Text("The Password not Compatible with Confirmed Password"))));
                  }
                  
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red)),
                child: Text(
                  'انشاء حساب',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: Text('تسجيل الدخول'))
            ],
          ),
        ),
      ),
    );
  }
}

FirebaseAuth credential = FirebaseAuth.instance;
Future<bool> userReg(
    BuildContext context, String emailAddress, String password) async {
  debugPrint('context : $context');

  try {
    await credential.createUserWithEmailAndPassword(
      email: emailAddress.trim(),
      password: password,
    );
    //debugPrint('Success');
    //alertDialog(context,'Success','');

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak.');
      //const Center(child: Text('knkjhljh'));
      // hideLoading(context);
      // alertDialog(
      //     context: context,
      //     title: AppStrings.weekPassword,
      //     desc: AppStrings.weekPasswordDesc);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Center(child: Text("The Password Week"))));
      return false;
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
      //const Center(child: Text('knkjhljh'));
      // hideLoading(context);
      // alertDialog(context: context, title: AppStrings.emailIsExist, desc: '');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Center(child: Text("This E-mail is already exist !"))));
      return false;
    }
    else if(e.code=='invalid-email'){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Center(child: Text("invalid-email"))));
          return false;
    }
  } catch (e) {
    debugPrint('error ------> $e');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Center(child: Text("Problem"))));
    return false;

    // ignore: dead_code
    // hideLoading(context);
    // alertDialog(context:context,title: AppStrings.emailIsExist,desc: e.toString());
    
  }
  return false;
}
