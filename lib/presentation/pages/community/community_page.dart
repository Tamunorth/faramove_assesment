import 'package:faramove_assesment/constants/pallets.dart';
import 'package:faramove_assesment/presentation/pages/community/widgets/app_bar.dart';
import 'package:faramove_assesment/presentation/pages/podcast/podcast_page.dart';
import 'package:faramove_assesment/presentation/shared/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  CommunityPageState createState() => CommunityPageState();
}

class CommunityPageState extends State<CommunityPage> {
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
      appBar: CommunityAppBar(
        onMenuTap: () {},
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 1,
                  color: Color(0xffC9CDD3),
                  width: double.infinity,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/useDrugs.svg'),
                        SizedBox(
                          width: 14,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 125,
                              child: TextView(
                                text: 'Talks about treatment, Pathways',
                                fontSize: 14,
                                maxLines: 2,
                                textOverflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/svgs/person.svg'),
                                SizedBox(
                                  width: 7,
                                ),
                                TextView(
                                  text: '200+',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                SvgPicture.asset('assets/svgs/letterbox.svg'),
                                SizedBox(
                                  width: 12,
                                ),
                                TextView(
                                  text: '50',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Image.asset(
                              'assets/pngs/avater.png',
                              height: 28,
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PodcastPage()));
                      },
                      child: Container(
                        height: 32,
                        width: 78,
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Pallets.blue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: TextView(
                            text: 'Join',
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          }),
    );
  }
}
