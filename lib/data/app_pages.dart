import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/data/videos/youtube_videos.dart';
import 'package:izoneapp/generated/l10n.dart';
import 'package:izoneapp/pages/level_1/page_about.dart';
import 'package:izoneapp/pages/level_1/page_home.dart';
import 'package:izoneapp/pages/level_1/page_lyrics.dart';
import 'package:izoneapp/pages/level_1/page_media.dart';
import 'package:izoneapp/pages/level_1/page_profiles.dart';
import 'package:izoneapp/pages/level_1/page_youtube_video_list.dart';

enum AppPage { HOME, ABOUT, PROFILES, LYRICS, DANCE, MV, MEDIA }

class AppPageInfo {
  final String title;
  final String longTitle;
  final int index;
  final Widget icon;
  final Widget page;

  AppPageInfo({
    this.title,
    this.longTitle,
    this.index,
    this.icon,
    this.page,
  });
}

class AppPages {
  static List<AppPageInfo> pages(
    BuildContext context,
    PageController pageController,
    ScrollController appBarController,
  ) {
    return [
      AppPageInfo(
        title: S.of(context).home,
        longTitle: S.of(context).home,
        index: AppPage.HOME.index,
        icon: Icon(Icons.home),
        page: HomePage(
          pageController: pageController,
          appBarController: appBarController,
        ),
      ),
      AppPageInfo(
        title: S.of(context).about,
        longTitle: 'About IZ*ONE',
        index: AppPage.ABOUT.index,
        icon: FaIcon(FontAwesomeIcons.infoCircle),
        page: AboutPage(),
      ),
      AppPageInfo(
        title: S.of(context).profile,
        longTitle: 'Profile',
        index: AppPage.PROFILES.index,
        icon: FaIcon(FontAwesomeIcons.userFriends),
        page: MembersPage(),
      ),
      AppPageInfo(
        title: S.of(context).lyrics,
        longTitle: 'Song lyrics',
        index: AppPage.LYRICS.index,
        icon: FaIcon(FontAwesomeIcons.readme),
        page: LyricsPage(),
      ),
      AppPageInfo(
        title: S.of(context).dance,
        longTitle: 'Dance videos',
        index: AppPage.DANCE.index,
        icon: FaIcon(FontAwesomeIcons.video),
        page: YoutubeVideoListPage(
          videos: YoutubeVideos(context).tagged(['dance']),
        ),
      ),
      AppPageInfo(
        title: 'MV',
        longTitle: 'Music videos',
        index: AppPage.MV.index,
        icon: FaIcon(FontAwesomeIcons.film),
        page: YoutubeVideoListPage(
          videos: YoutubeVideos(context).tagged(['mv']),
        ),
      ),
      AppPageInfo(
        title: S.of(context).media,
        longTitle: 'Social media & platforms',
        index: AppPage.MEDIA.index,
        icon: Icon(Icons.live_tv),
        page: MediaPage(),
      ),
    ];
  }

  static void scrollAppBarToPage(
    AppPageInfo page,
    ScrollController appBarController,
  ) {
    appBarController.animateTo(
      page.index * 50.0,
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  static void goToPage(
    AppPageInfo page,
    PageController pageController,
    ScrollController appBarController,
  ) {
    pageController.animateToPage(
      page.index,
      duration: const Duration(
        milliseconds: 1000,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    scrollAppBarToPage(page, appBarController);
  }
}
