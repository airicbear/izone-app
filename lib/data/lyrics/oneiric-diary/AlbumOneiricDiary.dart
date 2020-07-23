import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/LyricsSecretStoryOfTheSwan.dart';

class AlbumOneiricDiary extends Album {
  AlbumOneiricDiary(BuildContext context)
      : super(
          context,
          title: "Oneiric Diary",
          releaseDate: "2020-06-15",
          color: Color.fromRGBO(198, 172, 195, 1),
          songs: [
            LyricsSecretStoryOfTheSwan(context),
          ],
        );

  @override
  int index;
}
