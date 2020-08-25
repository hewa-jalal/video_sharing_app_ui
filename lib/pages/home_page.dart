import 'package:flutter/material.dart';
import 'package:video_sharing_app_ui/pages/home_tab.dart';
import 'package:video_sharing_app_ui/pages/upload_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: UploadPage(),
        // bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          title: Text('Explote'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.subscriptions),
          title: Text('Subscriptions'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          title: Text('Notifications'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library_outlined),
          title: Text('Library'),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.red,
    );
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }
}
