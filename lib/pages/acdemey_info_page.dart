// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/custom_class/c_global.dart';
import 'package:myflutterapp/custom_class/c_page_reserve.dart';
// import 'package:myflutterapp/custom_class/c_global.dart';
// import 'package:myflutterapp/pages/acdemey_info_image.dart';
// import 'package:myflutterapp/custom_class/c_labeltabbar.dart';
import 'package:myflutterapp/pages/acdemey_info_reservation.dart';
// import 'package:path_provider/path_provider.dart';
//import 'package:myflutterapp/pages/acdemey_info_reView';

import 'acdemey_info_Inform.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with TickerProviderStateMixin {
  late TabController _tabController;

// ignore: non_constant_identifier_names
  Set<Image> Item = {
    Image.asset('assets/icon.png'),
    Image.asset('assets/icon.png'),
    Image.asset('assets/icon.png'),
  };

  void Reservation() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ReserveWidget()));
  }

  //  void Review()
  // {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const ())
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(service.academy)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: FloatingActionButton(
            //     child: Icon(
            //       Icons.arrow_back,
            //     ),
            //     backgroundColor: Colors.purple,
            //     onPressed: () {
            //       Navigator.pop(context);
            //     }
            //   )
            // ),
            Padding(padding: EdgeInsets.only(top: 30)),
            //ImageSliderPage(imagelist: Item, height: 150),
            TabInform(),
          ],
        ),
      ),

      bottomNavigationBar: Row(
        children: [
          Material(
            color: const Color(0xffff8989),
            child: InkWell(
              onTap: () {},
              child: const SizedBox(
                height: kToolbarHeight,
                width: 100,
                child: Center(
                  child: Text(
                    '??????',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: const Color(0xffff8906),
              child: InkWell(
                onTap: Reservation,
                child: const SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      '????????????',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}