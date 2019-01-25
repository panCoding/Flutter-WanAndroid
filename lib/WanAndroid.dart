import 'package:WanAndroid/tab/HomePage.dart';
import 'package:WanAndroid/tab/KnowledgePage.dart';
import 'package:WanAndroid/tab/NavigationPage.dart';
import 'package:WanAndroid/tab/ProjectPage.dart';
import 'package:WanAndroid/tab/PublicPage.dart';
import 'package:flutter/material.dart';

class WanAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'WanAndroid',
        theme: new ThemeData(primaryColor: Colors.red),
        home: WanAndroidWidget());
  }
}

class WanAndroidState extends State<WanAndroidWidget> {
  int _tabIndex = 0;
  List<BottomNavigationBarItem> _navigationViews;
  var appBarTitles = ['首页', '知识体系', '公众号', '导航', '项目'];
  var _body;

  initData() {
    _body = new IndexedStack(
      children: <Widget>[
        new HomePage(),
        new KnowledgePage(),
        new PublicPage(),
        new NavigationPage(),
        new ProjectPage()
      ],
      index: _tabIndex,
    );
  }

  @override
  void initState() {
    super.initState();
    _navigationViews = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
        icon: const Icon(
          Icons.home,
        ),
        title: new Text(
          appBarTitles[0],
        ),
        backgroundColor: Colors.red,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(
          Icons.bookmark,
        ),
        title: new Text(
          appBarTitles[1],
        ),
        backgroundColor: Colors.red,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(
          Icons.chat,
        ),
        title: new Text(
          appBarTitles[2],
        ),
        backgroundColor: Colors.red,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(
          Icons.navigation,
        ),
        title: new Text(
          appBarTitles[3],
        ),
        backgroundColor: Colors.red,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(
          Icons.library_books,
        ),
        title: new Text(
          appBarTitles[4],
        ),
        backgroundColor: Colors.red,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();

    Widget userHeader = UserAccountsDrawerHeader(
      accountName: new Text('pan'),
      accountEmail: new Text("gmail"),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: AssetImage(
          'images/avatar.png',
        ),
        radius: 35.0,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[_tabIndex]),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            tooltip: '搜索',
            onPressed: null,
          ),
        ],
      ),
      body: _body,
      bottomNavigationBar: new BottomNavigationBar(
        items: _navigationViews
            .map((BottomNavigationBarItem navigationView) => navigationView)
            .toList(),
        currentIndex: _tabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            userHeader,
            ListTile(
                title: Text('收藏'),
                leading: new CircleAvatar(
                  child: new Icon(Icons.tab),
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
              title: Text('夜间模式'),
              leading: new CircleAvatar(
                child: new Icon(Icons.wb_sunny),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('设置'),
              leading: new CircleAvatar(
                child: new Icon(Icons.settings),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('关于我们'),
              leading: new CircleAvatar(
                child: new Icon(Icons.info),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class WanAndroidWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WanAndroidState();
}
