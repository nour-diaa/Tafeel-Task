import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/details_provider.dart';

import '../widgets/image_container.dart';

class DetailsScreen extends StatelessWidget {
  final int userId;

  DetailsScreen(this.userId);

  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    DetailsProvider _detailsProvider = Provider.of<DetailsProvider>(context);
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: Color(0xff148EFF),
      body: FutureBuilder(
          future: _detailsProvider.fetchUser(userId),
          builder: (context, AsyncSnapshot<User> snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Container(
                width: screenWidth,
                height: screenHeight,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Text(
                          '${snapshot.data.fname} ${snapshot.data.lname}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: ImageContainer(snapshot.data.avatar,
                          size: screenWidth),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Text(
                          '${snapshot.data.email}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasData) {
              return Center(child: Text('Failed to get data :('));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
