import 'package:flutter/material.dart';
import '../tabs/tabs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Color textColor = Color.fromRGBO(33, 33, 33, 1.0);
  int _currentIndex = 0;

  List<Tab> tabsList = [
    Tab(
      icon: Icon(Icons.home),
      text: "Home",
    ),
    Tab(
      icon: Icon(Icons.explore),
      text: "Explore",
    ),
    Tab(
      icon: Icon(
        Icons.add_circle_outline,
        size: 48.0,
      ),
      text: '',
    ),
    Tab(
      icon: Icon(Icons.subscriptions),
      text: "Subscriptions",
    ),
    Tab(
      icon: Icon(Icons.video_library),
      text: "Library",
    )
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabsList.length);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsList.length,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
        appBar: AppBar(
          elevation: 1.5,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 35.0,
                    child: Image.asset('assets/logo.png'),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Youtube',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.cast, color: textColor),
                  SizedBox(
                    width: 15.0,
                  ),
                  Icon(Icons.notifications_none, color: textColor),
                  SizedBox(
                    width: 15.0,
                  ),
                  Icon(Icons.search, color: textColor),
                  SizedBox(
                    width: 15.0,
                  ),
                ],
              )
            ],
          ),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
          // bottom: PreferredSize(
          //   child: Container(
          //     color: Color.fromRGBO(33, 33, 33, 0.2),
          //     height: 1.0,
          //   ),
          //   preferredSize: Size.fromHeight(4.0),
          // ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            HomeTab(),
            ExploreTab(),
            Container(),
            SubscriptionsTab(),
            LibraryTab(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 2.0,
              ),
            ],
          ),
          child: TabBar(
            controller: _tabController,
            labelStyle: TextStyle(fontSize: 10, fontFamily: "Helvetica"),
            tabs: tabsList,
            labelColor: textColor,
            unselectedLabelColor: Color(0xFF909090),
            indicatorColor: Colors.transparent,
            onTap: (value) => _onItemTapped(value, context),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    (index == 2) ? showSheet(context) : _currentIndex = index;
    print('index:::::: $index');
  }

  void showSheet(BuildContext context) {
    _tabController?.index = _currentIndex;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: Color(0xff757575),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.upload),
                    title: Text('Upload a video'),
                    onTap: () => {}),
                ListTile(
                  leading: Icon(Icons.wifi_tethering),
                  title: Text('Stream a video'),
                  onTap: () => {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
