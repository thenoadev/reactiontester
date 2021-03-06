import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart' as main;
import '../functions/misc.dart' as misc;

import '../functions/data_collection_soupmix.dart' as data_collection;
import '../games/colour_reflexes.dart' as colour_reflexes;
import '../games/text_reflexes.dart' as text_reflexes;
import '../update.dart' as update;

late int localClAvgOnline;
late int localTxAvgOnline;

class MainOnline extends StatelessWidget {
  const MainOnline({
    Key? key,
    required this.isLast,
    required this.isTest,
  }) : super(key: key);
  final bool isTest;
  final bool isLast;

  Route<Object?> dialogBuilder(
      BuildContext context,
      // ignore: require_trailing_commas
      Object? arguments) {
    return RawDialogRoute<void>(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return const update.updateApp();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ReactionTester',
          textAlign: TextAlign.justify,
        ),
        backgroundColor:
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? FlexColor.sharkLightPrimary
                : FlexColor.brandBlueDarkPrimary,
        leading: isLast == false
            ? IconButton(
                alignment: Alignment.center,
                tooltip: 'Upgrade is available !',
                onPressed: () {
                  Navigator.of(context).restorablePush(dialogBuilder);
                },
                icon: const Icon(
                  Icons.upgrade,
                ),
              )
            : null,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListView(
                addAutomaticKeepAlives: true,
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    // First page
                    onTap: () {
                      data_collection.openColourAnalytics();
                      Navigator.of(context).pushAndRemoveUntil(
                        main.createRoute(
                          const colour_reflexes.colourReflexes(),
                        ),
                        (route) => false,
                      );
                    },
                    child: IgnorePointer(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.fill,
                              child: SelectableText(
                                'Colour Matching',
                                style: TextStyle(
                                  fontFamily: (GoogleFonts.lato()).fontFamily,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.fill,
                              child: SelectableText(
                                'How fast can you\r\nlink colours together ?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: (GoogleFonts.lato()).fontFamily,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: SelectableText(
                                'Psst. You can swipe to get more info ->',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: (GoogleFonts.lato()).fontFamily,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  //
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 10,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: SelectableText(
                            'How do I play this game ?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: (GoogleFonts.lato()).fontFamily,
                              fontSize: 40,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: SelectableText(
                            'You will be given one colour \r\n You will have three buttons to choose from \r\n Be quick though ! Your reaction time is measured',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: (GoogleFonts.lato()).fontFamily,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: isTest == true
                                ? SelectableText(
                                    'Average time taken: 6713199 ms',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily:
                                          (GoogleFonts.lato()).fontFamily,
                                      fontSize: 20,
                                    ),
                                  )
                                : localClAvgOnline != 0
                                    ? SelectableText(
                                        'Average time taken: $localClAvgOnline ms',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily:
                                              (GoogleFonts.lato()).fontFamily,
                                          fontSize: 20,
                                        ),
                                      )
                                    : SelectableText(
                                        'You haven\'t played this game yet!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily:
                                              (GoogleFonts.lato()).fontFamily,
                                          fontSize: 20,
                                        ),
                                      ),
                          ),
                        ),
                        const Expanded(
                          flex: 5,
                          child: SizedBox(
                            child: Image(
                              image: AssetImage('thumbnails/crflxthb.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          //
          //
          //
          Expanded(
            flex: 3,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    // First page
                    onTap: () {
                      data_collection.openTextAnalytics();
                      Navigator.of(context).pushAndRemoveUntil(
                        main.createRoute(
                          const text_reflexes.textReflexes(),
                        ),
                        (route) => false,
                      );
                    },
                    child: IgnorePointer(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.fill,
                              child: SelectableText(
                                'Font Matching',
                                style: TextStyle(
                                  fontFamily: (GoogleFonts.lato()).fontFamily,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.fill,
                              child: SelectableText(
                                'How fast can you\r\nreunite fonts together ?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: (GoogleFonts.lato()).fontFamily,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: SelectableText(
                                'Psst. You can swipe to get more info ->',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: (GoogleFonts.lato()).fontFamily,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  //
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 10,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: SelectableText(
                            'How do I play this game ?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: (GoogleFonts.lato()).fontFamily,
                              fontSize: 40,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: SelectableText(
                            'You will be given one sentence \r\n You will have three buttons to choose from \r\n Be quick though ! Your reaction time is measured',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: (GoogleFonts.lato()).fontFamily,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: isTest == true
                                ? SelectableText(
                                    'Average time taken: 6447474 ms',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily:
                                          (GoogleFonts.lato()).fontFamily,
                                      fontSize: 20,
                                    ),
                                  )
                                : localClAvgOnline != 0
                                    ? SelectableText(
                                        'Average time taken: $localTxAvgOnline ms',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily:
                                              (GoogleFonts.lato()).fontFamily,
                                          fontSize: 20,
                                        ),
                                      )
                                    : SelectableText(
                                        'You haven\'t played this game yet!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily:
                                              (GoogleFonts.lato()).fontFamily,
                                          fontSize: 20,
                                        ),
                                      ),
                          ),
                        ),
                        const Expanded(
                          flex: 5,
                          child: FittedBox(
                            child: Image(
                              image: AssetImage('thumbnails/trflxthb.png'),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          //
          //
          //
          Expanded(
            flex: 1,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListView(
                addAutomaticKeepAlives: true,
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: 'ReactionTester',
                        applicationVersion: main.installedVersion,
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 10,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'About this app',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: (GoogleFonts.lato()).fontFamily,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      misc.launchURLMisc('http://pocoyo.rf.gd');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 10,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "About this app's developper",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: (GoogleFonts.lato()).fontFamily,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.of(context).restorablePush(dialogBuilder);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 10,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Check for updates',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: (GoogleFonts.lato()).fontFamily,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
