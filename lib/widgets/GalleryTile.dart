import 'package:flutter/material.dart';
import 'package:izoneapp/pages/ViewPicturePage.dart';

class GalleryTile extends StatelessWidget {
  const GalleryTile({Key key, @required this.url, this.color})
      : super(key: key);

  final String url;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewPicturePage(
                memberImagePath: url,
                color: color,
                isNetwork: true,
              );
            },
          ),
        );
      },
      child: Hero(
        tag: url,
        child: Image.network(
          url,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.none,
          loadingBuilder:
              (BuildContext context, Widget widget, ImageChunkEvent progress) {
            if (progress == null) return widget;
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
