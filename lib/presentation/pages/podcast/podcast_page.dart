import 'dart:math';

import 'package:faramove_assesment/constants/pallets.dart';
import 'package:faramove_assesment/presentation/pages/podcast/widgets/app_bar.dart';
import 'package:faramove_assesment/presentation/shared/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PodcastPage extends StatefulWidget {
  const PodcastPage({super.key});

  @override
  PodcastPageState createState() => PodcastPageState();
}

class PodcastPageState extends State<PodcastPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> dialogKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dialogKey.currentState?.dispose();
  }

  var dragController = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PodcastAppBar(
        onMenuTap: () {},
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/pngs/confettiCard.png'),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: '10 reasons ',
                                fontSize: 16,
                                color: Pallets.black,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              TextView(
                                text: 'Stay Inspired- Episode 1',
                                fontSize: 14,
                                color: Pallets.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          Icon(Icons.volume_up),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SliderTheme(
                    data: SliderThemeData(
                        overlayShape: SliderComponentShape.noOverlay),
                    child: Slider(
                        activeColor: Pallets.blue,
                        value: 0.3,
                        onChanged: (value) {}),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: '1:53',
                            fontSize: 12,
                            color: Pallets.black,
                            fontWeight: FontWeight.w500,
                          ),
                          TextView(
                            text: '-1:53',
                            fontSize: 12,
                            color: Pallets.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: '1X',
                            fontSize: 16,
                            color: Pallets.black,
                            fontWeight: FontWeight.w600,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/svgs/skip.svg'),
                              SizedBox(width: 22),
                              SvgPicture.asset('assets/svgs/play.svg'),
                              SizedBox(width: 22),
                              Transform.rotate(
                                  angle: pi,
                                  child:
                                      SvgPicture.asset('assets/svgs/skip.svg')),
                            ],
                          ),
                          TextView(
                            text: '1X',
                            fontSize: 16,
                            color: Colors.transparent,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            controller: dragController,
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 1,
            builder: (BuildContext context, _) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Pallets.blue,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: 'Transcript',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                TextView(
                                  text: 'Expand',
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                    'assets/svgs/externalLink.svg'),
                              ],
                            ),
                          )
                        ],
                      ),
                      ListTile(
                        onTap: () {
                          dragController.animateTo(1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        title: Text('Item '),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
