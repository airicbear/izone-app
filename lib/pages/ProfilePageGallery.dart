import 'package:flutter/material.dart';
import 'package:izoneapp/data/Member.dart';
import 'package:izoneapp/widgets/GalleryTile.dart';

class ProfilePageGallery extends StatelessWidget {
  const ProfilePageGallery({Key key, this.member}) : super(key: key);

  final Member member;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => GalleryTile(
          url: member.galleryUrlList.elementAt(index),
          color: member.color.withOpacity(0.2),
        ),
        childCount: member.galleryUrlList?.length ?? 0,
      ),
    );
  }
}
