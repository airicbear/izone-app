import 'package:flutter/material.dart';
import 'package:izoneapp/data/AppPages.dart';
import 'package:izoneapp/data/DanceVideos.dart';
import 'package:izoneapp/data/MusicVideos.dart';
import 'package:izoneapp/pages/AboutPage.dart';
import 'package:izoneapp/pages/HomePage.dart';
import 'package:izoneapp/widgets/MediaButtons.dart';
import 'package:izoneapp/pages/MembersPage.dart';
import 'package:izoneapp/widgets/AppMoreButton.dart';
import 'package:izoneapp/pages/YoutubeVideoListPage.dart';

class AppPageView extends StatefulWidget {
  AppPageView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppPageViewState();
}

class _AppPageViewState extends State<AppPageView> {
  PageController _pageController;
  AppPage _page = AppPage.HOME;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _pageTitle(BuildContext context, AppPageInfo page) {
    return GestureDetector(
      onTap: () => _pageController.animateToPage(
        page.index,
        duration: const Duration(
          milliseconds: 1000,
        ),
        curve: Curves.fastLinearToSlowEaseIn,
      ),
      child: Text(
        page.title,
        style: _page.index != page.index
            ? TextStyle(
                color: Theme.of(context).disabledColor,
              )
            : null,
      ),
    );
  }

  Widget _pageViewAppBar(BuildContext context) {
    return AppBar(
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            _pageTitle(context, AppPages.home(context)),
            _pageTitle(context, AppPages.about(context)),
            _pageTitle(context, AppPages.members(context)),
            _pageTitle(context, AppPages.dance(context)),
            _pageTitle(context, AppPages.mv(context)),
          ],
        ),
      ),
      actions: [
        AppMoreButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _pageViewAppBar(context),
      body: PageView(
        onPageChanged: (page) {
          setState(() {
            _page = AppPage.values[page];
          });
        },
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          HomePage(
            pageController: _pageController,
            pages: AppPages.pages(context).sublist(1),
          ),
          AboutPage(
            pageController: _pageController,
          ),
          MembersPage(
            pageController: _pageController,
          ),
          YoutubeVideoListPage(
            pageController: _pageController,
            videos: DanceVideos.videos(context),
          ),
          YoutubeVideoListPage(
            pageController: _pageController,
            videos: MusicVideos.videos(context),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: MediaButtons(),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
