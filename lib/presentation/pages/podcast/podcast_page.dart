import 'package:faramove_assesment/presentation/pages/podcast/widgets/app_bar.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PodcastAppBar(
        onMenuTap: () {},
      ),
      body: Container(),
    );
  }
}
