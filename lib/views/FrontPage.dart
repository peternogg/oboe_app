import 'package:flutter/material.dart';

class _FrontPageScreen extends State<FrontPage> {
  var _navIndex = 0;
  var _children = <Widget>[
    // Main screen
    // Change to ListView.builder and take objects which build the
    // list of those episodes
    ListView(
        children: <Widget>[
          ListTile(
          leading: Icon(Icons.music_note), // Cover image
          title: Text("New episodes here"), // Episode Title
          subtitle: Text("Hello, from the subtitle aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            ), // Episode Description
          ),
          ListTile(title: Text("In Progress episodes here")),
          ListTile(title: Text("Downloaded episodes here"))
        ]
      ),
      // Now playing screen
      Center(child: Text("Now playing screen")),
      // Search screen
      Center(child: Text("Search screen")),
    ];

  void _moveToTab(int index) {
    setState(() {
          _navIndex = index;
    });
  }

  @override 
  Widget build(BuildContext context) {
    var appBar = AppBar(
          title: Text("A nice app"),
        );
        
    var scaffold = Scaffold(
      appBar: appBar,
      body: _children[_navIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Menu"),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(title: Text("Playlists")),
            ListTile(title: Text("Settings")),
          ]
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: _moveToTab,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            title: Text("Suscriptions")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music),
            title: Text("Now Playing")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search")
          ),
        ]
      ),
    );

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.blueAccent
      ),
      home: scaffold
    );
  }
}

class FrontPage extends StatefulWidget {

  final state = _FrontPageScreen();

  @override
  State<StatefulWidget> createState() {
    return state;
  }
}