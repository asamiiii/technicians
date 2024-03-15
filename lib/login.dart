import 'package:technicians/home.dart';
import 'package:technicians/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

List<String> passList = ['123', '321', '987', '423'];

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController codeController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('أحصل علي الفني لأصلاح أعطالك حالا')],
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
              ElevatedButton(
                onPressed: () async {
                  // var provider = context.read<MainProvider>();

                  // provider.handleBranchesItemsList();

                  // if(provider.branches.contains(codeController.text.trim())){
                  //    await CacheHelper.addStringToCache(key: 'branch', value:codeController.text.trim());
                  //   provider.handleCategoryItemsList();
                  //   // provider.setSelectedCategory(branch:codeController.text,categoryTxt: provider.categoryList?[0] );
                  //   // ignore: use_build_context_synchronously
                  // if (passList.contains(passController.text) &&
                  //     codeController.text.isNotEmpty) {
                  //   Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const Home(),
                  //       ));
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //       content: Center(child: Text("Login failed"))));
                  // }

                  // }
                  // else{
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Center(child: Text("Login failed"))));
                  // }

                  // showLoading(context, 'محاولة التسجيل');
                  bool user = await userLogin(
                      context: context,
                      emailAddress: codeController.text,
                      password: passController.text);

                  if (user != false) {
                    // ignore: use_build_context_synchronously
                    // hideLoading(context);
                    // FirebaseHelper.collectionName= emailcon.text;
                    // CashHelper.addToLocal(emailcon.text);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Home(),
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Center(child: Text("Login Successfully"))));
                  }
                  //hideLoading(context);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red)),
                child: Text(
                  'تسجيل الدخول',
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
                          builder: (context) => RegScreen(),
                        ));
                  },
                  child: Text('انشاء حساب'))
            ],
          ),
        ),
      ),
    );
  }
}

FirebaseAuth credential = FirebaseAuth.instance;
Future<bool> userLogin(
    {required BuildContext context,
    required String emailAddress,
    required String password}) async {
  //bool user =false ;
  try {
    await credential.signInWithEmailAndPassword(
        email: emailAddress, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      // hideLoading(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Center(child: Text("Login failed"))));
      // hideLoading(context);
      debugPrint('No user found for that email.');
      return false;
    } else if (e.code == 'wrong-password') {
      // hideLoading(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Center(child: Text("Login failed"))));
      //hideLoading(context);
      debugPrint('Wrong password provided for that user.');
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Center(child: Text("Wrong password "))));
      return false;
    }
    else if(e.code=='invalid-email'){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Center(child: Text("invalid-email"))));
          return false;
    }
    //hideLoading(context);
    return false;
  }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Center(child: Text(e.toString()))));
           return false;
  }
}
