import 'package:flutter/material.dart';
import 'package:izoneapp/data/links/media_links.dart';
import 'package:izoneapp/widgets/button_media.dart';

class MediaButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ButtonBar(
            children: List<Widget>.generate(
              MediaLinks.links.length,
              (index) => MediaButton(link: MediaLinks.links[index]),
            ),
          ),
        ),
      ),
    );
  }
}
