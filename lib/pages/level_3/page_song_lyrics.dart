import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:izoneapp/data/app_themes.dart';
import 'package:izoneapp/data/song.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongLyricsPage extends StatefulWidget {
  const SongLyricsPage({Key key, this.song, this.coverArt, this.adHeight})
      : super(key: key);

  final Song song;
  final String coverArt;
  final double adHeight;

  @override
  State<StatefulWidget> createState() => SongLyricsPageState();
}

class SongLyricsPageState extends State<SongLyricsPage>
    with TickerProviderStateMixin {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _theme;
  TabController _tabController;
  List<String> _currentLyrics;

  void _changeLyricsListener() {
    setState(() {
      _currentLyrics = widget.song.lyrics.values.toList()[_tabController.index];
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.song.lyrics.length, vsync: this);
    _tabController.addListener(_changeLyricsListener);
    _currentLyrics = widget.song.lyrics.values.toList()[0];
    _theme = _prefs.then((prefs) => prefs.getString('theme') ?? 'Auto');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _printDuration(Duration duration) {
    String twoDigitMinutes = duration.inMinutes.remainder(60).toString();
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, "0");
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _theme,
      builder: (context, snapshot) {
        ThemeData _themeData =
            AppThemes.themes(context)[snapshot.data ?? 'Auto'];
        return Theme(
          data: _themeData,
          child: Container(
            margin: EdgeInsets.only(bottom: widget.adHeight),
            child: Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 370,
                    collapsedHeight: 60,
                    backgroundColor: _themeData.primaryColor,
                    flexibleSpace: Hero(
                      tag: widget.coverArt,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.coverArt),
                            colorFilter: ColorFilter.mode(
                              _themeData.primaryColor.withOpacity(0.3),
                              BlendMode.dstATop,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(widget.song.title),
                    actions: [
                      FlatButton(
                        child: Text(
                          _printDuration(widget.song.length),
                          textScaleFactor: 1.5,
                        ),
                      ),
                    ],
                    bottom: TabBar(
                      controller: _tabController,
                      indicatorColor: _themeData.accentColor,
                      tabs: List<Tab>.generate(
                        widget.song.lyrics.length,
                        (index) => Tab(
                          text: widget.song.lyrics.keys
                              .toList()[index]
                              .toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, _index) {
                        bool isEmpty = _currentLyrics[_index].isEmpty;
                        bool isNewSection =
                            _currentLyrics[_index].startsWith('[') &&
                                _currentLyrics[_index].endsWith(']');
                        return Card(
                          clipBehavior: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                          ).clipBehavior,
                          child: InkWell(
                            onTap: () {},
                            child: ListTile(
                              title: HtmlWidget(
                                isNewSection
                                    ? _currentLyrics[_index].substring(
                                        1, _currentLyrics[_index].length - 1)
                                    : _currentLyrics[_index],
                              ),
                              tileColor: isEmpty || isNewSection
                                  ? _themeData.canvasColor
                                  : Colors.transparent,
                            ),
                          ),
                          elevation: isEmpty || isNewSection ? 0 : 1,
                        );
                      },
                      childCount: _currentLyrics.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
