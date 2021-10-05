import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:hampayam_chat/Connection/ConnectWebSoket.dart';
import 'package:hampayam_chat/Connection/HttpConnection.dart';
import 'package:hampayam_chat/StateManagement/HomeStateManagement/ProfileProvider.dart';
import 'package:hampayam_chat/StateManagement/imageSelectorProvider.dart';
import 'dart:io';
import 'package:photo_manager/photo_manager.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../AvatarWidget.dart';

List<Asset> images = [];
int fileIndex = 0;

class ImageList extends StatefulWidget {
  String topic;
  String currentUser;

  ImageList(this.currentUser, this.topic);
  @override
  _ImageListState createState() =>
      _ImageListState(this.currentUser, this.topic);
}

class _ImageListState extends State<ImageList> {
  ProgressDialog pr;
  String topic;
  String currentUser;
  _ImageListState(this.currentUser, this.topic);
  List<AssetEntity> assets = [];
  ImageSelectorProvider imageSelectorProvider;
  _fetchAssets() async {
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final recentAlbum = albums.first;

    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0,
      end: 1000000,
    );
    imageSelectorProvider.clearData();
    if (!mounted) return;
    setState(() {
      assets = recentAssets;

      imageSelectorProvider.setLength(assets.length);
    });
  }

  String fileName;
  String path;
  Map<String, String> paths;
  List<String> extensions;
  bool isLoadingPath = false;

  @override
  void initState() {
    imageSelectorProvider = Provider.of(context, listen: false);
    super.initState();
    _fetchAssets();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);

    ProfileProvider profileProvider = Provider.of(context);

    var size = MediaQuery.of(context).size.width;
    return Consumer<ImageSelectorProvider>(builder: (context, value, child) {
      int percent =
          (value.getRecievedProgress / value.getRecievedProgress * 100).toInt();
      pr = new ProgressDialog(context,
          type: ProgressDialogType.Normal,
          isDismissible: percent == 100 ? true : false,
          showLogs: percent == 100 ? false : true,
          customBody: Text('Downloading image $percent %'));
      return Container(
        child: Stack(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: assets.length,
              itemBuilder: (_, index) {
                return Stack(
                  children: [
                    AssetThumbnail(asset: assets[index]),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          value.checkEn(!value.getImagesSelect[index], index);
                          value.checkEnBtn();
                        },
                        child: Container(
                          height: size / 20,
                          width: size / 20,
                          decoration: BoxDecoration(
                              color: value.getImagesSelect[index]
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              border:
                                  Border.all(color: Colors.white, width: 1.5)),
                          child: value.getImagesSelect[index]
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 18,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: !value.getFloatBtnEn
                  ? Container(
                      height: 90,
                      width: double.infinity,
                      color: Colors.white70,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Row(
                            children: [
                              AvatarWidget(
                                color1: "#E040FB",
                                color2: "#4FC3F7",
                                textAvatar: "Gallery",
                                icon: Icon(Entypo.picture),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: AvatarWidget(
                                      textAvatar: "File",
                                      icon: Icon(Typicons.doc_add),
                                      color1: "#FFA000",
                                      color2: "#D500F9")),
                              SizedBox(
                                width: 80,
                              ),
                              AvatarWidget(
                                  textAvatar: "Location",
                                  icon: Icon(FontAwesome.location),
                                  color1: "#00E5FF",
                                  color2: "#CCFF90"),
                              SizedBox(
                                width: 80,
                              ),
                              GestureDetector(
                                  onTap: () async {},
                                  child: AvatarWidget(
                                      textAvatar: "Audio",
                                      icon: Icon(FontAwesome5.headphones_alt),
                                      color1: "#7B1FA2",
                                      color2: "#7C4DFF")),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                            onPressed: () async {
                              await assets[value.getImagesSelect.indexOf(true)]
                                  .file
                                  .then((valueFile) async {
                                await HttpConnection.sendFile(
                                    IORouter.ipAddress,
                                    IORouter.apiKey,
                                    profileProvider.getToken,
                                    valueFile,
                                    topic, (p0, p1) {
                                  if (p1 != -1) {
                                    value.setDownloadedCounter(p0);
                                    value.setRecievedCounter(p1);
                                  }
                                }, context);
                                print(value.getFileSended);
                              });
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.send),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      );
    });
  }

  String _error = '';

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return InkWell(
          //onTap: cropImage(asset),
          child: AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          ),
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  List<File> imageFile;
}

class AssetThumbnail extends StatefulWidget {
  const AssetThumbnail({
    Key key,
    @required this.asset,
  }) : super(key: key);

  final AssetEntity asset;

  @override
  _AssetThumbnailState createState() => _AssetThumbnailState();
}

class _AssetThumbnailState extends State<AssetThumbnail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // We're using a FutureBuilder since thumbData is a future
    return FutureBuilder<Uint8List>(
      future: widget.asset.thumbData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;

        // If we have no data, display a spinner
        if (bytes == null)
          return CircularProgressIndicator(
            backgroundColor: Colors.tealAccent,
          );
        // If there's data, display it as an image
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  if (widget.asset.type == AssetType.image) {
                    // If this is an image, navigate to ImageScreen
                    return ImageScreen(imageFile: widget.asset.file);
                  } else {
                    // if it's not, navigate to VideoScreen
                    return VideoScreen(videoFile: widget.asset.file);
                  }
                },
              ),
            );
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.memory(
                  bytes,
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                ),
              ),
              if (widget.asset.type == AssetType.video)
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.14,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        Text(
                          'Time',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}

class ImageScreen extends StatelessWidget {
  const ImageScreen({
    Key key,
    @required this.imageFile,
  }) : super(key: key);

  final Future<File> imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: FutureBuilder<File>(
            future: imageFile,
            builder: (_, snapshot) {
              final file = snapshot.data;
              if (file == null) return Container();
              return Image.file(file);
            },
          ),
        ));
  }
}

class VideoScreen extends StatefulWidget {
  const VideoScreen({
    Key key,
    @required this.videoFile,
  }) : super(key: key);

  final Future<File> videoFile;

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController _controller;
  bool initialized = false;

  @override
  void initState() {
    _initVideo();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _initVideo() async {
    final video = await widget.videoFile;
    _controller = VideoPlayerController.file(video)
      // Play the video again when it ends
      ..setLooping(true)
      // initialize the controller and notify UI when done
      ..initialize().then((_) => setState(() => initialized = true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initialized
          // If the video is initialized, display it
          ? Scaffold(
              body: Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: VideoPlayer(_controller),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // Wrap the play or pause in a call to `setState`. This ensures the
                  // correct icon is shown.
                  setState(() {
                    // If the video is playing, pause it.
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      // If the video is paused, play it.
                      _controller.play();
                    }
                  });
                },
                // Display the correct icon depending on the state of the player.
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            )
          // If the video is not yet initialized, display a spinner
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class Sheet_with_horizontal_items {
  String topic;
  String currentuser;
  setData(String topic, String currentuser) {
    this.currentuser = currentuser;
    this.topic = topic;
  }

  mainBottomSheet4(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.white,
            child: Container(
              child: ImageList(this.currentuser, this.topic),
            ),
          );
        });
  }
}
