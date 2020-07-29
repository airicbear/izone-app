import 'package:flutter/material.dart';
import 'package:izoneapp/generated/l10n.dart';
import 'package:izoneapp/widgets/group_picture.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  Widget _izoneDescription(BuildContext context) {
    return ListView.custom(
      padding: const EdgeInsets.all(12.0),
      childrenDelegate: SliverChildListDelegate.fixed(
        [
          SelectableText(S.of(context).aboutIzone),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return Column(
              children: [
                Flexible(
                  child: GroupPicture(
                    imagePath:
                        'assets/images/oneiric-diary/official-photo-4-izone.jpg',
                  ),
                ),
                Expanded(
                  child: _izoneDescription(context),
                ),
              ],
            );
          } else {
            return Row(
              children: [
                Expanded(
                  child: GroupPicture(
                    imagePath:
                        'assets/images/oneiric-diary/official-photo-4-izone.jpg',
                  ),
                ),
                Flexible(
                  child: _izoneDescription(context),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
