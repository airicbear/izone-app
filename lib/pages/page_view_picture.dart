import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:photo_view/photo_view.dart';

class ViewPicturePage extends StatefulWidget {
  const ViewPicturePage({
    Key key,
    @required this.path,
    this.color,
    this.isNetwork,
  }) : super(key: key);

  final String path;
  final Color color;
  final bool isNetwork;

  @override
  State<StatefulWidget> createState() => _ViewPicturePageState();
}

class _ViewPicturePageState extends State<ViewPicturePage> {
  bool isFocused;
  bool isSaved;

  @override
  void initState() {
    super.initState();
    isFocused = false;
    isSaved = false;
  }

  _savePicture() async {
    String filename = widget.path.split('/').last;
    await GallerySaver.saveImage(widget.path).then((bool success) {
      Fluttertoast.showToast(
        msg: 'Saved $filename',
        toastLength: Toast.LENGTH_LONG,
        textColor: Theme.of(context).textTheme.bodyText1.color,
        backgroundColor: Theme.of(context).cardColor,
      );
      setState(() {
        isSaved = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: !isFocused,
        actions: !isFocused
            ? [
                widget.path.startsWith('http')
                    ? isSaved
                        ? FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.check),
                            label: Text('Saved'),
                          )
                        : FlatButton.icon(
                            onPressed: () => _savePicture(),
                            icon: Icon(Icons.save),
                            label: Text('Save picture'),
                          )
                    : Spacer(),
              ]
            : [],
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          setState(() {
            isFocused = !isFocused;
          });
        },
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: widget.color?.withOpacity(0.5) ?? Colors.black,
          ),
          imageProvider: widget.isNetwork == null || widget.isNetwork == false
              ? AssetImage(widget.path)
              : CachedNetworkImageProvider(widget.path),
          heroAttributes: PhotoViewHeroAttributes(
            tag: widget.path,
          ),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.contained * 10.0,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
