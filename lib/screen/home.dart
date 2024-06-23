import 'package:flutter/material.dart';
import 'package:roaia_app/core/helpers/cache_helper.dart';
import 'package:roaia_app/localization/localization_methods.dart';
import 'package:roaia_app/models/user_info_model.dart';
import 'package:roaia_app/screen/about.dart';
import 'package:roaia_app/screen/login/login.dart';
import 'package:roaia_app/screen/blind_info/patient_info.dart';
import 'package:roaia_app/screen/setting.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Image.asset('assets/images/home.png')),
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  size: 30,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
               Builder(
                 builder: (context) {
                   return Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('${CacheHelper.get(key: 'imageUrl')}'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${CacheHelper.get(key: 'name')}',
                        style: TextStyle(fontFamily: "Nunito",
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      )
                    ],
                                 );
                 }
               ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Patient_Info(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsetsDirectional.all(5),
                  margin: const EdgeInsetsDirectional.all(5),
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all()),
                  child: Row(
                    children: [
                      Image.asset('assets/images/profile1.png'),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(tr("patient_info", context))
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Setting(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsetsDirectional.all(5),
                  margin: const EdgeInsetsDirectional.all(5),
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all()),
                  child: Row(
                    children: [
                      Image.asset('assets/images/profile2.png'),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(tr("settings", context))
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const About_App(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsetsDirectional.all(5),
                  margin: const EdgeInsetsDirectional.all(5),
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all()),
                  child: Row(
                    children: [
                      Image.asset('assets/images/profile3.png'),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(tr("about_roaia", context))
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  CacheHelper.clear();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Login_Screen(),
                  ));
                },
                child: Container(
                  padding: const EdgeInsetsDirectional.all(5),
                  margin: const EdgeInsetsDirectional.all(5),
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all()),
                  child: Row(
                    children: [
                      Icon(Icons.logout_outlined),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Log out')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
