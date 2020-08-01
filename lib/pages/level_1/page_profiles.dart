import 'package:flutter/material.dart';
import 'package:izoneapp/data/profiles/profiles.dart';
import 'package:izoneapp/widgets/grid_item_profile.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 1.0,
                maxCrossAxisExtent: 256.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileTile(
                      profile: Profiles.profiles.elementAt(index),
                    ),
                  );
                },
                childCount: Profiles.profiles.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
