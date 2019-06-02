import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

import '../widgets/list_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController gridController = ScrollController();

  @override
  void initState() {
    super.initState();
    gridController.addListener(() {
      if (gridController.position.pixels >=
          gridController.position.maxScrollExtent)
        setState(() {
          Provider.of<UserProvider>(context).fetchUsers();
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FutureBuilder(
          future: userProvider.fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done ||
                userProvider.users().length > 1) {
              if (snapshot.hasData) {
                // one loading, got the data
                return GridView.builder(
                  controller: gridController,
                  itemCount: userProvider.users().length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 3),
                  itemBuilder: (BuildContext context, int index) {
                    return UserItem(userProvider.users()[index]);
                  },
                );
              } else {
                // done loading with no data
                return Center(child: Text('have no data'));
              }
            } else {
              // still loading users
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    gridController.dispose();
    super.dispose();
  }
}
