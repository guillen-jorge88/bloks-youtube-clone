import '../tabs/tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color textColor = Color.fromRGBO(33, 33, 33, 1.0);
  List<Widget> tabsList = [
    Tab(
      icon: Icon(Icons.home),
      text: "Home",
    ),
    Tab(
      icon: Icon(Icons.explore),
      text: "Explore",
    ),
    // Tab(
    //   icon: Icon(Icons.notifications),
    // ),
    Tab(
      icon: Icon(Icons.subscriptions),
      text: "Subscriptions",
    ),
    Tab(
      icon: Icon(Icons.video_library),
      text: "Library",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
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
          backgroundColor: Color(0xFFFFFF),
          bottom: PreferredSize(
              child: Container(
                color: Color.fromRGBO(33, 33, 33, 0.2),
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
        ),
        body: TabBarView(
          children: <Widget>[
            HomeTab(),
            ExploreTab(),
            SubscriptionsTab(),
            LibraryTab()
          ],
        ),
        bottomNavigationBar: TabBar(
          labelStyle: TextStyle(fontSize: 10, fontFamily: "Helvetica"),
          tabs: tabsList,
          labelColor: textColor,
          unselectedLabelColor: Color(0xFF909090),
          indicatorColor: Colors.transparent,
        ),
        // backgroundColor: Color(0xFF282828),
      ),
    );
  }
}
