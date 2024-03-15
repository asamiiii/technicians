// ignore: must_be_immutable
import 'package:technicians/dummy_data.dart';
import 'package:technicians/login.dart';
import 'package:technicians/providers.dart/provider.dart';
import 'package:technicians/widgets/item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key,});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    var provider = context.read<MainProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await provider.getItems();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var responcive = ResponsiveBreakpoints.of(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var itemsCount = (screenWidth / 190).floor();
    return RefreshIndicator(
        onRefresh: () async {
          var provider = context.read<MainProvider>();
          await provider.getItems();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () async{
                await FirebaseAuth.instance.signOut();
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
              },
              child: Icon(Icons.logout)),
          ),
        
          body: Consumer<MainProvider>(
              builder: (context, provider, child) => provider.isLoading ==
                      false
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        children: [
                          // Image.asset(
                          //   ImagePath.logo,
                          //   fit: BoxFit.fill,
                          //   height: 50,
                          //   width: 350,
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
        
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          DummyData.clubsList.isNotEmpty
                              ? Expanded(
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Item(
                                        index: index,
                                        chocoItem: DummyData
                                            .clubsList[index]),
                                    itemCount:
                                        DummyData.clubsList.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: itemsCount == 1 ? 2 : itemsCount,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 0.7,
                                      crossAxisSpacing: 10,
                                    ),
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                    ),
                                    const Center(
                                        child: Text(
                                            'No Items For This Category !')),
                                  ],
                                ),
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator())),
                  bottomNavigationBar: GestureDetector(
                    onTap: () async{
                      await launchUrl(Uri.parse('https://chat.openai.com'),mode: LaunchMode.inAppBrowserView);
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('اكتشاف الاعطال عن طريق الذكاء الاصطناعي '),
                          Image.asset('assets/2.jpeg',height: 35,width: 30,)
                        ],
                      ),
                    ),
                  ),
        ));
  }
}
