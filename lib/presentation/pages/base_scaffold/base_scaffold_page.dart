import 'dart:ui';

import 'package:faramove_assesment/constants/pallets.dart';
import 'package:faramove_assesment/presentation/pages/community/community_page.dart';
import 'package:faramove_assesment/presentation/pages/home/home_page.dart';
import 'package:faramove_assesment/presentation/shared/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseScaffoldPage extends StatefulWidget {
  const BaseScaffoldPage({super.key});

  @override
  BaseScaffoldPageState createState() => BaseScaffoldPageState();
}

class BaseScaffoldPageState extends State<BaseScaffoldPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> dialogKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dialogKey.currentState?.dispose();
  }

  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    Center(
      child: Icon(
        Icons.camera,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.camera,
        size: 150,
      ),
    ),
    CommunityPage(),
    Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextView(
          text: 'Quick Actions',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, value, child) {
          return Scaffold(
            key: scaffoldKey,
            extendBody: true,
            body: IndexedStack(
              index: value,
              children: _pages,
            ),
            bottomNavigationBar: SizedBox(
              height: 90,
              child: Stack(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                      child: Container(
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  BottomNavigationBar(
                    backgroundColor: Pallets.navBarColor,
                    elevation: 0,
                    // fixedColor: Pallets.navBarColor,
                    selectedItemColor: Pallets.blue,
                    unselectedItemColor: Pallets.black,
                    type: BottomNavigationBarType.fixed,
                    selectedLabelStyle:
                        TextStyle(fontSize: 12, fontFamily: 'Mulish'),
                    unselectedLabelStyle:
                        TextStyle(fontSize: 12, fontFamily: 'Mulish'),
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: _selectedIndex.value == 0
                            ? SvgPicture.asset(
                                'assets/svgs/homeSelected.svg',
                                width: 24,
                                height: 24,
                              )
                            : SvgPicture.asset(
                                'assets/svgs/home.svg',
                                width: 24,
                                height: 24,
                              ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/svgs/actions.svg',
                          width: 24,
                          height: 24,
                        ),
                        label: 'Resources',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/svgs/calendar.svg',
                          width: 24,
                          height: 24,
                        ),
                        label: 'Session',
                      ),
                      BottomNavigationBarItem(
                        icon: _selectedIndex.value == 3
                            ? SvgPicture.asset(
                                'assets/svgs/comSelected.svg',
                                width: 24,
                                height: 24,
                              )
                            : SvgPicture.asset(
                                'assets/svgs/community.svg',
                                width: 24,
                                height: 24,
                              ),
                        label: 'Community',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/svgs/account.svg',
                          width: 24,
                          height: 24,
                        ),
                        label: 'Account',
                      ),
                    ],
                    currentIndex: value,
                    onTap: _onItemTapped,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
