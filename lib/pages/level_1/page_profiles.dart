import 'package:flutter/material.dart';
import 'package:izoneapp/data/profiles/profiles.dart';
import 'package:izoneapp/widgets/grid_item_profile.dart';

class ProfilesPage extends StatelessWidget {
  final double adHeight;

  const ProfilesPage({
    Key key,
    @required this.adHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: (adHeight - 50).abs()),
        child: CustomScrollView(
          key: PageStorageKey(ProfilesPage),
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
                      adHeight: adHeight,
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
