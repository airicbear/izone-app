import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';

class AlbumDDDance extends Album {
  AlbumDDDance(BuildContext context)
      : super(
          context,
          title: "D-D-Dance",
          releaseDate: "2021-01-26",
          color: Color.fromRGBO(75, 61, 97, 1),
          songs: [],
        );

  @override
  int index;
}
