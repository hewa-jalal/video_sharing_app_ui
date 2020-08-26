import 'package:animated_card/animated_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_sharing_app_ui/responsive_widget.dart';

import 'details_page.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    Key key,
    this.isMiniList = false,
  }) : super(key: key);

  final bool isMiniList;

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool get isMiniList => widget.isMiniList;

  Widget _buildLandscapeList() {
    return InkWell(
      onTap: () => _goToDetailsPage(),
      child: AnimatedCard(
        child: Row(
          children: [
            Container(
              width: isMiniList
                  ? MediaQuery.of(context).size.width / 2
                  : 336.0 / 1.5,
              height: isMiniList ? 100.0 : 188.0 / 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/thumbnail_demo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 12.0),
                    dense: isMiniList ? true : false,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text('Video Title'),
                    ),
                    subtitle:
                        Text('Channel Name,   View Count,  Published Time'),
                    trailing: Container(
                      child: Icon(Icons.more_vert),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: !isMiniList
                        ? CircleAvatar(
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.red,
                          )
                        : SizedBox(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWebGrid() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AnimatedCard(
      child: Column(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => _goToDetailsPage(isFullScreen: true),
              child: Image.asset(
                'assets/images/thumbnail_demo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            dense: true,
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
              backgroundColor: Colors.red,
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text('Video Title'),
            ),
            subtitle: Text('Channel Name,   View Count,  Published Time'),
            trailing: Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortraitList() {
    return AnimatedCard(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () => _goToDetailsPage(),
            child: Container(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                'assets/images/thumbnail_demo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            dense: true,
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
              backgroundColor: Colors.red,
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text('Video Title'),
            ),
            subtitle: Text('Channel Name,   View Count,  Published Time'),
            trailing: Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }

  void _goToDetailsPage({bool isFullScreen = false}) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailsPage(isFullScreen: isFullScreen),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: !kIsWeb
            ? ListView.separated(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 10,
                separatorBuilder: (context, index) => Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                itemBuilder: (context, index) {
                  if (isMiniList ||
                      deviceOrientation == Orientation.landscape) {
                    return _buildLandscapeList();
                  }
                  return _buildPortraitList();
                },
              )
            : ResponsiveWidget(
                largeScreen: GridView.count(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  crossAxisCount: 5,
                  children: List.generate(
                    12,
                    (index) => _buildWebGrid(),
                  ),
                ),
                smallScreen: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index) => Divider(
                    height: 1.0,
                    color: Colors.grey,
                  ),
                  itemBuilder: (context, index) => _buildPortraitList(),
                ),
              ),
      ),
    );
  }
}

// class ProjectWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return AnimatedCard(
//       child: Card(
//         margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0),
//         child: InkWell(
//           // onTap: () => print(),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Expanded(
//                     flex: 40,
//                     child: Image.asset(
//                       'assets/images/thumbnail_demo.png',
//                       width: width * .25,
//                       height: width * .25,
//                     )),
//                 Expanded(
//                   flex: 3,
//                   child: Container(),
//                 ),
//                 Expanded(
//                   flex: 60,
//                   child: Container(
//                     padding: EdgeInsets.only(top: 8.0),
//                     child: Wrap(
//                       direction: Axis.horizontal,
//                       children: <Widget>[
//                         Text('_project.name'),
//                         SizedBox(height: height * .01),
//                         Text(
//                           '_project.description',
//                           textScaleFactor: 1.2,
//                           style: Theme.of(context).textTheme.caption,
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class VideoList extends StatelessWidget {
  final bool isMiniList;
  final bool isHorizontalList;

  const VideoList({this.isMiniList = false, this.isHorizontalList = false});

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    if (isHorizontalList) {
      return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return InkWell(
            // onTap: () {
            //   Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => VideoDetail(
            //       detail: listData[index],
            //     ),
            //   ));
            // },
            child: _buildHorizontalList(context, index),
          );
        },
      );
    } else {
      return ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          if (isMiniList || deviceOrientation == Orientation.landscape) {
            return InkWell(
              // onTap: () {
              //   Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => VideoDetail(
              //       detail: listData[index],
              //     ),
              //   ));
              // },
              child: _buildLandscapeList(context, index),
            );
          } else {
            return InkWell(
              // onTap: () {
              //   Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => VideoDetail(
              //       detail: listData[index],
              //     ),
              //   ));
              // },
              child: _buildPortraitList(context, index),
            );
          }
        },
        separatorBuilder: (context, index) => Divider(
          height: 1.0,
          color: Colors.grey,
        ),
        itemCount: 5,
      );
    }
  }

  Widget _buildPortraitList(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/youtube_size.png'),
                fit: BoxFit.cover),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          dense: true,
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text('listData[index].title'),
          ),
          subtitle: Text("channel . viewCount . uploade date"),
          trailing: Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Icon(Icons.more_vert)),
        ),
      ],
    );
  }

  Widget _buildLandscapeList(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Container(
//          width: MediaQuery.of(context).size.width / 2,
            width: isMiniList
                ? MediaQuery.of(context).size.width / 2
                : 336.0 / 1.5,
            height: isMiniList ? 100.0 : 188.0 / 1.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/thumbnail_demo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  dense: isMiniList ? true : false,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text('Title'),
                  ),
                  subtitle: !isMiniList
                      ? Text('Channel Title, View Count, Published Time')
                      : Text('Channel Title, View Count'),
                  trailing: Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                      child: Icon(Icons.more_vert)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: !isMiniList
                      ? CircleAvatar(
                          child: Icon(Icons.person, color: Colors.red),
                        )
                      : SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalList(BuildContext context, int index) {
    return Container(
      width: 336.0 / 2.2,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 4.0),
            width: 336.0 / 2.2,
            height: 188 / 2.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/thumbnail_demo.png'),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        'Title',
                        style: TextStyle(fontSize: 12.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Channel Title',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                size: 16.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
