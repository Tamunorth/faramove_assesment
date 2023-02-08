import 'package:faramove_assesment/constants/pallets.dart';
import 'package:faramove_assesment/presentation/pages/home/widgets/app_bar.dart';
import 'package:faramove_assesment/presentation/shared/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> dialogKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dialogKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: HomeAppBar(
        onMenuTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Pallets.blueGreyDark,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Row(
                children: [
                  IconContainer(
                    icon: SvgPicture.asset('assets/svgs/home_warning.svg'),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextView(
                      text: 'Go to your profile to complete\nregistration',
                      fontSize: 12,
                      color: Pallets.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset('assets/svgs/arrow.svg'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextView(
                      text: 'Quick Actions',
                      fontSize: 16,
                      color: Pallets.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  HomeCard(
                    title: 'Book a session',
                    subTitle:
                        'Get prompt assistance from medical professionals.',
                    iconPath: 'assets/svgs/stetoscope.svg',
                  ),
                  HomeCard(
                    title: 'Diary',
                    subTitle:
                        'Listen to the highlight from your previous session',
                    iconPath: 'assets/svgs/homeBook.svg',
                    bgColor: Pallets.deepOrange,
                    subTitleColor: Pallets.lightOrange,
                  ),
                  HomeCard(
                    title: 'Virtual assistant',
                    subTitle:
                        'Get easy access to converse with the assistant on how you feel.',
                    iconPath: 'assets/svgs/headshet.svg',
                    bgColor: Pallets.deepPurple,
                    subTitleColor: Pallets.lightPurple,
                  ),
                ],
              ),
            ),
            Container(
              height: 4,
              color: Pallets.blueGrey,
              width: double.infinity,
            ),
            HomeActionTile(
              title: 'Upcoming Session (0)',
            ),
            Container(
              height: 4,
              color: Pallets.blueGrey,
              width: double.infinity,
            ),
            HomeActionTile(
              title: 'Tips to stay healthy',
              subtitle: 'Get simple health tips.',
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeActionTile extends StatelessWidget {
  const HomeActionTile({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: title,
                fontSize: 16,
                color: Pallets.black,
                fontWeight: FontWeight.w700,
              ),
              if (subtitle != null)
                TextView(
                  text: subtitle!,
                  fontSize: 12,
                  color: Pallets.grey,
                  fontWeight: FontWeight.w400,
                ),
            ],
          ),
          SvgPicture.asset('assets/svgs/arrow.svg'),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconPath,
    this.bgColor,
    this.subTitleColor,
  });

  final String title;
  final String subTitle;
  final String iconPath;
  final Color? bgColor;
  final Color? subTitleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: bgColor ?? Pallets.deepYellow,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: title,
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 6),
              SizedBox(
                width: 188,
                child: TextView(
                    color: subTitleColor ?? Pallets.lightYellow,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    text: subTitle),
              )
            ],
          ),
          SvgPicture.asset(iconPath),
        ],
      ),
    );
  }
}
