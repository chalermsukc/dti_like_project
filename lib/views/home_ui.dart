// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 7, vsync: this, initialIndex: _currentTabIndex);
    super.initState();
  }

  //เมธอดโทร....
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  //เมธอดเปิดเว็บ
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.pink,
          title: Text(
            'DTI Cake Shop',
            style: GoogleFonts.kanit(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                exit(0); //ปิด-ออกจากแอปฯ
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.grey,
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.grey[400],
            indicatorColor: Colors.yellow,
            indicatorWeight: 5.0,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.shop,
                ),
                text: 'เค้กบ้านสวน',
              ),
              Tab(
                icon: Icon(
                  Icons.shop_2_outlined,
                ),
                text: 'Smile Bekery',
              ),
              Tab(
                icon: Icon(
                  Icons.abc_sharp,
                ),
                text: 'กาแฟชาวดอย',
              ),
              Tab(
                icon: Icon(
                  Icons.safety_check_outlined,
                ),
                text: 'เค้ก และขนมเมืองสวรรค์',
              ),
              Tab(
                icon: Icon(
                  Icons.one_x_mobiledata_outlined,
                ),
                text: 'Cafe Cake ME',
              ),
              Tab(
                icon: Icon(
                  Icons.kayaking,
                ),
                text: 'Cafe de อิ่ม',
              ),
              Tab(
                icon: Icon(
                  Icons.macro_off,
                ),
                text: 'Bekery and Milk',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'SAU Cake Shop',
                  style: GoogleFonts.kanit(),
                ),
                accountEmail: Text(
                  'แอปสำหรับคนชอบกินเค้ก',
                  style: GoogleFonts.kanit(),
                ),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bg_welcome.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2016/06/07/18/51/tart-1442275_640.jpg',
                  ),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2016/06/07/18/51/tart-1442275_640.jpg',
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2016/06/07/18/51/tart-1442275_640.jpg',
                    ),
                  ),
                ],
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _tabController.index = 0;
                  });
                  Navigator.pop(context);
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/ck01.png',
                  ),
                ),
                title: Text(
                  'เค้กบ้านสวน',
                  style: GoogleFonts.kanit(),
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);

                  setState(() {
                    _tabController.index = 1;
                  });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/ck02.png',
                  ),
                ),
                title: Text(
                  'Smile Bekery',
                  style: GoogleFonts.kanit(),
                ),
                trailing: Icon(
                  FontAwesomeIcons.shop,
                  color: Colors.purple,
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);

                  setState(() {
                    _tabController.index = 2;
                  });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/ck03.png',
                  ),
                ),
                title: Text(
                  'กาแฟชาวดอย',
                  style: GoogleFonts.kanit(),
                ),
                trailing: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.purple,
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _tabController.index = 3;
                  });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/ck04.png',
                  ),
                ),
                title: Text(
                  'เค้ก และขนมเมืองสวรรค์',
                  style: GoogleFonts.kanit(),
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _tabController.index = 4;
                  });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/ck05.png',
                  ),
                ),
                title: Text(
                  'Cafe Cake ME',
                  style: GoogleFonts.kanit(),
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _tabController.index = 5;
                  });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/ck06.png',
                  ),
                ),
                title: Text(
                  'Cafe de อิ่ม',
                  style: GoogleFonts.kanit(),
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _tabController.index = 6;
                  });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/ck07.png',
                  ),
                ),
                title: Text(
                  'Bekery and Milk',
                  style: GoogleFonts.kanit(),
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  exit(0);
                },
                leading: Icon(
                  Icons.exit_to_app,
                ),
                title: Text(
                  'ออกจากการใช้งาน',
                  style: GoogleFonts.kanit(),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            showShopWidget('AAAA', 'assets/images/ck01.png', '028881111', 'http://www.a.com', '13.68356343,100.34234234234'),
            showShopWidget('BBBB', 'assets/images/ck02.png', '028882222', 'http://www.b.com', '13.234234234,100.2342526'),
            showShopWidget('CCCC', 'assets/images/ck03.png', '028882222', 'http://www.b.com', '13.35345,100.6834523414'),
            showShopWidget('DDDD', 'assets/images/ck04.png', '028884444', 'http://www.c.com', '13.090079,100.045895'),
            showShopWidget('EEEE', 'assets/images/ck05.png', '028885555', 'http://www.d.com', '13.35345,100.02345'),
            showShopWidget('FFFF', 'assets/images/ck06.png', '028886666', 'http://www.e.com', '13.1235574,100.00093452341'),
            showShopWidget('GGGG', 'assets/images/ck07.png', '028887777', 'http://www.f.com', '13.78345234,100.00563452'),
          ],
        ),
      ),
    );
  }

  //เมธอด แสดงหน้าข้อมูลร้าน
  Widget showShopWidget(String shopName, String shopImg, String shopPhone, String shopWeb, String shopGPS) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Text(
            shopName,
            style: GoogleFonts.kanit(
              fontSize: MediaQuery.of(context).size.height * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Image.asset(
            shopImg,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 50.0,
              right: 50.0,
            ),
            child: ListTile(
              onTap: () {
                _makePhoneCall(shopPhone);
              },
              tileColor: Colors.pink,
              leading: Icon(
                Icons.phone,
              ),
              title: Text(
                shopPhone,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 50.0,
              right: 50.0,
            ),
            child: ListTile(
              onTap: () {
                _launchInBrowser(
                  Uri.parse(shopWeb),
                );
              },
              tileColor: Colors.pink,
              leading: Icon(
                Icons.web,
              ),
              title: Text(
                shopWeb,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 50.0,
              right: 50.0,
            ),
            child: ListTile(
              onTap: () {
                _launchInBrowser(
                  // Uri.parse('https://www.google.com/maps/@'+ shopGPS +',17z'),
                  Uri.parse('https://www.google.com/maps/@${shopGPS},17z'),
                );
              },
              tileColor: Colors.pink,
              leading: Icon(
                FontAwesomeIcons.mapLocation,
                color: Colors.white,
              ),
              title: Text(
                'นำทางไปร้าน',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
