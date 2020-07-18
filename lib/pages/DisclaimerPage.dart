import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DisclaimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disclaimer'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Content rights',
              textScaleFactor: 2.0,
            ),
            subtitle: Text(
                'This is an unofficial fan-made app. This fan app and its content are not officially endorsed or produced by, nor associated with or affiliated with the music artist(s) or any associated entities of the artist(s), such as management or record label. All trademarks and copyrights are property of their respective owners.'),
          ),
          Column(
            children: [
              ListTile(
                title: Text(
                  'Content accuracy',
                  textScaleFactor: 2.0,
                ),
                subtitle: Text(
                    'The content in this app references multiple different sources. I strive to get the most accurate and up-to-date information as possible however it is not always possible. If you find that there is inaccurate information in this app please submit an issue on the GitHub page providing your sources and I will try to fix it as soon as possible.'),
              ),
              ButtonBar(
                children: [
                  FlatButton.icon(
                    label: Text('Submit an issue'),
                    icon: FaIcon(FontAwesomeIcons.github),
                    onPressed: () =>
                        launch('https://github.com/airicbear/izone-app'),
                  ),
                ],
              )
            ],
          ),
          ListTile(
            title: Text(
              'References',
              textScaleFactor: 2.0,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'There are several different sources referenced in this app including'),
                FlatButton.icon(
                  onPressed: () => launch('http://iz-one.co.kr/'),
                  icon: FaIcon(FontAwesomeIcons.globeAmericas),
                  label: Text('The official IZ*ONE website'),
                ),
                FlatButton.icon(
                  onPressed: () => launch('https://www.izone-official.com/'),
                  icon: FaIcon(FontAwesomeIcons.globeAmericas),
                  label: Text('The official IZ*ONE Japan website'),
                ),
                FlatButton.icon(
                  onPressed: () =>
                      launch('https://kprofiles.com/izone-members-profile/'),
                  icon: FaIcon(FontAwesomeIcons.globeAmericas),
                  label: Text('IZ*ONE Members Profile at KProfiles.com'),
                ),
                FlatButton.icon(
                  onPressed: () =>
                      launch('https://kpop.fandom.com/wiki/IZ*ONE'),
                  icon: FaIcon(FontAwesomeIcons.globeAmericas),
                  label: Text('IZ*ONE FANDOM KPOP Wiki Page'),
                ),
                FlatButton.icon(
                  onPressed: () => launch('https://dbkpop.com/group/izone'),
                  icon: FaIcon(FontAwesomeIcons.globeAmericas),
                  label: Text('dbkpop.com'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}