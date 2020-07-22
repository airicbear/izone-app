import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/lyrics/rise/LyricsRise.dart';

class AlbumRise extends Album {
  AlbumRise(BuildContext context)
      : super(
          context,
          title: "Rise",
          releaseDate: "2019-03-09",
          color: Color.fromRGBO(100, 95, 131, 1),
          songs: [
            LyricsRise(context),
          ],
        );
}
