import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'home_tab.dart';

class DetailsPage extends StatefulWidget {
  final bool isFullScreen;

  const DetailsPage({this.isFullScreen = false});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _layouts = [
      _videoInfo(),
      _channelInfo(),
      _moreInfo(),
      VideoList(isMiniList: true)
    ];

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      _layouts.clear();
    }

    return !kIsWeb
        ? WillPopScope(
            onWillPop: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeTab())),
            child: Scaffold(
              body: Column(
                children: <Widget>[
                  _buildVideoPlayer(context),
                  Expanded(
                    child: ListView(
                      children: _layouts,
                    ),
                  ),
                ],
              ),
            ),
          )
        : _buildVideoPlayer(
            context,
            isFullScreen: widget.isFullScreen,
          );
  }

  Widget _buildVideoPlayer(BuildContext context, {bool isFullScreen = false}) {
    final mediaQueryData = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(top: mediaQueryData.padding.top),
      width: mediaQueryData.size.width,
      height: mediaQueryData.orientation == Orientation.portrait
          ? 200.0
          : mediaQueryData.size.height - mediaQueryData.padding.top,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/thumbnail_demo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _videoInfo() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Title'),
          subtitle: Text('view count'),
          trailing: Icon(Icons.arrow_drop_down),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildButtonColumn(Icons.thumb_up, '1000'),
              _buildButtonColumn(Icons.thumb_down, '1000'),
              _buildButtonColumn(Icons.share, "Share"),
              _buildButtonColumn(Icons.cloud_download, "Download"),
              _buildButtonColumn(Icons.playlist_add, "Save"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButtonColumn(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Icon(
            icon,
            color: Colors.grey[700],
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _channelInfo() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/thumbnail_demo.png'),
              ),
              title: Text(
                'Channel Name',
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("15,000 subscribers"),
            ),
          ),
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.play_circle_filled,
                color: Colors.red,
              ),
              label: Text(
                "SUBSCRIBE",
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
    );
  }

  Widget _moreInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Text("Up next")),
          Text("Autoplay"),
          Switch(
            onChanged: (c) {},
            value: true,
          ),
        ],
      ),
    );
  }
}
