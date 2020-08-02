import 'package:flutter/material.dart';
import 'package:izoneapp/data/youtube_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoListPage extends StatefulWidget {
  const YoutubeVideoListPage({Key key, this.videos}) : super(key: key);

  final List<YoutubeVideo> videos;

  @override
  State<StatefulWidget> createState() => YoutubeVideoListPageState();
}

class YoutubeVideoListPageState extends State<YoutubeVideoListPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _VideoListing(
                      youtubeVideo: widget.videos.elementAt(index),
                    );
                  },
                  childCount: widget.videos.length,
                ),
              ),
            ],
          );
        } else {
          return CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 512.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _VideoListing(
                      youtubeVideo: widget.videos.elementAt(index),
                    );
                  },
                  childCount: widget.videos.length,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class _VideoListing extends StatelessWidget {
  final YoutubeVideo youtubeVideo;

  const _VideoListing({Key key, @required this.youtubeVideo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
      ).clipBehavior,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: youtubeVideo.youtubeId,
                ),
              ),
              builder: (context, player) {
                return player;
              },
            ),
          ),
        ),
        splashFactory: InkRipple.splashFactory,
        child: Column(
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    YoutubePlayer.getThumbnail(
                      videoId: youtubeVideo.youtubeId,
                    ),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              tileColor: Theme.of(context).cardColor,
              title: Text('${youtubeVideo.title}'),
              subtitle: Text(youtubeVideo.subtitle),
              trailing: Text(
                MaterialLocalizations.of(context).formatCompactDate(
                  youtubeVideo.date,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
